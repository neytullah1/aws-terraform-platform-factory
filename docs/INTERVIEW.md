# Interview guide

**Why not a single monolithic module?** Separate resource modules from higher-level compositions to reduce coupling while preserving standard patterns.

**What prevents hardcoding bypass?** Validation alone cannot prevent it. Security-owned plan policy and AWS authorization must enforce invariants even when raw resources are declared.

**Why Scalr?** Centralized workspace, state, policy, approval and VCS-driven runs; GitHub CI never holds production apply credentials.

**How do you handle drift?** Detect, classify intended/unintended, reconcile with code/import after review, and avoid automatically overwriting production exceptions.

**What's tested?** Python structural tests and optionally Terraform/OPA offline validation; no live AWS/Scalr execution.
