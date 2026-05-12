# Access Control Models - Module 3

## Overview

This module implements a layered enterprise access control architecture combining Role-Based Access Control (RBAC), Attribute-Based Access Control (ABAC), Dynamic Groups, and Conditional Access policies.

The implementation is designed to simulate how modern organizations manage scalable, automated, and context-aware access control using Microsoft Entra ID and Zero Trust security principles.

The module focuses on:

- Identity-driven access assignment
- Dynamic access provisioning and revocation
- Context-aware authentication controls
- Privileged access protection
- Automated governance and enforcement

---

## Objectives

- Implement a layered RBAC and ABAC access control model
- Automate access assignment using identity attributes
- Enforce Conditional Access and Zero Trust controls
- Simulate enterprise-grade privileged access protection
- Validate access behavior through real-world test scenarios
- Demonstrate scalable IAM governance architecture

---

## Architecture

The access control model follows a layered enterprise IAM architecture:

| Layer | Purpose |
|---|---|
| Identity | User attributes define identity context |
| Access | RBAC group-based authorization |
| Context | Conditional Access and security enforcement |
| Governance | Access validation and policy enforcement |

## Access Flow

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

#### Examples

- IAM-IT-System Administrator
- IAM-Finance-Accounting Manager
- IAM-Human Resources-HR Management

### ABAC (Attribute-Based Access Control)

Identity attributes are used to automate and refine access decisions.

#### Attributes Used

- Department
- Role
- User Type
- Account Status

---

## Dynamic Groups

Dynamic membership rules automate:

- Access provisioning
- Access revocation
- License assignment
- Application access management

### Examples

- LIC-BASE-Active-Users
- IAM-APP-QuickBooks-Finance-Users
- IAM-PRIV-Global-Administrators

---

## Conditional Access

Conditional Access policies enforce contextual and risk-based security controls.

### Implemented Controls

- MFA enforcement
- Phishing-resistant authentication
- Compliant device requirements
- Geographic access restrictions
- Risk-based access protection

## Implemented Conditional Access Policies

| Policy | Purpose |
|---|---|
| CA01-BASE-RequireMFA-AllUsers | Require MFA for all users |
| CA02-BASE-BlockLegacyAuth | Block legacy authentication |
| CA03-BASE-RequireCompliantDevice | Require compliant devices |
| CA04-BASE-RequireMFA-GuestUsers | Require MFA for guest users |
| CA05-AUTH-SecureSecurityInfoRegistration | Protect MFA registration |
| CA10-PRIV-HardenedAccess-Admins | Harden privileged access |
| CA11-PRIV-SignInFrequency-Admins | Restrict privileged session persistence |
| CA20-LOC-BlockNonTrustedCountries | Restrict access by location |
| CA21-LOC-Admins-ExternalRestrictions | Harden external privileged access |
| CA30-RISK-HighSignInRisk | Respond to risky sign-ins |
| CA31-RISK-UserRisk | Respond to compromised users |

---

## Validation Scenarios

The implementation was validated through multiple real-world IAM scenarios, including:

- Automated access provisioning
- Dynamic access revocation after attribute changes
- Conditional Access enforcement for privileged users
- Context-aware authentication blocking

Detailed validation evidence and screenshots:
[Access Control Validation](docs/access-control-validation.md)

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
- Dynamic identity-driven access management
- Zero Trust security architecture
- Conditional Access enforcement
- Privileged access hardening
- Context-aware authentication controls
- Automated access provisioning and revocation
- Enterprise IAM governance

---

## Enterprise Security Alignment

The implementation aligns with modern enterprise IAM and Zero Trust security principles, including:

- Least Privilege Access
- Defense in Depth
- Continuous Verification
- Identity-Centric Security
- Context-Aware Access Enforcement
- Automated Governance Controls

---

## Notes

This module is part of the broader **IAM Enterprise Simulation** project and was designed to simulate real-world enterprise IAM architecture, governance, and security practices.

The implementation focuses on practical IAM engineering concepts commonly used in modern enterprise environments.
