# Access Review Audit Simulation

## Objective

To validate that access across different risk levels is properly assigned, reviewed, and enforced in alignment with RBAC policies and governance controls.

## Scope

- High Risk: Privileged Access
- Medium Risk: Financial and Operational Access
- Low Risk: Business Access

## Methodology

Access Reviews were conducted using Microsoft Entra ID to evaluate group-based access assignments.
Each review validated whether user access aligned with defined business roles and risk classification.

## Scenario 1: Unauthorized Privileged Access (High Risk)

### Finding

A Service Desk user (Yuji Itadori) was incorrectly assigned to a privileged IAM group (IAM-IT-System Administrator).

### Risk

This access introduces a high risk of privilege escalation and potential compromise of critical systems.

### Action

Access was denied and removed through the Access Review process.

### Outcome

Unauthorized access was successfully remediated, restoring compliance with RBAC policies.

---

## Scenario 2: Valid Privileged Access (High Risk)

### Finding

A user (Satoru Gojo) was correctly assigned to a privileged IAM group based on their role.

### Validation

Access was verified against RBAC definitions and confirmed to align with job responsibilities.

### Action

Access was approved with justification.

### Outcome

Access was retained and documented as compliant.

---

## Scenario 3: Financial Access Review (Medium Risk)

### Finding

A user (Sasha Braun) maintained appropriate access aligned with their roles.

### Action

Access was reviewed and approved.

### Outcome

No remediation actions were required.

---

## Control Effectiveness

The access review process demonstrated the following:

- Detection and removal of unauthorized privileged access
- Validation and justification of legitimate access
- Enforcement of periodic reviews aligned with risk classification

## Dashboard Validation

<img src="../reports/dashboard." width="800">

The IAM dashboard was used to validate and visualize:

- Risk distribution across users
- Privileged access exposure
- Inactive accounts

This ensures consistency between governance definitions, automated reporting, and audit outcomes.

## Conclusion

The access review framework effectively enforces RBAC policies and supports governance by detecting and remediating inappropriate access while validating legitimate permissions.

## Evidence

### Scenario 1 – Unauthorized Access

- Initial state:

<img src="iam-enterprise-simulation/access-governance/evidence/screenshots/01-before-unauthorized-access.png" width="800">

- Access review detection:

<img src="iam-enterprise-simulation/access-governance/evidence/screenshots/02-access-review-members.png" width="800">

- Remediation action:

<img src="iam-enterprise-simulation/access-governance/evidence/screenshots/03-deny-remove-action.png" width="800">

- Post-remediation state:

<img src="iam-enterprise-simulation/access-governance/evidence/screenshots/05-after-remediation.png" width="800">
<img src="iam-enterprise-simulation/access-governance/evidence/screenshots/06-after-remediation.png" width="800">

### Scenario 2 – Valid Access

- Approved user:

<img src="iam-enterprise-simulation/access-governance/evidence/screenshots/04-approved-valid-user.png" width="800">
