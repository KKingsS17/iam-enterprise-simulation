function Add-UserToRoleGroups {

    param(
        [string]$UserId,

        $Employee,

        [string]$OperationId
    )

    $mappingKey = "$($Employee.department)-$($Employee.jobTitle)"

    $groups = $global:RoleMappings.$mappingKey.groups

    foreach ($group in $groups) {

        try {

            $groupObject = Get-MgGroup `
            -Filter "displayName eq '$group'"

            if (-not $groupObject) {

                throw "Group not found: $group"
            }

            New-MgGroupMemberByRef `
            -GroupId $groupObject.Id `
            -BodyParameter @{
                "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$UserId"
            }

            Write-Log `
            -Level "INFO" `
            -Message "Assigned user to group: $group" `
            -EmployeeId $Employee.employeeId `
            -OperationId $OperationId

            $global:AutomationMetrics.GroupAssignments++
        }
        catch {

            Write-Log `
            -Level "ERROR" `
            -Message "Failed to assign group: $group. Error: $($_.Exception.Message)" `
            -EmployeeId $Employee.employeeId `
            -OperationId $OperationId

            throw
        }
    }
}

function Update-UserGroupMembership {

    param(
        [string]$UserId,

        $Employee,

        [string]$OperationId
    )

    Write-Log `
    -Level "INFO" `
    -Message "Updating user group membership" `
    -EmployeeId $Employee.employeeId `
    -OperationId $OperationId

    try {

        $mappingKey = "$($Employee.department)-$($Employee.jobTitle)"

        $targetGroups = $global:RoleMappings.$mappingKey.groups

        $currentGroups = Get-MgUserMemberOf `
        -UserId $UserId `
        -All

        foreach ($group in $currentGroups) {

            $groupName = $group.AdditionalProperties.displayName

            if ($groupName -like "IAM-*") {

                Remove-MgGroupMemberByRef `
                -GroupId $group.Id `
                -DirectoryObjectId $UserId

                Write-Log `
                -Level "INFO" `
                -Message "Removed user from group: $groupName" `
                -EmployeeId $Employee.employeeId `
                -OperationId $OperationId
            }
        }

        Start-Sleep -Seconds 3

        foreach ($groupName in $targetGroups) {

            $groupObject = Get-MgGroup `
            -Filter "displayName eq '$groupName'"

            if (-not $groupObject) {

                throw "Target group not found: $groupName"
            }

            New-MgGroupMemberByRef `
            -GroupId $groupObject.Id `
            -BodyParameter @{
                "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$UserId"
            }

            Write-Log `
            -Level "INFO" `
            -Message "Assigned user to group: $groupName" `
            -EmployeeId $Employee.employeeId `
            -OperationId $OperationId

            $global:AutomationMetrics.GroupAssignments++
        }
    }
    catch {

        Write-Log `
        -Level "ERROR" `
        -Message "Failed to update group membership: $($_.Exception.Message)" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        throw
    }
}

function Remove-UserFromAllGroups {

    param(
        [string]$UserId,

        $Employee,

        [string]$OperationId
    )

    Write-Log `
    -Level "INFO" `
    -Message "Removing user from IAM-managed groups" `
    -EmployeeId $Employee.employeeId `
    -OperationId $OperationId

    try {

        $groups = Get-MgUserMemberOf `
        -UserId $UserId `
        -All

        foreach ($group in $groups) {

            $groupName = $group.AdditionalProperties.displayName

            if ($groupName -like "IAM-*") {

                Remove-MgGroupMemberByRef `
                -GroupId $group.Id `
                -DirectoryObjectId $UserId

                Write-Log `
                -Level "INFO" `
                -Message "Removed user from group: $groupName" `
                -EmployeeId $Employee.employeeId `
                -OperationId $OperationId
            }
        }
    }
    catch {

        Write-Log `
        -Level "ERROR" `
        -Message "Failed to remove user from groups: $($_.Exception.Message)" `
        -EmployeeId $Employee.employeeId `
        -OperationId $OperationId

        throw
    }
}