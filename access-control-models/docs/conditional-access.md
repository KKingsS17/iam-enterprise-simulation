# Conditional Access Policies

## Overview

This document defines the Conditional Access framework implemented within the environment.

The policies follow a layered Zero Trust security model designed to enforce:

- Strong authentication
- Device compliance
- Context-aware access controls
- Privileged access protection
- Risk-based remediation

The implementation aligns with enterprise IAM and security best practices using Microsoft Entra ID.

---

## Conditional Access Architecture

The Conditional Access model is organized into the following security layers:

| Layer | Purpose |
|---|---|
| Baseline | Core protections applied to all users |
| Authentication Security | Protection of authentication registration processes |
| Privileged Access | Hardened controls for administrative access |
| Contextual Controls | Location-based and contextual restrictions |
| Risk-Based Protection | Automated response to risky sign-ins and compromised users |

---

## Policy Inventory

### Baseline Policies

#### CA01-BASE-RequireMFA-AllUsers

#### Objective
Require Multi-Factor Authentication (MFA) for all users across all cloud applications.

#### Scope
- All users
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Require MFA

#### Purpose
Establishes MFA as the baseline authentication requirement across the environment.

---

#### CA02-BASE-BlockLegacyAuth

#### Objective
Block legacy authentication protocols that do not support modern authentication or MFA.

#### Scope
- All users
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Block legacy authentication clients

#### Purpose
Reduces exposure to password spray and credential-based attacks.

---

#### CA03-BASE-RequireCompliantDevice

#### Objective
Require access from compliant and managed devices.

#### Scope
- Corporate users
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Require compliant device

#### Notes
This policy is currently configured in **Report-only** mode to evaluate operational impact before enforcement.

#### Purpose
Improves endpoint security posture and reduces access from unmanaged devices.

---

#### CA04-BASE-RequireMFA-GuestUsers

#### Objective
Require MFA for guest and external users.

#### Scope
- Guest users

#### Controls
- Require MFA

#### Purpose
Protects collaboration scenarios involving external identities.

---

### Authentication Security Policies

#### CA05-AUTH-SecureSecurityInfoRegistration

#### Objective
Protect the registration and modification of authentication methods and security information.

#### Scope
- All users
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Require MFA
- Restrict registration to trusted conditions

#### Purpose
Reduces the risk of unauthorized MFA registration or authentication method manipulation.

---

### Privileged Access Policies

#### CA10-PRIV-HardenedAccess-Admins

#### Objective
Enforce hardened authentication and device security requirements for privileged users.

#### Scope
- Administrative roles and privileged groups
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Require phishing-resistant MFA
- Require compliant device

#### Purpose
Provides additional protection for privileged access and reduces the risk of administrative compromise.

---

#### CA11-PRIV-SignInFrequency-Admins

#### Objective
Limit session persistence for privileged users.

#### Scope
- Administrative roles and privileged groups
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Sign-in frequency enforced for privileged sessions

#### Purpose
Reduces the risk associated with long-lived privileged sessions.

---

### Contextual Access Policies

#### CA20-LOC-BlockNonTrustedCountries

#### Objective
Restrict access from non-approved geographic locations.

#### Scope
- All users
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Block access from non-trusted countries

#### Trusted Locations
- Costa Rica
- United States

#### Purpose
Reduces exposure to unauthorized access attempts originating from untrusted regions.

---

#### CA21-LOC-Admins-ExternalRestrictions

#### Objective
Apply stricter access requirements for privileged users connecting from external or non-trusted locations.

#### Scope
- Administrative roles and privileged groups
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Require phishing-resistant MFA
- Require compliant device

#### Purpose
Provides additional protection for privileged access outside trusted locations.

---

### Risk-Based Policies

#### CA30-RISK-HighSignInRisk

#### Objective
Respond to high-risk sign-in attempts detected by Microsoft Entra ID Identity Protection.

#### Scope
- All users
- Excludes break-glass accounts, service accounts, and service principals.

#### Controls
- Require MFA or block access for high-risk sign-ins

#### Notes
Requires Microsoft Entra ID P2 licensing.

#### Purpose
Mitigates account compromise and suspicious authentication activity.

---

#### CA31-RISK-UserRisk

#### Objective
Respond to users identified as compromised or high-risk.

#### Scope
- All users
- Excludes break-glass accounts, service accounts, and service principals

#### Controls
- Require password reset for high-risk users

#### Notes
Requires Microsoft Entra ID P2 licensing.

#### Purpose
Supports automated remediation of compromised identities.

---

## Break-Glass Account Strategy

Break-glass accounts are excluded from all Conditional Access policies.

These accounts are reserved exclusively for emergency administrative access scenarios and are protected through:

- Strong authentication methods
- Offline credential storage
- Continuous monitoring and auditing

This approach ensures emergency access remains available even during Conditional Access failures or misconfigurations.

---

## Zero Trust Alignment

The Conditional Access framework supports Zero Trust principles by enforcing:

- Verify explicitly
- Use least privilege access
- Assume breach

Security decisions are continuously evaluated based on:

- User identity
- Device compliance
- Location
- Risk level
- Authentication strength

---

## Conclusion

This Conditional Access implementation demonstrates a layered enterprise security model designed to:

- Strengthen identity protection
- Harden privileged access
- Enforce contextual security controls
- Reduce attack surface
- Support governance and compliance requirements

The policies provide scalable and audit-ready access protection aligned with modern enterprise IAM practices.

