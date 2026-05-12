# Access Control Models - Module 3

## Overview

This module implements a layered enterprise access control architecture combining Role-Based Access Control (RBAC), Attribute-Based Access Control (ABAC), Dynamic Groups, and Conditional Access policies.

The implementation is designed to simulate how modern organizations manage scalable, automated, and context-aware access control using Microsoft Entra ID and Zero Trust security principles.

- Identity-driven access assignment
- Dynamic access provisioning and revocation
- Context-aware authentication controls
- Privileged access protection
- Automated governance and enforcement

The following validation scenario demonstrates Conditional Access enforcement blocking privileged access from a non-compliant device.

<img src="docs/evidence/14-conditional-access-policy.png" width="800">

---

## Architecture

The access control model follows a layered enterprise IAM architecture:

| Layer | Purpose |
|---|---|
| Identity | User attributes define identity context |
| Access | RBAC group-based authorization |
| Context | Conditional Access and security enforcement |
| Governance | Access validation and policy enforcement |

### Access Flow

```text
User Identity Attributes
(Department, Role)
            ↓
Dynamic Group Assignment
            ↓
RBAC Access Provisioning
            ↓
Conditional Access Evaluation
            ↓
Access Granted or Denied
```

---

## Core Components

### RBAC (Role-Based Access Control)

Access is assigned through IAM-managed security groups representing business roles and responsibilities.

### ABAC (Attribute-Based Access Control)

Identity attributes are used to automate and refine access decisions.

### Dynamic Groups

Dynamic membership rules automate:

- Access provisioning
- Access revocation
- License assignment
- Application access management

### Conditional Access

Conditional Access policies enforce contextual and risk-based security controls across the environment, including:

- MFA enforcement
- Phishing-resistant authentication
- Compliant device requirements
- Geographic access restrictions
- Risk-based access protection

**Detailed Conditional Access architecture and policies: [Conditional Access Policies](docs/conditional-access.md)**

---

## Validation Scenarios

The implementation was validated through multiple real-world IAM scenarios, including:

- Automated access provisioning
- Dynamic access revocation after attribute changes
- Conditional Access enforcement for privileged users
- Context-aware authentication blocking

**Detailed validation evidence and screenshots: [Access Control Validation](docs/access-control-validation.md)**

---

## Documentation

| Document | Description |
|---|---|
| [Access Model](docs/access-model.md) | RBAC and ABAC architecture design |
| [Dynamic Groups](docs/dynamic-groups.md) | Dynamic group strategy and access automation |
| [Conditional Access Policies](docs/conditional-access.md) | Conditional Access architecture and security controls |
| [Access Control Validation](docs/access-control-validation.md) | Validation scenarios and enforcement evidence |

---

## Technologies

- Microsoft Entra ID (Azure AD)
- Conditional Access
- Microsoft Graph API
- PowerShell
- Dynamic Groups
- Identity Governance

---

## Key IAM Concepts Demonstrated

- RBAC and ABAC integration
- Dynamic access provisioning and revocation
- Conditional Access and Zero Trust enforcement
- Privileged access hardening
- Context-aware authentication controls
- Enterprise IAM governance

---

## Project Context

This module is part of the broader **IAM Enterprise Simulation** project and was designed to simulate real-world enterprise IAM architecture, governance, and security practices.

The implementation focuses on practical IAM engineering concepts commonly used in modern enterprise environments.
