# Access Control Model

## Overview

This document defines the enterprise access control model used to manage identity, authorization, and contextual access enforcement within the environment.

The implementation combines Role-Based Access Control (RBAC) with Attribute-Based Access Control (ABAC) concepts to provide scalable, automated, and context-aware access management aligned with Zero Trust security principles.

---

## Access Control Architecture

The environment follows a layered access control architecture designed to separate identity, authorization, and contextual enforcement.

| Layer | Function |
|---|---|
| Identity | Defines user identity attributes |
| Access | Grants role-based authorization |
| Context | Evaluates contextual access conditions |
| Governance | Validates and enforces access controls |

### Layer 1 — Identity

Identity attributes serve as the authoritative source for access decisions.

#### Identity Attributes

- Department
- Role
- User Type
- Account Status

These attributes are sourced from the HR system and used to automate access provisioning and policy evaluation.

---

### Layer 2 — Access

Authorization is implemented using RBAC through IAM-managed security groups.

#### Access Model

- Users are assigned access based on business roles
- Permissions are granted through groups rather than direct user assignments
- Access provisioning is automated using dynamic group membership rules

#### Examples

```text
IAM-IT-System Administrator
IAM-Finance-Accounting Manager
IAM-Human Resources-HR Management
IAM-APP-QuickBooks-Finance-Users
IAM-APP-ServiceNow-Admins
```

Related implementation details:
[Dynamic Groups and Access Assignment](dynamic-groups.md)

---

### Layer 3 — Context

Access requests are evaluated against contextual security conditions through Conditional Access policies.

#### Contextual Controls

- MFA enforcement
- Phishing-resistant authentication
- Compliant device requirements
- Geographic access restrictions
- Risk-based access evaluation

These controls extend traditional RBAC by incorporating real-time contextual signals into access decisions.

Related implementation details:
[Conditional Access Policies](conditional-access.md)

---

## RBAC and ABAC Integration

The model combines RBAC for baseline authorization with ABAC-style contextual enforcement.

| Model | Purpose |
|---|---|
| RBAC | Grants baseline access through role membership |
| ABAC | Applies contextual and attribute-driven controls |

### Access Logic

```text
Department + Role
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

## Example Access Scenario

The following scenario demonstrates how identity attributes, RBAC, and contextual controls work together.

### User Identity

| Attribute | Value |
|---|---|
| Department | IT |
| Role | System Administrator |
| Country | Costa Rica |

### Access Evaluation

| Control | Result |
|---|---|
| Dynamic Group Assignment | IAM-IT-System Administrator |
| Privilege Classification | High Risk |
| Authentication Requirement | Phishing-resistant MFA |
| Device Requirement | Compliant device required |

### Outcome

Access is granted only after both authorization and contextual security requirements are satisfied.

---

## Design Principles

| Principle | Implementation |
|---|---|
| Least Privilege | Access limited to required business functions |
| Separation of Duties | Conflicting access paths are separated |
| Centralized Authorization | Access managed through IAM groups |
| Attribute-Driven Automation | Access dynamically assigned using identity attributes |
| Context-Aware Security | Access evaluated using real-time conditions |

---

## Benefits

- Scalable access management
- Automated provisioning and revocation
- Reduced manual administration
- Improved security enforcement
- Alignment with enterprise IAM governance practices

---

## Governance Alignment

The access control model integrates with the broader governance and security architecture, including:

- RBAC group governance
- Dynamic access assignment
- Conditional Access enforcement
- Risk classification processes
- Access review workflows
- Audit reporting and monitoring

Related governance documentation:

- [Business Rules](../../access-governance/docs/business-rules.md)
- [Dynamic Groups and Access Assignment](dynamic-groups.md)
- [Conditional Access Policies](conditional-access.md)

---

## Conclusion

This access control model demonstrates how RBAC, ABAC concepts, dynamic identity attributes, and Conditional Access controls can be combined to implement scalable and governance-aligned enterprise IAM architecture.

The implementation reflects modern Zero Trust principles by continuously evaluating identity, authorization, and contextual risk before granting access.
