# IAM Enterprise Simulation

## Overview

This project simulates a real-world enterprise Identity and Access Management (IAM) environment designed to reflect how modern organizations manage identity lifecycle, access governance, security, and automation at scale.

The implementation focuses on:

- Identity Governance
- RBAC and ABAC access models
- Conditional Access and Zero Trust
- Lifecycle automation
- Audit readiness
- Dynamic access management
- Automation using PowerShell and Microsoft Graph API

The environment is built using Microsoft Entra ID and follows enterprise IAM and Zero Trust security principles.

## Objectives

- Simulate enterprise Joiner, Mover, Leaver (JML) processes
- Implement scalable RBAC and ABAC access models
- Demonstrate governance and audit capabilities
- Enforce Zero Trust identity security controls
- Automate identity and access operations
- Validate access controls through real-world test scenarios

## Architecture

The environment models a centralized identity architecture where Microsoft Entra ID acts as the control plane for authentication, authorization, governance, and policy enforcement.

### Core Components

- Identity Provider → Microsoft Entra ID
- Automation Layer → PowerShell + Microsoft Graph API
- Access Layer → RBAC + Dynamic Groups
- Governance Layer → Access Reviews + Audit Reporting
- Security Layer → Conditional Access + Zero Trust

## Modules

### Lifecycle Automation

🔗 [Module Details](lifecycle-automation/README.md)

Implements enterprise Joiner, Mover, and Leaver (JML) automation workflows using PowerShell and Microsoft Graph.

#### Key Features

- Automated user provisioning
- Automated group assignment
- Identity lifecycle management
- Structured logging and reporting
- Error handling and traceability

#### Technologies

- PowerShell
- Microsoft Graph API
- Microsoft Entra ID

---

### Access Governance

🔗 [Module Details](access-governance/README.md)

Implements governance and audit processes aligned with enterprise IAM practices.

#### Key Features

- Access Reviews
- Risk-based access classification
- Governance policies
- Audit simulation scenarios
- Automated IAM reporting
- Power BI governance dashboard

#### Technologies

- Microsoft Entra ID Identity Governance
- PowerShell
- Microsoft Graph API
- Power BI

---

### Access Control Models (In Progress)

🔗 [Module Details](access-control-models/README.md)

Implements layered RBAC and ABAC access control architecture with dynamic identity-driven access assignment.

#### Planned Features

- RBAC and ABAC integration
- Dynamic Groups
- Conditional Access
- Context-aware access enforcement
- Privileged access hardening
- Zero Trust access validation

---

### Automation API (In Progress)

🔗 [Module Details](automation-api/README.md)

Extends IAM automation capabilities through direct Microsoft Graph API integration.

#### Planned Features

- API-driven provisioning
- Identity automation workflows
- Programmatic access management
- REST API integrations

---

### Security – Zero Trust (In Progress)

🔗 [Module Details](security-zero-trust/README.md)

Implements Zero Trust security principles focused on identity-centric security controls.

#### Planned Features

- Conditional Access architecture
- Identity Protection
- Risk-based access controls
- Phishing-resistant authentication
- Continuous verification model

---

## Technologies

- Microsoft Entra ID (Azure AD)
- Microsoft Graph API
- PowerShell
- Power BI

## Key IAM Capabilities Demonstrated

- Identity Lifecycle Automation (JML)
- RBAC and ABAC Access Models
- Dynamic Group Management
- Conditional Access
- Access Reviews and Governance
- IAM Audit Reporting
- Zero Trust Security Architecture
- PowerShell Automation
- Microsoft Graph API Integration

## Current Project Status

| Module | Status |
|---|---|
| Lifecycle Automation | ✅ Completed |
| Access Governance | ✅ Completed |
| Access Control Models | 🚧 In Progress |
| Automation API | 🚧 In Progress |
| Security – Zero Trust | 🚧 In Progress |

## Project Goal

The goal of this project is to demonstrate practical enterprise-level IAM engineering skills by building a structured, automated, and audit-ready identity environment aligned with real-world security and governance practices.

## Notes

This is a simulation project created for learning, demonstration, and portfolio purposes.

However, the architecture, governance model, security controls, and automation workflows are designed following real enterprise IAM and Zero Trust practices.
