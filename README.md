# IAM Enterprise Simulation

## Overview

This project simulates a modern enterprise Identity and Access Management (IAM) environment built using Microsoft Entra ID, Microsoft Graph API, PowerShell, and Zero Trust security principles.

The implementation demonstrates how organizations automate identity lifecycle management, govern access, enforce security controls, and maintain audit-ready visibility across enterprise environments.

The project focuses on:

- Identity lifecycle automation
- RBAC and ABAC access control
- Dynamic access provisioning
- Conditional Access and Zero Trust
- IAM governance and audit readiness
- Microsoft Graph API automation

<img src="access-governance/reports/dashboard.png" width="950">

---

## Enterprise IAM Architecture

The environment models a centralized identity architecture where Microsoft Entra ID acts as the control plane for authentication, authorization, governance, and policy enforcement.

| Layer | Components |
|---|---|
| Identity | Microsoft Entra ID |
| Automation | PowerShell + Microsoft Graph API |
| Access Control | RBAC + Dynamic Groups |
| Governance | Access Reviews + Audit Reporting |
| Security | Conditional Access + Zero Trust |

---

## Core IAM Capabilities

- Identity Lifecycle Automation (JML)
- RBAC and ABAC Access Models
- Dynamic Group Management
- Conditional Access Enforcement
- Access Reviews and Governance
- Risk-Based Access Classification
- Privileged Access Protection
- IAM Audit Reporting
- PowerShell Automation
- Microsoft Graph API Integration

---

## Project Modules

### Lifecycle Automation — Module 1

🔗 **[Module Details](lifecycle-automation/README.md)**

Implements enterprise Joiner, Mover, and Leaver (JML) automation workflows using PowerShell and Microsoft Graph API.

#### Highlights

- Automated user provisioning and deprovisioning
- RBAC-based access assignment
- Differential attribute updates
- Automated group reassignment
- Structured audit logging and reporting

#### Technologies

- PowerShell
- Microsoft Graph API
- Microsoft Entra ID

---

### Access Governance — Module 2

🔗 **[Module Details](access-governance/README.md)**

Implements governance and audit processes aligned with enterprise IAM practices.

#### Highlights

- Access Reviews
- Risk-based access classification
- Governance-aligned RBAC controls
- Audit simulation scenarios
- Automated IAM reporting
- Power BI governance dashboard

#### Technologies

- Microsoft Entra ID Identity Governance
- PowerShell
- Microsoft Graph API
- Power BI

---

### Access Control Models — Module 3

🔗 **[Module Details](access-control-models/README.md)**

Implements a layered RBAC and ABAC access control architecture with dynamic identity-driven access assignment and Conditional Access enforcement.

#### Highlights

- RBAC and ABAC integration
- Dynamic Groups
- Conditional Access architecture
- Context-aware access enforcement
- Privileged access hardening
- Zero Trust validation scenarios

#### Technologies

- Microsoft Entra ID
- Conditional Access
- Dynamic Groups
- PowerShell

---

### Automation API — Module 4 *(In Progress)*

Extends IAM automation capabilities through direct Microsoft Graph API integration.

#### Planned Features

- API-driven provisioning
- Identity automation workflows
- Programmatic access management
- REST API integrations

---

### Security – Zero Trust — Module 5 *(In Progress)*

Implements Zero Trust security principles focused on identity-centric security controls.

#### Planned Features

- Identity Protection
- Risk-based access controls
- Phishing-resistant authentication
- Continuous verification
- Advanced Conditional Access scenarios

---

## Technologies

- Microsoft Entra ID (Azure AD)
- Microsoft Graph API
- PowerShell
- Power BI
- Conditional Access
- Dynamic Groups

---

## Current Project Status

| Module | Status |
|---|---|
| Lifecycle Automation | ✅ Completed |
| Access Governance | ✅ Completed |
| Access Control Models | ✅ Completed |
| Automation API | 🚧 In Progress |
| Security – Zero Trust | 🚧 In Progress |

---

## Project Goal

The goal of this project is to demonstrate practical enterprise IAM engineering skills through the implementation of a structured, automated, and governance-aligned identity environment.

The architecture, automation workflows, governance processes, and security controls are designed to reflect real-world enterprise IAM and Zero Trust practices.

---

## Notes

This project was created for learning, portfolio, and professional development purposes.

All implementations, workflows, governance controls, and security models are intentionally designed to simulate enterprise IAM operations commonly used in modern organizations.
