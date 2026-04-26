<h1>Identity & Access Management - Business Rules</h1>

<h2>Purpose</h2>
This document defines the access control model and rules used to assign permissions within the organization. The goal is to ensure that access is granted based on business roles while enforcing the principle of least privilege.
<br />

<h2>Access Model Overview</h2>

Access is granted based on Role-Based Access Control (RBAC), where users are assigned to security groups based on their department and role.
All access must be assigned through IAM-managed groups. Direct user access is not allowed.

<h2>Naming Convention</h2>

IAM-managed groups follow this format:

"[Department]-[Role]"

<h2>Role-Based Access Rules</h2>

Finance Department
- Analyst → Access to financial reporting systems (read-only)
- Manager → Access to financial systems (read/write)

IT Department
- Admin → Full administrative access to infrastructure systems

Sales Department
- Manager → Access to CRM and reporting tools

<h2>Joiner / Mover / Leaver Rules</h2>

Joiner
- New users are automatically assigned to groups based on department and role attributes.

Mover
- When a user changes department or role:
  - Previous access is removed
  - New access is assigned based on updated attributes

Leaver
- User account is disabled
- All group memberships are removed
- Active sessions are revoked

<h2>Access Assignment Rules</h2>

- Access must always be assigned via IAM-managed groups
- No direct role assignment to users is allowed
- All access changes must be traceable via logs

<h2>Governance</h2>

- All high-risk groups must undergo periodic access reviews
- Access must be revalidated at least monthly for privileged roles


Launch the utility: <br/>
<img src="https://i.imgur.com/62TgaWL.png" height="80%" width="80%" alt="Disk Sanitization Steps"/>
<br />
<br />


<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
