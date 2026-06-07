# ADR-003: Use a Three-Level Requirements Hierarchy
## Status
Accepted

## Context
The project template aims to support professional embedded software development practices including:
- Requirements traceability
- Verification planning
- Safety-oriented workflows
- Security-oriented workflows

A structured requirements hierarchy is required.

## Decision
The project shall use three requirement levels:
- SYS (System Requirements)
- SWE (Software Requirements)
- VER (Verification Requirements)

Requirements should be linked through a traceability chain.

Example:

SYS -> SWE -> VER

System requirements describe externally visible system behavior.

Software requirements describe implementation-related software behavior.

Verification requirements describe how requirements are verified.

Requirement IDs:
- SYSxxx (System Requirements)
- SWExxx (Software Requirements)
- VERxxx (Verification Requirements)

## Consequences
### Positive
- Clear separation of requirement levels
- Improved traceability 
- Supports testing activities
- Scales to larger projects
- Compatible with safety-oriented development processes

### Negative
- Additional documentation effort
- Contributors must understand requirement hierarchy

## Related Documents
- CONTRIBUTING.md
- requirements/