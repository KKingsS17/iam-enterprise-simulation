# Security Zero Trust - Module 5

## Overview

This module implements a Zero Trust identity security architecture using Microsoft Entra ID, Conditional Access, Identity Protection, and phishing-resistant authentication controls.

The implementation focuses on identity-centric security by continuously validating users, devices, locations, sessions, and risk signals before granting access to enterprise resources.

The module demonstrates how modern organizations enforce Zero Trust principles through layered access controls, contextual authentication policies, and continuous access evaluation.

---

## Zero Trust Architecture

<p align="center">
  <img src="docs/evidence/security-architecture.drawio.svg" width="500">
</p>

The environment applies Zero Trust principles across authentication, authorization, risk evaluation, and session control workflows.

---

## Security Capabilities

- Conditional Access enforcement
- MFA and phishing-resistant authentication
- Identity Protection and risk-based access controls
- Device compliance validation
- Geographic access restrictions
- Privileged access hardening
- Session control enforcement
- Continuous access evaluation
- Context-aware authentication policies

---

## Conditional Access Controls

The environment implements layered Conditional Access policies aligned with enterprise Zero Trust practices.

### Implemented Controls

- Require MFA for all users
- Require compliant devices
- Block legacy authentication
- Restrict access from non-trusted countries
- Protect privileged administrative access
- Enforce sign-in session restrictions
- Secure MFA registration workflows
- Respond to risky sign-ins and compromised users

### Example Policies

| Policy | Purpose |
|---|---|
| CA01-BASE-RequireMFA-AllUsers | Require MFA for all users |
| CA03-BASE-RequireCompliantDevice | Restrict access to compliant devices |
| CA10-PRIV-HardenedAccess-Admins | Harden privileged administrative access |
| CA20-LOC-BlockNonTrustedCountries | Restrict access by geographic location |
| CA30-RISK-HighSignInRisk | Respond to risky sign-ins |
| CA31-RISK-UserRisk | Protect against compromised identities |

---

## Identity Protection

The implementation uses risk-based access controls to strengthen identity security.

### Risk Signals Evaluated

- Sign-in risk
- User risk
- Device trust
- Geographic location
- Authentication strength

### Automated Responses

- Block access
- Require MFA
- Restrict privileged access
- Enforce device compliance
- Trigger Conditional Access controls

---

## MFA Strategy

The MFA architecture focuses on phishing-resistant and context-aware authentication methods.

### Authentication Methods

- Microsoft Authenticator
- FIDO2 Passkeys
- Phishing-resistant MFA
- Passwordless authentication

### Security Objectives

- Reduce credential theft risk
- Protect privileged identities
- Eliminate legacy authentication exposure
- Strengthen authentication assurance levels

---

## Federation & SSO

The environment simulates enterprise federation and Single Sign-On (SSO) concepts using Microsoft Entra ID as the centralized identity provider.

### Federation Concepts

- Centralized authentication
- Identity trust relationships
- Application federation
- Seamless SSO experience
- Identity-based access enforcement

---

## Documentation

| Document | Description |
|---|---|
| [Zero Trust Model](docs/zero-trust-model.md) | Zero Trust architecture and security model |
| [Conditional Access](docs/conditional-access.md) | Conditional Access strategy and policy enforcement |
| [MFA Strategy](docs/mfa-strategy.md) | MFA architecture and phishing-resistant authentication |
| [Identity Protection](docs/identity-protection.md) | Risk-based identity protection controls |
| [SSO Federation](docs/sso-federation.md) | Federation and Single Sign-On architecture |

---

## Technologies

- Microsoft Entra ID
- Conditional Access
- Microsoft Entra ID Protection
- Microsoft Authenticator
- FIDO2 Security Keys
- PowerShell
- Microsoft Graph API

---

## Key IAM & Security Concepts Demonstrated

- Zero Trust identity architecture
- Identity-centric security
- Conditional Access enforcement
- Phishing-resistant authentication
- Risk-based access control
- Continuous access validation
- Context-aware authentication
- Privileged access protection
- Device trust enforcement
- Enterprise identity security operations

---

## Notes

This module is part of the broader IAM Enterprise Simulation project and was designed to simulate modern enterprise Zero Trust security architecture and identity protection practices.
