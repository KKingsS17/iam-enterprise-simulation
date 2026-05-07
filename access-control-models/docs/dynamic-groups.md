# Dynamic Groups and Access Assignment

## Overview

This document defines the dynamic group model implemented within the environment.

Dynamic groups are used to automate:

- Identity-based access assignment
- Application access provisioning
- License assignment
- Role separation
- Administrative access management

The implementation follows enterprise IAM best practices by leveraging user attributes and standardized naming conventions.

## Dynamic Group Strategy

The environment uses dynamic membership rules based on identity attributes such as:

- Department
- Job Title
- User Type
- Account Status

This approach enables scalable and automated identity governance while reducing manual access administration.

## Naming Convention

Dynamic groups follow standardized naming conventions based on their function.

| Prefix | Purpose |
|---|---|
| IAM-ALL | Identity baseline and tenant-wide groups |
| IAM-APP | Application access management |
| IAM-PRIV | Privileged access management |
| LIC-BASE | License assignment |

## Identity and Baseline Groups

### IAM-ALL-Active-Member-Users

#### Purpose
Contains all active internal users with the user type `Member`.

#### Usage
- Baseline access assignment
- Conditional Access targeting
- Enterprise application scoping
- Governance reporting

#### Dynamic Criteria
- Account enabled
- User type = Member

---

### IAM-ALL-Tenant-Users

#### Purpose
Contains all users within the tenant, including internal and guest users.

#### Usage
- Tenant-wide visibility
- Broad policy targeting
- Reporting and auditing

---

### LIC-BASE-Active-Users

#### Purpose
Provides baseline licensing to active users.

#### Usage
- Automatic license assignment
- Standardized user provisioning
- Identity lifecycle automation

#### Dynamic Criteria
- Account enabled
- Required identity attributes populated

---

## Application Access Groups

Application access is managed through dedicated IAM-managed groups following least privilege principles.

### IAM-APP-ServiceNow-Users

#### Purpose
Provides standard user access to ServiceNow.

#### Access Level
- Standard application access

---

### IAM-APP-ServiceNow-Admins

#### Purpose
Provides administrative access to ServiceNow.

#### Access Level
- Elevated administrative permissions

---

### IAM-APP-HubSpot-Sales-Users

#### Purpose
Provides standard CRM access for Sales users within HubSpot.

#### Access Level
- Sales and CRM operations

---

### IAM-APP-HubSpot-Admins

#### Purpose
Provides administrative access to HubSpot CRM.

#### Access Level
- Elevated administrative permissions

---

### IAM-APP-QuickBooks-Finance-Users

#### Purpose
Provides ERP access for Finance users within QuickBooks.

#### Access Level
- Financial operations access

---

### IAM-APP-QuickBooks-Admins

#### Purpose
Provides administrative access to QuickBooks ERP.

#### Access Level
- Elevated administrative permissions

---

## Governance Model

The dynamic group implementation supports the following governance controls:

- Automated access provisioning
- Least privilege enforcement
- Role separation
- Standardized application access management
- Scalable lifecycle management

Administrative access groups are separated from standard user groups to reduce privilege exposure and support audit requirements.

## Alignment with Access Control Model

Dynamic groups are integrated with the overall access control architecture:

| Layer | Function |
|---|---|
| Identity | User attributes drive group membership |
| Access | RBAC group assignment |
| Context | Conditional Access enforcement |

This alignment enables a hybrid RBAC and attribute-driven access model consistent with enterprise Zero Trust principles.

## Benefits

- Reduced manual access administration
- Consistent access assignment
- Improved scalability
- Simplified governance and auditing
- Enhanced security through role separation

## Conclusion

The dynamic group model provides a scalable and automated foundation for identity governance, application access management, and license provisioning.

The implementation reflects enterprise IAM practices by combining RBAC, attribute-based automation, and governance-driven access management.
