# IAM - Business Rules

## Purpose

This document defines the access governance rules and RBAC model implemented within the environment.

The objective is to ensure that access is assigned based on business responsibilities while enforcing least privilege, centralized authorization, and auditability.

---

## Access Model Overview

Access is managed using IAM-controlled RBAC security groups.

### Core Principles

- Access is assigned through IAM-managed groups only
- Direct permission assignment to users is prohibited
- Group membership is based on authoritative HR attributes
- Access changes must be auditable and traceable

---

## Naming Convention

```text
IAM-[Department]-[Role]
```

### Examples

- IAM-IT-System Administrator
- IAM-Finance-Accounting Manager

---

## Role-Based Access Rules

| Department | Role | Access Scope |
|---|---|---|
| IT | System Administrator | Full privileged administrative access |
| IT | Cybersecurity Analyst | Security visibility and limited security administration |
| IT | Service Desk Technician | Limited user and identity administration |
| Finance | Accounting Manager | Administrative access to billing and financial data |
| Sales | Account Executive | Guest user management |
| Human Resources | HR Management | Read-only directory access |
| Software Development | Product Manager / Software Architect | Enterprise application and service principal management |
| Software Development | Software Developer | Application registration and API permission management |

---

## Joiner / Mover / Leaver (JML)

| Process | Control |
|---|---|
| Joiner | Access automatically assigned based on identity attributes |
| Mover | Previous access removed and reassigned based on updated role |
| Leaver | Accounts disabled, sessions revoked, memberships removed |

### Governance Requirements

- All changes must be logged
- Access updates must remain traceable and auditable

---

## Access Governance Rules

- Access must follow least privilege principles
- Administrative access must be separated from standard user access
- Privileged groups must have designated owners
- High-risk access requires periodic review
- Privileged access must be reviewed at least monthly

---

## Exception Management

Exceptions must:

- Be formally approved
- Include a documented justification
- Have a defined expiration date
- Undergo periodic review

---

## Enforcement

Access governance is enforced through:

- Microsoft Entra ID
- PowerShell automation
- Microsoft Graph API
- Dynamic group assignment
- Access Reviews and audit controls

Non-compliant or unauthorized access must be remediated promptly.

---

## Conclusion

The implemented business rules provide a governance-aligned RBAC framework focused on:

- Centralized access management
- Least privilege enforcement
- Automated lifecycle management
- Privileged access governance
- Audit readiness and traceability

The model reflects enterprise IAM practices commonly used in modern identity governance environments.
