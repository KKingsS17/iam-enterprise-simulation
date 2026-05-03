$users = Get-MgUser -All -Property "UserPrincipalName,displayName,AccountEnabled,SignInActivity"
$report = @()

$groupRoleMapping = @{
    "IAM-IT-System Administrator" = @("Global Administrator")

    "IAM-IT-Cybersecurity Analyst" = @(
        "Security Reader",
        "Security Administrator(Eligible)"
    )

    "IAM-IT-Service Desk Technician" = @(
        "User Administrator",
        "Authentication Administrator"
    )

    "IAM-Finance-Accounting Manager" = @("Billing Administrator")

    "IAM-Sales-Account Executive" = @("Guest Inviter")

    "IAM-Software Development-Product Manager" = @(
        "Cloud Application Administrator",
        "Reports Reader"
    )

    "IAM-Software Development-Software Architect" = @(
        "Cloud Application Administrator",
        "Reports Reader"
    )

    "IAM-Software Development-Software Developer" = @(
        "Application Developer",
        "Directory Readers"
    )

    "IAM-Human Resources-HR Management" = @("Directory Readers")
}

$highRiskGroups = @("IAM-IT-System Administrator")
$mediumRiskGroups = @(
    "IAM-Finance-Accounting Manager",
    "IAM-IT-Service Desk Technician",
    "IAM-IT-Cybersecurity Analyst",
    "IAM-Software Development-Product Manager",
    "IAM-Software Development-Software Architect",
    "IAM-Software Development-Software Developer"
)

$privilegedRoles = @("Global Administrator")

foreach ($user in $users) {

    $memberships = Get-MgUserMemberOf -UserId $user.Id -All

    $groups = @()
    $directRoles = @()
    $inheritedRoles = @()

    foreach ($item in $memberships) {
        $type = $item.AdditionalProperties.'@odata.type'

        if ($type -eq "#microsoft.graph.group") {
            $groups += $item.AdditionalProperties.displayName
        }
        elseif ($type -eq "#microsoft.graph.directoryRole") {
            $directRoles += $item.AdditionalProperties.displayName
        }
    }

    foreach ($group in $groups) {
        if ($groupRoleMapping.ContainsKey($group)) {
            $inheritedRoles += $groupRoleMapping[$group]
        }
    }

    $directRoles = $directRoles | Sort-Object -Unique
    $inheritedRoles = $inheritedRoles | Sort-Object -Unique

    $allRoles = ($directRoles + $inheritedRoles) | Sort-Object -Unique

    $lastSignIn = $user.SignInActivity.LastSignInDateTime
    $inactive = $null

    $accountStatus = if ($user.AccountEnabled) { "Enabled" } else { "Disabled" }

    if ($accountStatus -eq "Enabled") {

        if (-not $lastSignIn) {
            $inactive = "Yes"
        }
        else {
            $daysInactive = (New-TimeSpan -Start $lastSignIn -End (Get-Date)).Days
            if ($daysInactive -gt 30) {
                $inactive = "Yes"
            }
            else {
                $inactive = "No"
            }
        }
    }

    $accountStatus = if ($user.AccountEnabled) { "Enabled" } else { "Disabled" }

    $riskLevel = "Low"

    if ($allRoles -contains "Global Administrator" -or
        ($groups | Where-Object { $_ -in $highRiskGroups })) {
        $riskLevel = "High"
    }
    elseif ($groups | Where-Object { $_ -in $mediumRiskGroups }) {
        $riskLevel = "Medium"
    }

    $isPrivileged = "No"

    foreach ($role in $allRoles) {
        if ($privilegedRoles -contains $role) {
            $isPrivileged = "Yes"
            break
        }
    }

    $report += [PSCustomObject]@{
        UserDisplayName   = $user.displayName
        UserPrincipalName = $user.UserPrincipalName
        GroupMemberships  = ($groups -join ", ")
        DirectRoles       = ($directRoles -join ", ")
        InheritedRoles    = ($inheritedRoles -join ", ")
        AllAssignedRoles  = ($allRoles -join ", ")
        RiskLevel         = $riskLevel
        IsPrivileged      = $isPrivileged
        AccountStatus     = $accountStatus
        LastSignIn        = $lastSignIn
        Inactive          = $inactive
    }
}

$report | Export-Csv "C:\Users\kenda\Documents\iam-enterprise-simulation\access-governance\reports\iam-access-audit-report.csv" -NoTypeInformation