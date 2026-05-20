# Microsoft Graph API Flow

## Overview

This document defines the Microsoft Graph API integration flows used by the automation platform to orchestrate identity lifecycle operations within Microsoft Entra ID.

---

## Authentication

The automation engine authenticates using:

- App Registration
- Service Principal
- Certificate-based authentication
- Application permissions

---

## Graph API Operations

| Operation | Method | Endpoint |
|---|---|---|
| Create User | POST | /users |
| Update User | PATCH | /users/{id} |
| Disable User | PATCH | /users/{id} |
| Revoke Sessions | POST | /users/{id}/revokeSignInSessions |
| Query Users | GET | /users |
| Query Groups | GET | /groups |

---

## SDK Operations

The following operations are executed through Microsoft Graph PowerShell SDK cmdlets:

| Operation | Cmdlet |
|---|---|
| Add Group Member | New-MgGroupMemberByRef |
| Remove Group Member | Remove-MgGroupMemberByRef |
| Query Group Membership | Get-MgUserMemberOf |

---

## Lifecycle Flow

### JOINER

```mermaid
flowchart TD

    A[HR JOINER Event]
    B[Validate Employee Data]
    C[POST /users]
    D[GET /groups]
    E[New-MgGroupMemberByRef]
    F[Provision Access]
    G[Generate Logs & Metrics]

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
```

### MOVER

```mermaid
flowchart TD

    A[HR MOVER Event]
    B[Validate Employee Data]
    C[PATCH /users]
    D[GET User Group Membership]
    E[Remove-MgGroupMemberByRef]
    F[GET Target Groups]
    G[New-MgGroupMemberByRef]
    H[Generate Logs & Metrics]

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
```

### LEAVER

```mermaid
flowchart TD

    A[HR LEAVER Event]
    B[Validate Employee Data]
    C[GET /users]
    D[POST revokeSignInSessions]
    E[GET User Group Membership]
    F[Remove-MgGroupMemberByRef]
    G[PATCH /users accountEnabled false]
    H[Generate Logs & Metrics]

    A --> B
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G
    G --> H
```

---

## API Reliability Controls

The automation platform includes:

- Retry logic for critical Graph API operations
- Structured exception handling
- Validation controls prior to execution
- Operational logging for all lifecycle events

---

## Security Considerations

The platform follows least privilege principles by limiting application permissions to the minimum required permissions necessary for lifecycle orchestration workflows.
