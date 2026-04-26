<h1>Lifecycle Automation</h1>

<h2>Overview</h2>
This module simulates enterprise-grade Identity Lifecycle Automation, implementing Joiner, Mover, and Leaver (JML) processes using PowerShell and Microsoft Entra ID. The goal is to automate user provisioning, updates, and deprovisioning while ensuring consistency, traceability, and alignment with access control policies.
<br />
<br />

<h2>Objectives</h2>

- Automate identity lifecycle events (Joiner, Mover, Leaver)
- Enforce role-based access assignment
- Ensure auditability through structured logging
- Handle errors gracefully and maintain system integrity
<br />

<h2>Scope</h2>

This module focuses on identity operations within Microsoft Entra ID, including:

- User creation and updates
- Group-based access assignment
- Account disablement and cleanup
- Logging and reporting of all operations
<br />

<h2>Architecture Role</h2>

This component acts as the automation layer of the IAM system.

It integrates with:

- Identity provider (Entra ID)
- Access control layer (RBAC groups)
- Governance layer (audit logs and reporting)
<br />

<h2>Processes</h2>

<h3>Joiner</h3>

Handles onboarding of new users.

Key actions:

- Creates user in Entra ID
- Assigns groups based on role or department
- Applies initial access configuration
- Logs all actions
<br />

<h3>Mover</h3>

Handles changes in user attributes (e.g., department, role).

Key actions:

- Updates user properties
- Adjusts group memberships
- Removes outdated access
- Ensures least privilege is maintained
<br />

<h3>Leaver</h3>

Handles offboarding of users.

Key actions:

- Disables account
- Removes group memberships
- Prevents further access
- Logs deprovisioning actions
<br />

<h2>Features</h2>

- Role-Based Access assignment (RBAC-driven)
- Structured logging for audit and traceability
- Error handling and validation
- Idempotent logic to prevent duplication or inconsistent state
- Scalable script structure
<br />

<h2>Technologies</h2>

- <b>Microsoft Entra ID</b>
- <b>PowerShell</b> 
- <b>Microsoft Graph API</b>
<br />

<h2>Script</h2>

Main script:

```powershell
lifecycle_automation_v1.ps1
```
<br />

<h2>Logging and Output</h2>

The system generates logs to provide full visibility into identity operations.

Log characteristics:

- Timestamped entries
- Action tracking (create, update, disable)
- Success and error states
- Execution summary report
<br />

<h2>Design Considerations</h2>

- Least privilege enforced via group-based access
- Separation of concerns between identity and access logic
- Resilience through error handling and validation checks
- Designed to simulate real enterprise IAM workflows
<br />

<h2>Example Flow</h2>

1. Input data (e.g., new employee)
2. Script evaluates current state
3. Determines required action (Joiner, Mover, Leaver)
4. Executes changes in Entra ID
5. Assigns or removes access via groups
6. Logs all operations for audit purposes
<br />

<h2>Limitations</h2>

- Simulation environment (no HR system integration)
- Limited to Entra ID scope
- Does not include approval workflows
<br />

<h2>Future Improvements</h2>

- Integration with HR systems (source of truth)
- API-based event-driven automation
- Access review integration
- Notification system (email or Teams)
- Role mining and dynamic group assignment
<br />

<h2>Summary</h2>

This module demonstrates how identity lifecycle processes can be automated in a structured, auditable, and scalable way, aligning with enterprise IAM best practices.

<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
