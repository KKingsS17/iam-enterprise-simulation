function Process-LifecycleEvent {

    param(
        $Employee,

        [string]$OperationId
    )

    switch ($Employee.eventType) {

        "JOINER" {

            Invoke-JoinerWorkflow `
            -Employee $Employee `
            -OperationId $OperationId
        }

        "MOVER" {

            Invoke-MoverWorkflow `
            -Employee $Employee `
            -OperationId $OperationId
        }

        "LEAVER" {

            Invoke-LeaverWorkflow `
            -Employee $Employee `
            -OperationId $OperationId
        }
    }
}

function Invoke-JoinerWorkflow {

    param(
        $Employee,
        [string]$OperationId
    )

    Write-Log `
    -Level "INFO" `
    -Message "Starting JOINER workflow" `
    -EmployeeId $Employee.employeeId `
    -OperationId $OperationId

    $passwordProfile = @{
        forceChangePasswordNextSignIn = $true
        password = "TempP@ssword123!"
    }

    $requestBody = @{
        accountEnabled = $true
        displayName = $Employee.displayName
        givenName = $Employee.firstName
        surname = $Employee.lastName
        userPrincipalName = $Employee.userPrincipalName
        mailNickname = ($Employee.userPrincipalName.Split("@")[0])
        department = $Employee.department
        jobTitle = $Employee.jobTitle
        usageLocation = $Employee.country
        passwordProfile = $passwordProfile
    }

    try {

        $newUser = Invoke-GraphApiWithRetry `
        -Method POST `
        -Uri "https://graph.microsoft.com/v1.0/users" `
        -Body $requestBody

        Write-Log `
        -Level "INFO" `
        -Message "User successfully created" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        Start-Sleep -Seconds 10

        $global:AutomationMetrics.CreatedUsers++

        Add-UserToRoleGroups `
        -UserId $newUser.id `
        -Employee $Employee `
        -OperationId $OperationId
    }
    catch {

        Write-Log `
        -Level "ERROR" `
        -Message "Failed to create user: $($_.Exception.Message)" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        throw
    }
}

function Invoke-MoverWorkflow {

    param(
        $Employee,

        [string]$OperationId
    )

    Write-Log `
    -Level "INFO" `
    -Message "Starting MOVER workflow" `
    -EmployeeId $Employee.employeeId `
    -OperationId $OperationId

    try {

        $user = Get-MgUser `
        -Filter "userPrincipalName eq '$($Employee.userPrincipalName)'"

        if (-not $user) {

            throw "User not found"
        }

        $updateBody = @{
            department = $Employee.department
            jobTitle = $Employee.jobTitle
            usageLocation = $Employee.country
        }

        Invoke-GraphApiWithRetry `
        -Method PATCH `
        -Uri "https://graph.microsoft.com/v1.0/users/$($user.Id)" `
        -Body $updateBody

        Write-Log `
        -Level "INFO" `
        -Message "User attributes updated successfully" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        $global:AutomationMetrics.UpdatedUsers++

        Update-UserGroupMembership `
        -UserId $user.Id `
        -Employee $Employee `
        -OperationId $OperationId
    }
    catch {

        Write-Log `
        -Level "ERROR" `
        -Message "MOVER workflow failed: $($_.Exception.Message)" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        throw
    }
}

function Invoke-LeaverWorkflow {

    param(
        $Employee,

        [string]$OperationId
    )

    Write-Log `
    -Level "INFO" `
    -Message "Starting LEAVER workflow" `
    -EmployeeId $Employee.employeeId `
    -OperationId $OperationId

    try {

        $user = Get-MgUser `
        -Filter "userPrincipalName eq '$($Employee.userPrincipalName)'"

        if (-not $user) {

            throw "User not found"
        }

        $null = Invoke-GraphApiWithRetry `
        -Method POST `
        -Uri "https://graph.microsoft.com/v1.0/users/$($user.Id)/revokeSignInSessions"

        Write-Log `
        -Level "INFO" `
        -Message "User sessions revoked" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        Remove-UserFromAllGroups `
        -UserId $user.Id `
        -Employee $Employee `
        -OperationId $OperationId

        $disableBody = @{
            accountEnabled = $false
        }

        Invoke-GraphApiWithRetry `
        -Method PATCH `
        -Uri "https://graph.microsoft.com/v1.0/users/$($user.Id)" `
        -Body $disableBody

        Write-Log `
        -Level "INFO" `
        -Message "User account disabled successfully" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        $global:AutomationMetrics.DisabledUsers++
    }
    catch {

        Write-Log `
        -Level "ERROR" `
        -Message "LEAVER workflow failed: $($_.Exception.Message)" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        throw
    }
}