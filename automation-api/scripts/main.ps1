. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\config\config.ps1"
. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\scripts\graph-api.ps1"
. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\scripts\logging.ps1"
. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\scripts\connect-graph.ps1"
. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\scripts\validation.ps1"
. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\scripts\user-lifecycle.ps1"
. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\scripts\group-management.ps1"
. "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\scripts\reporting.ps1"

Initialize-Logging

$global:AutomationMetrics = @{

    ProcessedEvents = 0

    SuccessfulEvents = 0

    FailedEvents = 0

    CreatedUsers = 0

    UpdatedUsers = 0

    DisabledUsers = 0

    GroupAssignments = 0
}

Connect-ToGraph

$global:RoleMappings = Get-Content "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\config\role-mapping.json" | ConvertFrom-Json

$employees = Get-Content "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\data\employees.json" | ConvertFrom-Json

foreach ($event in $employees) {

    $operationId = [guid]::NewGuid().ToString()

    $global:AutomationMetrics.ProcessedEvents++

    try {

        Write-Log `
        -Level "INFO" `
        -Message "Processing identity lifecycle event: $($event.eventType)" `
        -EmployeeId $event.employeeId `
        -OperationId $operationId

        Validate-EmployeeData `
        -Employee $event `
        -OperationId $operationId

        Process-LifecycleEvent `
        -Employee $event `
        -OperationId $operationId

        $global:AutomationMetrics.SuccessfulEvents++
    }
    catch {

        $global:AutomationMetrics.FailedEvents++

        Write-Log `
        -Level "ERROR" `
        -Message $_.Exception.Message `
        -EmployeeId $event.employeeId `
        -OperationId $operationId
    }
}

Generate-AccessReport