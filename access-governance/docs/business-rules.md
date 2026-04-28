# Identity & Access Management - Business Rules

## Purpose

This document defines the access control model and rules used to assign permissions within the organization. The objective is to ensure that access is granted based on business roles while enforcing the principle of least privilege and maintaining auditability.

## Access Model Overview

Access is managed using a Role-Based Access Control (RBAC) model.

- Users are assigned to security groups based on department and role
- All access is granted through IAM-managed groups
- Direct access assignment to users is prohibited

## Naming Convention>

IAM-managed groups follow this format:

IAM-[Department]-[Role]

Example:

- IAM - IT - System Administrator
- IAM - Finance - Accounting Manager

## Role-Based Access Rules

### Finance Department

- Accounting Staff → Financial systems (read-only)
- Accounting Manager → Financial systems (read/write)

### IT Department

- System Administrator → Privileged administrative access to infrastructure systems
- Cybersecurity Analyst → Security monitoring and investigation access
- Service Desk Technician → Limited administrative access required for user support

### Sales Department

- Account Executive → CRM systems and reporting tools

### Human Resources

- HR Management → HCM systems (read/write)
- Recruiters → HCM systems (read-only)

### Software Development

- Product Manager → Administrative access to development tools and limited infrastructure access
- Software Architect → Administrative access to development tools and read-only infrastructure access
- Software Developers → Standard access to development tools and read-only infrastructure access

## Joiner / Mover / Leaver (JML)

### Joiner

- Users are automatically assigned to groups based on role and department attributes

### Mover

- Previous access is removed
- New access is assigned based on updated attributes
- Access changes must be fully logged

### Leaver

- User account is disabled
- All group memberships are removed
- Active sessions are revoked

## Access Assignment Rules

- All access must be assigned via IAM-managed groups
- Direct assignment to users is not allowed
- All changes must be logged and auditable
- Access must follow least privilege principles

## Governance

- All privileged groups must have assigned owners
- Group owners are responsible for access validation
- High-risk access must be reviewed periodically
- Privileged access must be reviewed at least monthly

## Exceptions

- Exceptions must be documented and approved
- Exceptions must have an expiration date
- Exceptions are subject to periodic review

## Enforcement

- Access is enforced via automation (PowerShell / Microsoft Graph API)
- Logs must capture all access changes and lifecycle events
- Non-compliant access must be removed

