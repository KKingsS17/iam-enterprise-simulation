# ===============================================
# CONFIG
# ===============================================
$csvPath = "C:\Users\kenda\Documents\iam-enterprise-simulation\lifecycle-automation\data\employees.csv"
$logDir = "C:\Users\kenda\Documents\iam-enterprise-simulation\lifecycle-automation\logs"
$logFile = "$logDir\lifecycle_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
$globalLogFile = "$logDir\lifecycle_global.log"
$reportPath = "$logDir\access_report_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv"
$defaultPassword = "JujutsuKaisen17."

# ===============================================
# INIT
# ===============================================
New-Item -ItemType Directory -Path $logDir -Force | Out-Null
$employees = Import-Csv $csvPath
$report = @()

# ===============================================
# LOGGING
# ===============================================
function Write-Log {
    param(
        [string]$message,
        [ValidateSet("INFO","SUCCESS","ERROR")] [string]$Level = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "$timestamp [$level] - $message"
    Write-Host $line
    Add-Content -Path $logFile -Value $line
    Add-Content -Path $globalLogFile -Value $line
}

# ===============================================
# VALIDATION
# ===============================================
function Test-EmployeeRecord {
    param([object]$emp)

    $missing = @()
    if (-not $emp.email) { $missing += "email" }
    if (-not $emp.department) { $missing += "department" }
    if (-not $emp.role) { $missing += "role" }
    if ($emp.status -notin @("active","terminated")) { $missing += "status" }

    if ($missing.Count -gt 0) {
        Write-Log "Invalid record [$($emp.name)]: Missing/invalid fields -> $($missing -join ', ')" "ERROR"
        Write-Log "Raw: $($emp | ConvertTo-Json -Compress)" "ERROR"
        return $false
    }
    return $true
}

# ===============================================
# GRAPH HELPERS
# ===============================================
function Get-UserByUPN {
    param([string]$upn)

    $user = Get-MgUser `
        -Filter "userPrincipalName eq '$upn'" `
        -Property "id,displayName,userPrincipalName,department,jobTitle,country,accountEnabled" `
        -ConsistencyLevel eventual

    return $user | Select-Object -First 1
}

function Get-Group {
    param([string]$name)

    $group = Get-MgGroup -Filter "displayName eq '$name'" -ConsistencyLevel eventual
    if (-not $group) {
        Write-Log "Group not found: $name" "ERROR"
        return $null
    }
    return $group | Select-Object -First 1
}

function Is-UserInGroup {
    param(
        [string]$userId,
        [string]$groupName,
        $userGroups
    )

    foreach ($g in $userGroups) {
        if ($g.AdditionalProperties.displayName -eq $groupName) {
            return $true
        }
    }

    return $false
}

function Add-UserToGroup {
    param([string]$userId, [string]$groupId, $user, $group)

    try {
        New-MgGroupMember -GroupId $groupId -DirectoryObjectId $userId -ErrorAction Stop
        Write-Log "Added $($user.userPrincipalName) to group '$($group.displayName)'" "SUCCESS"
    }
    catch {
        Write-Log "Failed adding $($user.userPrincipalName) to group '$($group.displayName)' - $($_.Exception.Message)" "ERROR"
    }
}

function Update-UserGroups {
    param([string]$userId, $user, $userGroups)

    foreach ($g in $userGroups) {
        $name = $g.AdditionalProperties.displayName
        if ($name -like "IAM-*-*") {
            try {
                Remove-MgGroupMemberDirectoryObjectByRef -GroupId $g.Id -DirectoryObjectId $userId -ErrorAction Stop
                Write-Log "Removed $($user.userPrincipalName) from group '$name'" "SUCCESS"
            }
            catch {
                Write-Log "Failed removing $($user.userPrincipalName) from group '$name'" "ERROR"
            }
        }
    }
}

function Remove-UserFromAllGroups {
    param(
        [string]$userId,
        $user,
        $userGroups
    )

    foreach ($g in $userGroups) {
        $name = $g.AdditionalProperties.displayName

        try {
            Remove-MgGroupMemberDirectoryObjectByRef `
                -GroupId $g.Id `
                -DirectoryObjectId $userId `
                -ErrorAction Stop

            Write-Log "Removed $($user.userPrincipalName) from group '$name'" "SUCCESS"
        }
        catch {
            Write-Log "Failed removing $($user.userPrincipalName) from '$name'" "ERROR"
        }
    }
}

# ===============================================
# MAIN
# ===============================================
Write-Log "Starting lifecycle processing..."

