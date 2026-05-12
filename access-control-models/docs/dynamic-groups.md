# Dynamic Groups and Access Assignment

## Overview

This document defines the dynamic group model implemented within the environment.

Dynamic groups are used to automate:

- Identity-based access assignment
- Application access provisioning
- License assignment
- Privileged access management

The implementation leverages Microsoft Entra ID dynamic membership rules and standardized IAM naming conventions to support scalable and governance-aligned access management.

---

## Dynamic Group Architecture

Dynamic membership rules evaluate identity attributes to automatically assign users to the appropriate groups and access paths.

### Identity Attributes Used

- Department
- Job Title
- User Type
- Account Status

This approach reduces manual administration while supporting automated provisioning and lifecycle management.

---

## Naming Convention

| Prefix | Purpose |
|---|---|
| IAM-ALL | Baseline and tenant-wide access groups |
| IAM-APP | Application access management |
| IAM-PRIV | Privileged access management |
| LIC-BASE | License assignment |

---

## Identity and Baseline Groups

| Group | Purpose |
|---|---|
| IAM-ALL-Active-Member-Users | Contains all active internal users |
| IAM-ALL-Tenant-Users | Contains all tenant users, including guests |
| LIC-BASE-Active-Users | Assigns baseline licenses to active users |

### Key Functions

- Baseline access assignment
- Policy targeting
- License provisioning
- Governance reporting

---

## Privileged Access Groups

| Group | Purpose |
|---|---|
| IAM-PRIV-Global-Administrators | Contains Global Administrator users |

### Security Controls

Privileged access groups are protected through:

- Phishing-resistant MFA
- Compliant device requirements
- Restricted privileged sessions
- Enhanced monitoring and auditing

### Governance Controls

- Periodic access reviews
- Role separation
- Tight membership control
- Break-glass account exclusion

---

## Application Access Groups

| Group | Purpose |
|---|---|
| IAM-APP-ServiceNow-Users | Standard ServiceNow access |
| IAM-APP-ServiceNow-Admins | Administrative ServiceNow access |
| IAM-APP-HubSpot-Sales-Users | Standard HubSpot CRM access |
| IAM-APP-HubSpot-Admins | Administrative HubSpot access |
| IAM-APP-QuickBooks-Finance-Users | Standard QuickBooks ERP access |
| IAM-APP-QuickBooks-Admins | Administrative QuickBooks ERP access |

---

## Governance Alignment

The dynamic group implementation supports:

- Automated access provisioning and revocation
- Least privilege enforcement
- Role separation
- Standardized access assignment
- Scalable lifecycle management

Dynamic groups are integrated with the broader RBAC and Conditional Access architecture to support automated and context-aware access control.

---

## Benefits

- Reduced manual administration
- Consistent access assignment
- Improved scalability
- Simplified governance and auditing
- Enhanced security through role separation

---

## Conclusion

The dynamic group model provides a scalable foundation for automated identity governance, application access management, and license provisioning.

The implementation reflects enterprise IAM practices by combining RBAC, attribute-driven automation, and governance-aligned access management.
