<h1>Lifecycle Automation - Module 1</h1>

<h2>Overview</h2>
This module simulates enterprise-grade Identity Lifecycle Automation, implementing Joiner, Mover, and Leaver (JML) processes using PowerShell, Microsoft Graph API, and Microsoft Entra ID. The goal is to simulate integration with an HR system, automate user provisioning, updates, deprovisioning, and apply role-based access control through dynamic group assignment while ensuring consistency, traceability, and alignment with access control policies.
<br />
<br />

<h2>Objective</h2>

The goal of this module is to automate user lifecycle management:

- Provision new users (Joiner)
- Update existing users based on changes (Mover)
- Deprovision users securely (Leaver)

The system ensures:
- Consistency between HR data and Entra ID
- Proper access assignment
- Auditability through logs and reporting
<br />

<h2>Architecture</h2>

HR System (CSV) → Validation → Entra ID (Microsoft Graph)

Processing Flow:
1. Validate input records
2. Check if user exists
3. Execute:
   - Joiner
   - Mover
   - Leaver
4. Update group memberships
5. Generate audit report

<h3>Diagram</h3>

```mermaid
flowchart LR

    %% =====================
    %% DATA LAYER
    %% =====================
    subgraph Data Layer
        A[HR System<br/>CSV File]
    end

    %% =====================
    %% PROCESSING LAYER
    %% =====================
    subgraph Processing Layer
        B[Validation Engine]
        C{User Exists?}
        D[JOINER<br/>Create User]
        E{Changes Detected?}
        F[MOVER<br/>Update Attributes]
        G[LEAVER<br/>Disable User]
        H[Group Assignment Logic]
    end

    %% =====================
    %% IDENTITY LAYER
    %% =====================
    subgraph Identity Layer
        I[Microsoft Entra ID]
        J[Security Groups<br/>RBAC Model]
    end

    %% =====================
    %% OUTPUT / AUDIT LAYER
    %% =====================
    subgraph Output & Audit Layer
        K[Structured Logs]
        L[Access Report CSV]
    end

    %% =====================
    %% FLOW
    %% =====================
    A --> B
    B --> C

    C -->|No| D
    C -->|Yes| E

    E -->|No| K
    E -->|Yes| F

    C -->|Terminated| G

    D --> H
    F --> H
    G --> H

    H --> J
    J --> I

    I --> K
    I --> L
```
