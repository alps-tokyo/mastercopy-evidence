# Master Copy Evidence Verification Guide

## Step 1: Verify Report Signature

```bash
bash verify_signature.sh
```

## Step 2: Inspect Independent SHA-256 Audit

```bash
jq '.independent_audit' report.json
```

`mismatch`, `missing`, and `new` must all be `0`.

## Step 3: Inspect Raw Logs

Raw command output is stored in `raw/`. The main files are:

- `hashdeep_source_manifest.txt`
- `hashdeep_audit.txt`
- `doctor_copy.log`
- `doctor_faults.log`
- `doctor_verifyproof.log`
- `environment.json`
