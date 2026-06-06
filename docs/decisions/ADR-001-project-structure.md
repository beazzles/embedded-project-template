# ADR-001: Use a Modular and Language-Agnostic Project Structure
## Status
Accepted

## Context
The project template is intended to support multiple embedded software domains, including:
- STM32 firmware developement
- Embedded Linux developement
- Raspberry Pi projects
- Security-related projects
- Edge AI projects

The template should not enforce a specific programming language and should remain applicable to future technologies and platforms.

## Decisions
The repository shall use a modular and language-agnostic structure.

Responsibilities shall be separated into dedicated directories:
- app/
- modules/
- platform/
- tests/
- requirements/
- docs/
- scripts/
- tools/

The template shall not contain any source code files by default.

Platform-specific artifacts, including generated code, shall be isolated from application and module code.

## Consequences
### Positive
- Applicable to C and C++ projects
- Supports multiple target platforms
- Encourages separatation of concerns
- Supports testing and traceability
- Scales to larger projects

### Negative
- Slightly higher initial complexity
- Requires project-specific conventions for source code placement