<h1>IAM Enterprise Simulation</h1>

<h2>Overview</h2>
This project simulates a real-world Identity and Access Management (IAM) environment, designed to reflect how modern organizations manage identity lifecycle, access control, and security at scale. The solution focuses on automation, governance, and Zero Trust principles using Microsoft Entra ID, PowerShell, and Microsoft Graph API.
<br />
<br />
<h2>Objectives</h2>

- Simulate enterprise IAM processes (Joiner, Mover, Leaver)
- Implement structured access control using RBAC
- Demonstrate access governance and audit capabilities
- Apply Zero Trust security concepts to identity
- Showcase automation using scripting and APIs
<br />
<h2>Architecture</h2>

The architecture models a centralized identity system where Microsoft Entra ID acts as the control plane for authentication, authorization, and policy enforcement.

Key components include:

- Identity provider (Entra ID)
- Automation layer (PowerShell + Graph API)
- Access control layer (RBAC groups)
- Governance layer (access reviews, audit logs)
- Security layer (MFA, SSO, Conditional Access, Zero Trust)

Detailed diagrams and design decisions are available in the [/architecture](https://github.com/KKingsS17/iam-enterprise-simulation/blob/main/architecture/README.md) folder.
<br />
<br />
<h2>Modules</h2>

<h3>Architecture</h3>

High-level IAM design, including system components, identity flows, and trust boundaries.
<br />
<br />
<h3>Lifecycle Automation</h3>

Implements Joiner, Mover, and Leaver (JML) processes using PowerShell.

Features:

- Automated user provisioning
- Role-based group assignment
- Structured logging and reporting
- Error handling and traceability
<br />
<h3>Access Governance</h3>

Focuses on visibility and control of access.

Includes:

- Access reviews
- Audit logging
- Governance policies aligned with least privilege
<br />
<h3>Access Control Models</h3>

Defines how access is structured across the environment.

Includes:

- Role-Based Access Control (RBAC)
- Group design strategy
- Naming conventions and scope control
<br />
<h3>Automation API</h3>

Integration with Microsoft Graph API to extend automation capabilities.

Includes:

- Programmatic identity management
- API-based provisioning and updates
<br />
<h3>Security – Zero Trust</h3>

Applies Zero Trust principles to identity and access.

Includes:

- Conditional Access policies
- Identity as the security perimeter
- Continuous verification model
<br />
<h2>Technologies</h2>

- Microsoft Entra ID (Azure AD)
- PowerShell
- Microsoft Graph API
<br />
<h2>Key Capabilities Demonstrated</h2>

- Identity lifecycle automation (JML)
- RBAC-based access control design
- Governance and audit readiness
- Secure identity architecture (Zero Trust)
- Scripted automation with structured logging
<br />
<h2>Project Goal</h2>

The goal of this project is to demonstrate practical, enterprise-level IAM skills by building a structured and auditable identity system that reflects real-world scenarios.
<br />
<br />
<h2>Notes</h2>

This is a simulation project intended for learning and demonstration purposes, but it is designed following real enterprise IAM practices.

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
