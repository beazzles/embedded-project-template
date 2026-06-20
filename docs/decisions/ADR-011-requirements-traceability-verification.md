# ADR-011: Requirements Traceability Verification
## Status
Accepted

## Context
The project uses Doorstop for requirements management and traceability.

ADR-003 established a hierarchical requirements structure consisting of:
- System Requirements (SYS)
- Software Requirements (SWE)
- Verification Requirements (VER)

The project aims to follow professional embedded software engineering practices with a strong focus on quality, maintainability, verification and traceability.

Without automated validation, incomplete traceability can occur. Examples include:
- A system requirement without a corresponding software requirement.
- A software requirement without a corresponding verification requirement.
- Missing links between related requirements.

Such inconsistencies may remain unnoticed until late project stages and require manual review effort to detect.

An automated validation mechanism is required to ensure that the requirement hierarchy remains complete and consistent throughout the project lifecycle.

## Decision Drivers
- Ensure complete requirements traceability.
- Detect missing requirement links as early as possible.
- Support safety- and security-oriented development practices.
- Enable automated validation within CI/CD pipelines.
- Reduce reliance on manual reviews.
- Maintain a consistently structured requirements hierarchy.

## Considered Options
### Option A: No Automated Validation
Requirements traceability is reviewed manually.

#### Advantages
- No additional tooling or CI integration required.
- Maximum felxibility during development.

#### Disadvantages
- Missing traceability may remain undetected.
- High manual review effort.
- Increased risk of inconsistencies.

### Option B: Standard Doorstop Validation
Use the standard Doorstop validation command:
```bash
doorstop
```

#### Advantages
- Simple integration.
- Detects many structural issues.

#### Disadvantages
- Missing child relationships may not be enforced.
- Incomplete SYS -> SWE -> VER chains can still occur. 

### Option C: Standard Validation and Strict Child Validation
Use both validation mechanisms:
```bash
doorstop
doorstop --strict-child-check
```

#### Advantages
- Enforces complete requirements traceability.
- Detects missing SYS -> SWE -> VER relationships immediately.
- Supports the project´s quality objectives.
- Suitable for automated CI enforcement.
- Aligns with professional engineering practices.

#### Disadvantages
- Increased discipline required when creating requirements.
- Work-in-progress requirements may temporarily fail validation.
- Slightly higher maintenance effort.

## Decision Outcome
Chosen option: **Option C**

The project shall use both Doorstop validation mechanisms:
```bash
doorstop
doorstop --strict-child-check
```

Requirements validation shall be executed automatically within the CI pipeline.

Any validation failure shall be treated as a quality gate failure and shall cause the pipeline to fail.

This decision ensures that every requirement remains traceable across the complete hierarchy from system requirements to verification requirements.

## Consequences
### Positive
- Complete requirements traceability is enforced.
- Missing requirement links are detected early.
- Reduced manual review effort.
- Improved consistency of the requirements database.
- Better alignement with professional embedded development practices.
- Strong foundation for future safety- and security-related processes.

### Negative
- Additional maintenance effort when creating requirements.
- Developers must create and link requirements consistently.
- Temporary work-in-progress requirements may fail validation until fully linked.
- Doorstop v3.1 may report a false-positive warning when using
  `--strict-child-check` despite correctly linked requirements.
  The warning does not affect the command exit code and does not
  prevent successful validation.

  The project shall continue using `--strict-child-check`
  because the additional traceability validation provides greater
  value than the inconvenience of the known warning.

  Future Doorstop versions should be re-evaluated to determine
  whether this behavior has been resolved.