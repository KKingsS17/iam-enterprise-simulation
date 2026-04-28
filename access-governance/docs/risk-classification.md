# Access Risk Classification

## Purpose
This document defines access risk levels based on privilege, data sensitivity, and potential business impact. It supports governance, audit, and access review processes.

# Risk Classification Criteria

Access is classified based on the following factors:

- Level of privilege (standard vs administrative)
- Sensitivity of accessed data (e.g., financial, HR, security)
- Potential impact to business operations if misused

## Risk Levels

### High Risk

#### IAM-IT-SystemAdmin

- Description: Privileged administrative access to critical infrastructure systems
- Impact: Full system compromise, service disruption, or security breach

### Medium Risk

#### IAM-Finance-AccountingManager

- Description: Access to sensitive financial data and reporting systems
- Impact: Data exposure or financial integrity risk

### Low Risk

#### IAM-Sales-Manager | IAM-Finance-AccountingStaff

- Description: Limited or read-only access to business applications
- Impact: Minimal operational impact

## Controls

| Risk Level | Access Review Frequency | Approval Required | Justification Required | Auto-Removal if No Response |
|-----------|------------------------|------------------|------------------------|-----------------------------|
| High      | Monthly                | Yes              | Yes                    | Yes                         |
| Medium    | Quarterly              | Yes              | Yes                    | Yes                         |
| Low       | Semi-Annual            | No               | Optional               | No                          |

## Governance Notes
- All high-risk access must have an assigned group owner
- Risk classification must align with RBAC group definitions
- Risk levels must be reviewed periodically to ensure accuracy

