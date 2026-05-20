function Invoke-GraphApiWithRetry {

    param(
        [string]$Method,

        [string]$Uri,

        $Body = $null,

        [int]$MaxRetries = 3
    )

    for ($attempt = 1; $attempt -le $MaxRetries; $attempt++) {

        try {

            if ($Body) {

                return Invoke-MgGraphRequest `
                -Method $Method `
                -Uri $Uri `
                -Body ($Body | ConvertTo-Json -Depth 10)
            }
            else {

                return Invoke-MgGraphRequest `
                -Method $Method `
                -Uri $Uri
            }
        }
        catch {

            if ($attempt -eq $MaxRetries) {

                throw
            }

            Start-Sleep -Seconds 2
        }
    }
}