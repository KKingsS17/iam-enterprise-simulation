function Validate-EmployeeData {

    param(
        [Parameter(Mandatory)]
        $Employee,

        [string]$OperationId
    )

    $validationStart = Get-Date

    Write-Log `
    -Level "INFO" `
    -Message "Starting validation process for $($Employee.userPrincipalName)" `
    -EmployeeId $Employee.employeeId `
    -OperationId $OperationId

    Validate-RequiredAttributes $Employee

    Validate-OptionalAttributes `
    -Employee $Employee `
    -OperationId $OperationId

    Validate-EmailFormat $Employee

    Validate-Status $Employee

    Validate-EventType $Employee

    Validate-RoleMapping $Employee

    Validate-GroupsExist $Employee

    Validate-DuplicateUser $Employee

    $validationEnd = Get-Date

    $duration = ($validationEnd - $validationStart).TotalMilliseconds

    Write-Log `
    -Level "INFO" `
    -Message "Validation completed successfully in $([math]::Round($duration,2))ms" `
    -EmployeeId $Employee.employeeId `
    -OperationId $OperationId
}

function Validate-RequiredAttributes {

    param($Employee)

    $requiredAttributes = @(
        "employeeId",
        "firstName",
        "lastName",
        "displayName",
        "userPrincipalName",
        "department",
        "jobTitle",
        "country",
        "employeeType",
        "status",
        "eventType"
    )

    foreach ($attribute in $requiredAttributes) {

        if (-not $Employee.$attribute) {

            throw "Missing required attribute: $attribute"
        }
    }
}

function Validate-OptionalAttributes {

    param(
        $Employee,

        [string]$OperationId
    )

    if (-not $Employee.manager) {

        Write-Log `
        -Level "WARNING" `
        -Message "Manager attribute is empty" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId
    }
}

function Validate-EmailFormat {

    param($Employee)

    $emailRegex = '^[^@\s]+@[^@\s]+\.[^@\s]+$'

    if ($Employee.userPrincipalName -notmatch $emailRegex) {

        throw "Invalid email format: $($Employee.userPrincipalName)"
    }
}

function Validate-Status {

    param($Employee)

    $validStatuses = @(
        "active",
        "terminated"
    )

    if ($Employee.status -notin $validStatuses) {

        throw "Invalid lifecycle status: $($Employee.status)"
    }
}

function Validate-EventType {

    param($Employee)

    $validEvents = @(
        "JOINER",
        "MOVER",
        "LEAVER"
    )

    if ($Employee.eventType -notin $validEvents) {

        throw "Invalid event type: $($Employee.eventType)"
    }
}

function Validate-RoleMapping {

    param($Employee)

    $mappingKey = "$($Employee.department)-$($Employee.jobTitle)"

    if (-not $global:RoleMappings.$mappingKey) {

        throw "Role mapping not found for: $mappingKey"
    }
}

function Validate-GroupsExist {

    param($Employee)

    $mappingKey = "$($Employee.department)-$($Employee.jobTitle)"

    $groups = $global:RoleMappings.$mappingKey.groups

    foreach ($group in $groups) {

        $groupExists = Get-MgGroup `
        -Filter "displayName eq '$group'"

        if (-not $groupExists) {

            throw "Required IAM group does not exist: $group"
        }
    }
}

function Validate-DuplicateUser {

    param($Employee)

    $existingUser = Get-MgUser `
    -Filter "userPrincipalName eq '$($Employee.userPrincipalName)'"

    if ($Employee.eventType -eq "JOINER" -and $existingUser) {

        throw "User already exists: $($Employee.userPrincipalName)"
    }

    if ($Employee.eventType -in @("MOVER","LEAVER") -and -not $existingUser) {

        throw "User does not exist for lifecycle event: $($Employee.userPrincipalName)"
    }
}