# Access Risk Classification

## Purpose

This document defines access risk levels based on privilege, data sensitivity, and potential business impact.
It establishes a standardized risk model to support governance controls, audit processes, and periodic access reviews.

## Risk Classification Criteria

Access is classified based on the following factors:

- Level of privilege (standard vs administrative)
- Sensitivity of accessed data (e.g., financial, HR, security)
- Potential impact to business operations if misused

## Risk Levels

### High Risk

#### Definition:
Access that provides administrative control over critical systems or tenant-wide resources.

#### Examples:

- IAM-IT-System Administrator

#### Description:

- Privileged administrative access to infrastructure and identity systems

#### Impact:

- Full system compromise
- Service disruption
- Security breach

---

### Medium Risk

#### Definition:

- Access to sensitive business data or systems with limited administrative capabilities.

#### Examples:

- IAM-Finance-Accounting Manager
- IAM-IT-Service Desk Technician
- IAM-IT-Cybersecurity Analyst

#### Description:

- Access to financial data, user management, or security insights
- Limited administrative permissions

#### Impact:

- Data exposure
- Unauthorized changes
- Operational disruption

---

### Low Risk

#### Definition:

- Access with minimal privileges and limited impact on business operations.

#### Examples:

- IAM-Sales-Account Executive
- IAM-Finance-Accounting Staff

#### Description:

- Read-only or low-impact access to business applications

#### Impact:

- Minimal operational or security risk

---

## Controls


| Risk Level | Access Review Frequency | Approval Required | Justification Required | Auto-Removal if No Response |
|-----------|------------------------|------------------|------------------------|-----------------------------|
| High      | Monthly                | Yes              | Yes                    | Yes                         |
| Medium    | Quarterly              | Yes              | Yes                    | Yes                         |
| Low       | Semi-Annual            | No               | Optional               | No                          |


## Governance Requirements

- All high-risk access must have designated group owners
- Risk classification must align with RBAC group definitions
- Access must be periodically reviewed based on assigned risk level
- Privileged access must be continuously monitored and validated

## Notes

- Risk classification is dynamic and must be updated as roles or access requirements evolve
- Group-based access must inherit the appropriate risk classification

