# Automation Design

## Overview

This document defines the lifecycle orchestration and automation design used by the IAM automation platform.

The platform processes identity lifecycle events originating from the HR system and orchestrates provisioning workflows through Microsoft Graph API integrations.

---

## Event-Driven Processing Model

The automation engine processes lifecycle events as structured identity events.

Example:

```json
{
  "eventType": "JOINER",
  "employeeId": "EMP1001"
}
```

Supported lifecycle events include:

- JOINER
- MOVER
- LEAVER

---

## Lifecycle Workflows

### JOINER Workflow

The JOINER workflow performs:

- User provisioning
- Identity attribute assignment
- Group-based access provisioning
- Logging and reporting

---

### MOVER Workflow

The MOVER workflow performs:

- Identity attribute synchronization
- Access reauthorization
- Group membership updates
- Logging and reporting

---

### LEAVER Workflow

The LEAVER workflow performs:

- Session revocation
- Access removal
- Account disablement
- Logging and reporting

---

## Validation Model

Before lifecycle execution, the platform validates:

- Required attributes
- Email format
- Lifecycle status
- Role mappings
- Group existence
- Duplicate identities

Provisioning operations are blocked if governance validation fails.

---

## Role Mapping Design

Access assignment is driven through centralized role mappings stored in JSON format.

Example:

```json
{
  "IT-System Administrator": {
    "groups": [
      "IAM-IT-System Administrator"
    ]
  }
}
```

This design improves scalability and reduces hardcoded authorization logic.

---

## Logging Design

The platform generates structured logs using the following severity levels:

- INFO
- WARNING
- ERROR

Each operation includes:

- Timestamp
- Employee ID
- Operation ID
- Execution details

---

## Reporting Design

Operational metrics generated include:

- Processed events
- Successful operations
- Failed operations
- Created users
- Updated users
- Disabled users
- Group assignments

Reports are exported in:

- CSV
- JSON

---

## Design Principles

- Modular automation architecture
- API-driven orchestration
- Governance-first validation
- Structured operational visibility
- Centralized access assignment
- Secure non-interactive authentication
