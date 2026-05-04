# Access Control Model

## Overview

This document defines the access control model used to manage identity and authorization within the organization.

The model combines Role-Based Access Control (RBAC) with Attribute-Based Access Control (ABAC) conditions to provide scalable, secure, and context-aware access management.

## Access Control Approach

The organization follows a layered access model:

### Layer 1: Identity (Who you are)

Access decisions are based on user identity attributes:

- Department
- Role
- Country

These attributes are sourced from the HR system and represent the authoritative identity profile.

---

### Layer 2: Access (What you can access)

Access is granted through RBAC using IAM-managed security groups.

- Users are assigned to groups based on identity attributes
- Each group represents a defined business role
- Permissions are not assigned directly to users

#### Example:

```bash
IAM-IT-System Administrator → Full privileged administrative access across tenant-level resources.

IAM-Finance-Accounting Manager → Administrative access to managing billing and financial data.
```

---

### Layer 3: Context (When and how access is allowed)

Access is further controlled using contextual conditions (ABAC-like), implemented through Conditional Access policies.

Examples include:

- Restricting access based on location (country)
- Requiring MFA or passkey (FIDO2) for privileged roles
- Blocking access from non-compliant devices

---

## RBAC to ABAC Transition

The model extends traditional RBAC by incorporating identity and contextual attributes.

| Model     | Description                                         |
|-----------|------------------------------------------------------|
| RBAC      | Access based on role/group membership                |
| ABAC      | Access based on attributes (user, device, location)  |

In this implementation:

- RBAC defines baseline access
- Attributes refine and restrict access conditions

## Attribute-Based Logic

Access assignment and enforcement rely on the following logic:

- Department + Role → Group Assignment
- Country → Conditional Access Policy
- Role → Privilege Level (Risk Classification)

## Access Flow

```bash
User Identity (Department, Role, Country)
         ↓
Group Assignment (RBAC)
         ↓
Conditional Access Evaluation (ABAC-like)
         ↓
Access Granted or Denied
```

## Example Scenario

The following example demonstrates how identity attributes, RBAC, and contextual controls work together:

### User Attributes

- Department: IT
- Role: System Administrator
- Country: Costa Rica

### Access Evaluation

- Assigned to group: IAM-IT-System Administrator
- Privilege level: High Risk
- Conditional Access:
  
  - Passkey (FIDO2) required
  - Access restricted to compliant devices

### Result

Access is granted with enforced security controls based on both role and context.

## Design Principles

- Least Privilege
  
  - Users receive only the access required for their role
    
- Separation of Duties
  
  - Conflicting roles are not assigned to the same user
    
- Centralized Access Control
  
  - All permissions are managed through IAM groups
    
- Attribute-Driven Automation
  
  - Access is dynamically assigned based on identity attributes
    
- Context-Aware Security
  
  - Access is evaluated based on real-time conditions
 
## Benefits

- Scalable access management model
- Reduced manual access provisioning
- Improved security through contextual controls
- Alignment with enterprise IAM best practices

## Alignment with Governance

This model aligns with:

- RBAC group definitions ([Business Rules](../../access-governance/docs/business-rules.md))
- Risk classification model
- Access review processes
- Automated reporting and dashboard visualization

It ensures consistency across identity, access, and governance layers.

