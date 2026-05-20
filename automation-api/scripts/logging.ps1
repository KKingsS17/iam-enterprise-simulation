function Initialize-Logging {

    $global:LogPath = "C:\Users\kenda\Documents\iam-enterprise-simulation\automation-api\logs"

    if (-not (Test-Path $global:LogPath)) {

        New-Item `
        -Path $global:LogPath `
        -ItemType Directory | Out-Null
    }

    $global:LogFile = Join-Path `
    $global:LogPath `
    "automation-engine-$(Get-Date -Format 'yyyyMMdd').log"
}

function Write-Log {

    param(
        [Parameter(Mandatory)]
        [ValidateSet("INFO","WARNING","ERROR")]
        [string]$Level,

        [Parameter(Mandatory)]
        [string]$Message,

        [string]$EmployeeId = "N/A",

        [string]$OperationId = "N/A"
    )

    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $logEntry = "$timestamp [$Level] [Employee:$EmployeeId] [Operation:$OperationId] $Message"

    Add-Content `
    -Path $global:LogFile `
    -Value $logEntry

    switch ($Level) {

        "INFO" {

            Write-Host $logEntry -ForegroundColor Cyan
        }

        "WARNING" {

            Write-Host $logEntry -ForegroundColor Yellow
        }

        "ERROR" {

            Write-Host $logEntry -ForegroundColor Red
        }
    }
}