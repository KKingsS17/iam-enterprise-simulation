# Access Risk Classification

## Overview

This document defines the risk classification model used to categorize access based on privilege level, data sensitivity, and potential business impact.

The model supports:

- Access governance
- Periodic access reviews
- Privileged access monitoring
- IAM audit reporting
- Risk-based security controls

---

## Risk Classification Criteria

Access risk is evaluated based on:

- Administrative privilege level
- Sensitivity of accessible data
- Potential operational or security impact
- Ability to modify identity, security, or application configurations

---

## Risk Levels

| Risk Level | Definition | Typical Impact |
|---|---|---|
| High | Full administrative or tenant-wide control | Tenant compromise, service disruption, security breach |
| Medium | Elevated or limited administrative access | Unauthorized changes, data exposure, operational impact |
| Low | Standard or low-impact access | Minimal operational or security impact |

---

## Risk Classification Mapping

### High Risk

| Group | Access Scope |
|---|---|
| IAM-IT-System Administrator | Full privileged administrative access |

#### Controls

- Monthly access reviews
- MFA and hardened Conditional Access requirements
- Continuous monitoring and auditing

---

### Medium Risk

| Group | Access Scope |
|---|---|
| IAM-Finance-Accounting Manager | Financial and billing administration |
| IAM-IT-Service Desk Technician | Limited identity administration |
| IAM-IT-Cybersecurity Analyst | Security visibility and limited security administration |
| IAM-Software Development-Product Manager | Enterprise application management |
| IAM-Software Development-Software Architect | Enterprise application management |
| IAM-Software Development-Software Developer | Application registration and API permission management |

#### Controls

- Quarterly access reviews
- MFA enforcement
- Privileged activity monitoring

---

### Low Risk

| Group | Access Scope |
|---|---|
| IAM-Human Resources-HR Management | Read-only directory access |
| IAM-Sales-Account Executive | Guest user management |
| IAM-Finance-Accounting Staff | Low-impact financial access |

#### Controls

- Semi-annual access reviews
- Standard security controls

---

## Governance Controls

| Risk Level | Review Frequency | Approval Required | Auto-Removal if No Response |
|---|---|---|---|
| High | Monthly | Yes | Yes |
| Medium | Quarterly | Yes | Yes |
| Low | Semi-Annual | No | No |

---

## Reporting Alignment

Risk classifications are integrated with:

- Access Reviews
- IAM audit reporting
- Governance dashboards
- Conditional Access protections
- Privileged access monitoring

This alignment ensures consistency across governance, reporting, and enforcement processes.

---

## Governance Requirements

- High-risk groups must have designated owners
- Privileged access must be continuously monitored
- Access reviews must align with assigned risk levels
- Risk classifications must be periodically reevaluated

---

## Conclusion

The implemented risk classification model provides a governance-aligned framework for evaluating and managing access risk across the environment.

The model supports risk-based governance, privileged access protection, and audit-ready IAM reporting aligned with enterprise security practices.
