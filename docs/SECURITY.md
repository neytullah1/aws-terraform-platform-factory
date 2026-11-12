# Terraform factory threat model

* A user may replace `module "ecr"` with raw `aws_ecr_repository`; module defaults alone are **not** an enforcement boundary. Mandatory external policy on complete Scalr plan plus AWS IAM/SCP guardrails must block unsafe variants.
* An attacker may edit a PR workflow to skip scans; GitHub organization rulesets and independent required checks must be controlled by platform/security owners.
* A developer may manually change AWS resources; IAM denies unapproved writers, CloudTrail logs activity, drift detection flags changes, and approved import/reconciliation handles exceptions.
* An attacker may alter the Terraform state or Scalr variables; lock down workspace admin, state access, sensitive variables and execution role trust; audit all changes.
* An AI reviewer may hallucinate or ingest prompt injection from source code. Treat recommendations as untrusted, read-only, redacted and advisory. Do not expose state, plan secrets or credentials.
* No automated exception bypass. Exceptions require independent owner approval and time-limited policy changes.
