# MFA & Authentication Strategy

## Overview

This document defines the authentication and Multi-Factor Authentication (MFA) strategy implemented across the IAM Enterprise Simulation environment.

The architecture focuses on strengthening identity assurance through phishing-resistant authentication, passwordless technologies, and context-aware authentication enforcement.

The implementation aligns with Zero Trust principles by continuously validating authentication strength before granting access to enterprise resources.

---

## Authentication Objectives

| Objective | Implementation |
|---|---|
| Reduce credential theft | MFA enforcement |
| Protect privileged identities | Hardened authentication requirements |
| Eliminate weak authentication | Block legacy authentication |
| Improve authentication assurance | Phishing-resistant MFA |
| Reduce password dependency | Passwordless authentication |

---

## Authentication Methods

### Microsoft Authenticator

Used as the primary MFA method for standard users and administrative accounts.

### FIDO2 Passkeys

Used to provide phishing-resistant authentication for privileged users.

### Passwordless Authentication

Implemented to reduce password exposure and improve authentication security.

---

## MFA Enforcement Model

MFA is enforced through Conditional Access policies based on:

- User role
- Privilege level
- Device compliance
- Risk signals
- Geographic location
- Authentication strength

This ensures authentication requirements dynamically adapt to risk and context.

---

## Privileged Identity Protection

Privileged accounts require additional authentication protections.

### Administrative Security Controls

- Mandatory MFA
- FIDO2 authentication
- Compliant device requirements
- Session restrictions
- Geographic access restrictions

### Protected Roles

- Global Administrators
- System Administrators
- Application Administrators

---

## Phishing-Resistant Authentication

The environment prioritizes phishing-resistant authentication methods to reduce credential compromise risk.

### Implemented Protections

- FIDO2 Passkeys
- Passwordless authentication
- Modern authentication protocols
- Legacy authentication blocking

This reduces exposure to:

- Credential phishing
- MFA fatigue attacks
- Password spray attacks
- Token theft attacks

---

## MFA Registration Protection

MFA registration workflows are protected through Conditional Access controls.

### Security Controls

- Require MFA during registration
- Restrict registration from unmanaged devices
- Validate user identity before security info changes

This prevents unauthorized modification of authentication methods.

---

## Authentication Flow

```text
User Authentication Attempt
            ↓
Conditional Access Evaluation
            ↓
Authentication Strength Validation
            ↓
MFA / Passkey Challenge
            ↓
Access Granted / Blocked
```

---

## Integration with Zero Trust

The MFA strategy supports the following Zero Trust principles:

| Principle | Authentication Implementation |
|---|---|
| Verify Explicitly | MFA and authentication strength validation |
| Least Privilege | Hardened privileged authentication |
| Assume Breach | Continuous authentication validation |
| Continuous Verification | Session and risk evaluation |

---

## Related Documentation

- [Zero Trust Model](zero-trust-model.md)
- [Conditional Access](conditional-access.md)
- [Identity Protection](identity-protection.md)

---

## Notes

This MFA strategy was designed to simulate modern enterprise authentication security practices using Microsoft Entra ID, Conditional Access, and phishing-resistant authentication technologies.
