# Access Governance - Module 2

## Overview

This module implements an enterprise-style IAM governance framework using Microsoft Entra ID, PowerShell, Microsoft Graph API, and Power BI.

The implementation focuses on RBAC governance, risk-based access classification, periodic access reviews, and audit-ready reporting aligned with least privilege and Zero Trust principles.

<img src="reports/dashboard.png" width="900">

---

## Key Capabilities

- RBAC governance using IAM-managed groups
- Risk-based access classification
- Periodic Access Reviews
- Unauthorized access detection and remediation
- Automated IAM reporting and audit visibility
- Power BI governance dashboard

---

## Governance Model

The governance framework is based on the following controls:

| Control | Purpose |
|---|---|
| RBAC | Centralized group-based authorization |
| Risk Classification | Prioritize access based on privilege and business impact |
| Access Reviews | Validate and recertify access periodically |
| Audit Reporting | Provide governance visibility and traceability |

---

## IAM Dashboard

The Power BI dashboard provides visibility into:

- User risk distribution
- Privileged access exposure
- Inactive accounts
- Governance review outcomes

The reporting model aligns directly with the implemented risk classification and governance controls.

---

## Audit Simulation

The module includes realistic IAM governance scenarios validating:

- Unauthorized privileged access remediation
- Legitimate privileged access validation
- Medium-risk financial access reviews

**Detailed audit scenarios and evidence: [Access Review Audit Simulation](docs/audit-simulation.md)**

---

## Documentation

| Document | Description |
|---|---|
| [Business Rules](docs/business-rules.md) | RBAC governance rules and access model |
| [Risk Classification](docs/risk-classification.md) | Risk-based access classification framework |
| [Audit Simulation](docs/audit-simulation.md) | Access Review validation scenarios and evidence |

---

## Automation and Reporting

The module includes automated access reporting using PowerShell and Microsoft Graph API.

### Included Artifacts

- IAM access audit report (CSV)
- Executive summary report
- Power BI governance dashboard

---

## Technologies

- Microsoft Entra ID
- Microsoft Graph API
- PowerShell
- Power BI

---

## Key IAM Concepts Demonstrated

- RBAC governance
- Access Reviews
- Risk-based access classification
- Least privilege enforcement
- Audit-ready IAM reporting
- Governance visibility and traceability

---

## Conclusion

This module demonstrates how enterprise IAM governance controls can be implemented, validated, and visualized through automated reporting and access review processes.

The implementation reflects real-world governance practices focused on privileged access control, audit readiness, and identity-centric security.
