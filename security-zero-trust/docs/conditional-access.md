# Conditional Access Strategy

## Overview

This document defines the Conditional Access strategy implemented across the IAM Enterprise Simulation environment.

The architecture uses Conditional Access as the primary policy enforcement layer to validate identity, device trust, authentication strength, location, and risk signals before granting access to enterprise resources.

The implementation aligns with Zero Trust principles by enforcing continuous and context-aware access evaluation.

---

## Security Objectives

| Objective | Control |
|---|---|
| Protect privileged access | Hardened admin Conditional Access policies |
| Reduce credential theft | MFA and phishing-resistant authentication |
| Prevent unmanaged device access | Compliant device requirements |
| Reduce external attack surface | Geographic access restrictions |
| Respond to identity compromise | Risk-based Conditional Access policies |

---

## Policy Categories

| Category | Purpose |
|---|---|
| Baseline Policies | Core identity security enforcement |
| Privileged Access Policies | Hardened administrative access |
| Location Policies | Geographic access restrictions |
| Risk Policies | Identity Protection integration |
| Session Policies | Session security and sign-in controls |

---

## Implemented Controls

### Authentication Controls

- Require MFA
- Enforce phishing-resistant authentication
- Protect MFA registration workflows
- Block legacy authentication

### Device Controls

- Require compliant devices
- Restrict unmanaged device access
- Harden privileged administrative sessions

### Location Controls

- Restrict access from non-trusted countries
- Apply location-aware Conditional Access evaluation

### Risk Controls

- Respond to risky sign-ins
- Restrict access for high-risk identities
- Enforce additional verification for elevated risk events

### Session Controls

- Restrict privileged session persistence
- Enforce continuous session validation

---

## Privileged Access Protection

Privileged identities are protected through dedicated Conditional Access enforcement layers.

### Protected Roles

- Global Administrators
- System Administrators
- Application Administrators

### Additional Security Requirements

- MFA enforcement
- Phishing-resistant authentication
- Compliant devices
- Geographic restrictions
- Session restrictions

This reduces the risk of privileged account compromise and unauthorized administrative access.

---

## Enforcement Model

```text
User Sign-In
      ↓
Conditional Access Evaluation
      ↓
Identity & Risk Validation
      ↓
Device & Session Validation
      ↓
Access Granted / Blocked
```

---

## Integration with Zero Trust

Conditional Access acts as the primary policy enforcement engine within the Zero Trust architecture.

| Zero Trust Principle | Conditional Access Implementation |
|---|---|
| Verify Explicitly | MFA and authentication strength |
| Least Privilege | Scoped administrative access |
| Assume Breach | Risk-based access evaluation |
| Continuous Validation | Session and risk controls |
| Context-Aware Access | Device and location evaluation |

---

## Related Documentation

- [Zero Trust Model](zero-trust-model.md)
- [MFA Strategy](mfa-strategy.md)
- [Identity Protection](identity-protection.md)
- [Access Control Models](../../access-control-models/README.md)

---

## Notes

This Conditional Access strategy was designed to simulate how enterprise organizations implement identity-centric security enforcement using Microsoft Entra ID and Zero Trust access controls.
