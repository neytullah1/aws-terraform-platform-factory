# Scalr configuration checklist (manual; no API credentials)

1. Create Scalr account/environment for Platform and product account ownership; connect VCS to the **consumer root** (`live/product-a/nonprod`).
2. Set Terraform/OpenTofu version and working directory, enable VCS-driven plans on PRs and main branch; map each root to a distinct Scalr workspace and isolated state.
3. Configure AWS OIDC or approved short-lived credential federation **from Scalr** to an account-scoped execution role. Do not reuse GitHub build/deploy roles.
4. Restrict apply to approved branches and authorized Scalr identities. Enforce manual approval for prod. Protect Scalr workspace settings and policy bundles with separate admins.
5. Attach mandatory security-owned OPA policy checks to remote plans. Include policy checks for **all resource changes**, including raw resources outside approved modules; treat unknown values appropriately.
6. Add drift detection and notifications; changes made outside IaC must be imported/reconciled after review, not blindly overwritten.
7. Require sensitive variable encryption, redacted plan summaries and audited run logs. Avoid sending raw plan/state to LLM.
8. Publish modules to private registry, pin exact versions, use semantic versioning and promotion between workspaces.

**Separation of duties:** GitHub Actions performs formatting, validation, unit and static analysis. Scalr is the sole remote apply authority. GitHub Actions must not have production infrastructure write credentials.

**Unverified:** exact Scalr features/plan entitlements, VCS provider connection, OIDC trust details, mandatory policy syntax and workspace approval behavior require environment-specific validation.