foreach ($emp in $employees) {

    $userGroups = $null

    if (-not (Test-EmployeeRecord $emp)) { continue }

    $upn = $emp.email
    $groupName = "IAM-$($emp.department)-$($emp.role)"
    $user = Get-UserByUPN $upn
    $names = $emp.name.Split(" ")
    $firstName = $names[0]
    $lastName = $names[1]

    # ===================JOINER====================
    if ($emp.status -eq "active" -and -not $user) {

        Write-Log "Creating user $upn"

        $newUser = New-MgUser `
            -DisplayName $emp.name `
            -UserPrincipalName $upn `
            -GivenName $firstName `
            -Surname $lastName `
            -MailNickname ($emp.name -replace " ","") `
            -AccountEnabled `
            -PasswordProfile @{Password=$defaultPassword;ForceChangePasswordNextSignIn=$true} `
            -Department $emp.department `
            -JobTitle $emp.role `
            -Country $emp.country `
            -CompanyName "KKingsS"

        Write-Log "User $($newUser.userPrincipalName) successfully created" "SUCCESS"
        $user = $newUser

        $group = Get-Group $groupName
        if ($group) {
            Write-Log "Adding $($user.userPrincipalName) to group '$($group.displayName)'"
            Add-UserToGroup $newUser.Id $group.Id $user $group
        }
    }

    # ===================MOVER===================
    elseif ($emp.status -eq "active" -and $user) {

        $userGroups = Get-MgUserMemberOf -UserId $user.Id -All
        $changes = @{}

        if ($emp.department -ne $user.department) {
            $changes["Department"] = "$($user.department) -> $($emp.department)"
        }
        if ($emp.name -ne $user.displayName) {
            $changes["DisplayName"] = "$($user.displayName) -> $($emp.name)"
        }
        if ($emp.role -ne $user.jobTitle) {
            $changes["JobTitle"] = "$($user.jobTitle) -> $($emp.role)"
        }
        if ($emp.country -ne $user.country) {
            $changes["Country"] = "$($user.country) -> $($emp.country)"
        }
        if ($changes.Count -eq 0) {
            Write-Log "No attribute changes for $($user.userPrincipalName)"
        }
        else{
            foreach ($key in $changes.Keys) {
                Write-Log "Updated property '$key' for $($user.userPrincipalName): $($changes[$key])" "SUCCESS"
            }

            $params = @{}

            if ($changes.ContainsKey("Department")) { $params["Department"] = $emp.department }
            if ($changes.ContainsKey("JobTitle")) { $params["JobTitle"] = $emp.role }
            if ($changes.ContainsKey("Country")) { $params["Country"] = $emp.country }

            Update-MgUser -UserId $user.Id @params

            $group = Get-Group $groupName
            if ($group) {

                if (Is-UserInGroup $user.Id $groupName $userGroups) {
                    Write-Log "No group changes needed for $($user.userPrincipalName)"
                }
                else {
                    Write-Log "Group update required for $($user.userPrincipalName)"

                    Update-UserGroups $user.Id $user $userGroups
                    Add-UserToGroup $user.Id $group.Id $user $group
                }
            }
        }
    }

    # ==================LEAVER===================
    elseif ($emp.status -eq "terminated" -and $user) {

        if ($user.accountEnabled) {

            Write-Log "Disabling user $($user.userPrincipalName)"
            $userGroups = Get-MgUserMemberOf -UserId $user.Id -All

            Remove-UserFromAllGroups $user.Id $user $userGroups
            $revokeSessions = Revoke-MgUserSignInSession -UserId $user.Id
            Update-MgUser -UserId $user.Id -AccountEnabled:$false
            Write-Log "User $($user.userPrincipalName) was successfully disabled" "SUCCESS"
        }
    }

    # ==================REPORT===================
    if ($user) {

        $freshUser = Get-MgUser -UserId $user.Id `
        -Property "displayName,userPrincipalName,department,jobTitle,accountEnabled,country"

        $userGroups = Get-MgUserMemberOf -UserId $user.Id -All
        
        $groupNames = $userGroups | ForEach-Object { $_.AdditionalProperties.displayName }

        $report += [PSCustomObject]@{
            Name = $freshUser.displayName
            Email = $freshUser.userPrincipalName
            Department = if ($freshUser.Department) { $freshUser.Department } else { $emp.department }
            Role = $freshUser.jobTitle
            Country = $freshUser.country
            Status = if ($freshUser.accountEnabled) { "Enabled" } else { "Disabled" }
            Groups = ($groupNames -join ", ")
        }
    }
}

$report | Export-Csv $reportPath -NoTypeInformation
Write-Log "Process completed"