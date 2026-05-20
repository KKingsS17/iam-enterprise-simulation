function Generate-AccessReport {

    Write-Log `
    -Level "INFO" `
    -Message "Generating automation execution report"

    $report = [PSCustomObject]@{

        ReportDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

        ProcessedEvents = $global:AutomationMetrics.ProcessedEvents

        SuccessfulEvents = $global:AutomationMetrics.SuccessfulEvents

        FailedEvents = $global:AutomationMetrics.FailedEvents

        CreatedUsers = $global:AutomationMetrics.CreatedUsers

        UpdatedUsers = $global:AutomationMetrics.UpdatedUsers

        DisabledUsers = $global:AutomationMetrics.DisabledUsers

        GroupAssignments = $global:AutomationMetrics.GroupAssignments
    }

    $reportPath = "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\logs"

    if (-not (Test-Path $reportPath)) {

        New-Item `
        -Path $reportPath `
        -ItemType Directory | Out-Null
    }

    $csvFile = Join-Path `
    $reportPath `
    "automation-report-$(Get-Date -Format 'yyyyMMdd-HHmmss').csv"

    $jsonFile = Join-Path `
    $reportPath `
    "automation-report-$(Get-Date -Format 'yyyyMMdd-HHmmss').json"

    $report | Export-Csv `
    -Path $csvFile `
    -NoTypeInformation

    $report | ConvertTo-Json `
    -Depth 5 | Out-File $jsonFile

    Write-Log `
    -Level "INFO" `
    -Message "Automation report generated successfully"

    Write-Host ""
    Write-Host "========= AUTOMATION EXECUTION SUMMARY =========" -ForegroundColor Green
    Write-Host "Processed Events : $($report.ProcessedEvents)"
    Write-Host "Successful Events: $($report.SuccessfulEvents)"
    Write-Host "Failed Events    : $($report.FailedEvents)"
    Write-Host "Created Users    : $($report.CreatedUsers)"
    Write-Host "Updated Users    : $($report.UpdatedUsers)"
    Write-Host "Disabled Users   : $($report.DisabledUsers)"
    Write-Host "Group Assignments: $($report.GroupAssignments)"
    Write-Host "================================================"
}