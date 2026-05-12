# Conditional Access Policies

## Overview

This document defines the Conditional Access framework implemented within the environment.

The implementation follows a layered Zero Trust security model designed to strengthen authentication, protect privileged access, and enforce contextual security controls using Microsoft Entra ID.

---

## Conditional Access Architecture

The Conditional Access framework is organized into the following security layers:

| Layer | Purpose |
|---|---|
| Baseline | Core protections applied across the environment |
| Authentication Security | Protection of authentication registration processes |
| Privileged Access | Hardened controls for administrative access |
| Contextual Controls | Location and context-aware access restrictions |
| Risk-Based Protection | Automated response to risky sign-ins and compromised users |

---

## Policy Inventory

### Baseline Policies

| Policy | Purpose |
|---|---|
| CA01-BASE-RequireMFA-AllUsers | Require MFA for all users |
| CA02-BASE-BlockLegacyAuth | Block legacy authentication |
| CA03-BASE-RequireCompliantDevice | Require compliant devices |
| CA04-BASE-RequireMFA-GuestUsers | Require MFA for guest users |

#### Key Controls

- MFA enforcement
- Legacy authentication blocking
- Compliant device enforcement
- Guest access protection

#### Notes

- CA03-BASE-RequireCompliantDevice is currently configured in **Report-only** mode to evaluate operational impact before enforcement.
- Break-glass accounts, service accounts, and service principals are excluded where appropriate.

---

### Authentication Security Policies

| Policy | Purpose |
|---|---|
| CA05-AUTH-SecureSecurityInfoRegistration | Protect MFA and authentication method registration |

#### Key Controls

- MFA enforcement for registration processes
- Protection against unauthorized authentication method changes

---

### Privileged Access Policies

| Policy | Purpose |
|---|---|
| CA10-PRIV-HardenedAccess-Admins | Harden privileged authentication and device requirements |
| CA11-PRIV-SignInFrequency-Admins | Restrict privileged session persistence |

#### Key Controls

- Phishing-resistant MFA
- Compliant device requirements
- Restricted privileged session duration

---

### Contextual Access Policies

| Policy | Purpose |
|---|---|
| CA20-LOC-BlockNonTrustedCountries | Restrict access from non-approved countries |
| CA21-LOC-Admins-ExternalRestrictions | Apply stricter controls to privileged external access |

#### Trusted Locations

- Costa Rica
- United States

#### Key Controls

- Geographic access restrictions
- Hardened controls for external privileged access

---

### Risk-Based Policies

| Policy | Purpose |
|---|---|
| CA30-RISK-HighSignInRisk | Respond to risky sign-in attempts |
| CA31-RISK-UserRisk | Respond to compromised or high-risk users |

#### Key Controls

- Risk-based MFA enforcement
- Automated password reset requirements
- Identity Protection integration

#### Notes

These policies require Microsoft Entra ID P2 licensing.

---

## Break-Glass Account Strategy

Emergency access accounts are excluded from Conditional Access enforcement to ensure administrative recovery capabilities remain available during outages or policy misconfigurations.

### Security Protections

- Phishing-resistant authentication
- Offline credential storage
- Continuous monitoring and auditing

---

## Zero Trust Alignment

The Conditional Access framework supports Zero Trust principles through continuous evaluation of:

- User identity
- Authentication strength
- Device compliance
- Geographic location
- Sign-in risk

The implementation follows a “verify explicitly” approach before granting access to resources.

---

## Conclusion

This Conditional Access implementation demonstrates a layered enterprise security architecture focused on:

- Strong authentication enforcement
- Privileged access hardening
- Context-aware access control
- Risk-based remediation
- Identity-centric Zero Trust security

The policies provide scalable and governance-aligned access protection consistent with modern enterprise IAM practices.
