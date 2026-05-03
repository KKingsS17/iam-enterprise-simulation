# Identity & Access Management - Business Rules

## Purpose

This document defines the access control model and governing rules for permission assignment within the organization.

The objective is to ensure that access is granted based on defined business roles, while enforcing the principle of least privilege and maintaining full auditability.

## Access Model Overview

Access is managed using a Role-Based Access Control (RBAC) model.

- Users are assigned to IAM-managed security groups based on authoritative attributes (e.g., department, role) sourced from the HR system.
- All access is granted exclusively through IAM-managed groups.
- Direct assignment of permissions to individual users is strictly prohibited.

## Naming Convention

IAM-managed groups follow the standardized naming format:

IAM-[Department]-[Role]

Example:

- IAM-IT-System Administrator
- IAM-Finance-Accounting Manager

## Role-Based Access Rules

### Finance Department

- Accounting Manager

  - Administrative access to managing billing and financial data.

### IT Department

- System Administrator

  - Full privileged administrative access across infrastructure systems and tenant-level resources.

- Cybersecurity Analyst

  - Read access to security data and limited administrative permissions within security-related services.

- Service Desk Technician

  - Restricted administrative permissions required to support end users (e.g., password reset, user management).

### Sales Department

- Account Executive

  - Permissions to invite and manage guest users.

### Human Resources

- HR Management

  - Read-only acess to basic directory information.

### Software Development

- Product Manager / Software Architect

  - Permissions to create and manage enterprise applications and service principals.
  - Read-only access to reporting data (usage, adoption, and audit logs).

- Software Developers

  - Permissions to create and manage application registrations, including authentication and API permissions.
  - Read-only access to directory data.

## Joiner / Mover / Leaver (JML)

### Joiner

- Users are automatically assigned to appropriate IAM groups based on role and department attributes.

### Mover

- Existing access is removed upon role or department change.
- New access is provisioned based on updated attributes.
- All changes must be fully logged and traceable.

### Leaver

- User accounts are disabled immediately.
- All group memberships are removed.
- Active sessions are revoked.

## Access Assignment Rules

-  access must be assigned via IAM-managed groups.
- Direct assignment of roles or permissions to users is prohibited.
- All access changes must be logged and auditable.
- Access must adhere to the principle of least privilege.

## Governance

- All privileged groups must have designated owners.
- Group owners are responsible for periodic access validation.
- High-risk access must undergo regular review.
- Privileged access must be reviewed at least monthly.

## Exceptions

- All exceptions must be formally documented and approved.
- Exceptions must include a defined expiration date.
- Exceptions are subject to periodic review and revalidation.

## Enforcement

- Access controls are enforced through automated processes (PowerShell and Microsoft Graph API).
- All access and lifecycle events must be logged.
- Non-compliant or unauthorized access must be remediated promptly.

