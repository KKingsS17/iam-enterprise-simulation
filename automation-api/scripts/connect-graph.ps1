function Connect-ToGraph {

    Write-Log `
    -Level "INFO" `
    -Message "Connecting to Microsoft Graph using application authentication"

    try {

        Connect-MgGraph `
        -ClientId $global:GraphConfig.ClientId `
        -TenantId $global:GraphConfig.TenantId `
        -CertificateThumbprint $global:GraphConfig.CertificateThumbprint

        $context = Get-MgContext

        Write-Log `
        -Level "INFO" `
        -Message "Successfully connected to tenant: $($context.TenantId)"
    }
    catch {

        Write-Log `
        -Level "ERROR" `
        -Message "Failed to connect to Microsoft Graph: $($_.Exception.Message)"

        throw
    }
}