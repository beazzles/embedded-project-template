# ADR-013: Test Implementation Traceability

## Status
Accepted

## Context
ADR-003 established a hierarchical requirements structure consisting of:
- System Requirements (SYS)
- Software Requirements (SWE)
- Verification Requirements (VER)

ADR-012 extended the hierarchy by introducing:
- Test Specifications (TST)

The resulting traceability chain is:
```text
SYS -> SWE -> VER -> TST
```
This structure ensures that requirements are linked to verification activities and test specifications.

However, a gap remains between documented test specifications and the actual implemented tests within the source code.

Without explicit traceability to test implementations:
- Test specifications may become disconnected from executable tests.
- It becomes difficult to determine whether a test specification is implemented.
- Automated traceability analysis is limited.
- Maintenance effort increases as project grow.

Traceability information provides limited value if its consistency is not verified automatically.

Manual reviews do not scale as projects grow and may fail to detect missing or broken traceability relationships.

An automated verification mechanism is therefore required to ensure that traceability remains complete and consistent.

## Decision Drivers

- Maintain complete traceability from requirements to test execution.
- Support automated traceability analysis.
- Improve maintainability of the test infrastructure.
- Enable future generation of traceability reports.
- Align with professional engineering practices.
- Provide a foundation for future safety- and security-oriented development processes.
- Enable automated verification of traceability links.
- Detect missing traceability information early.
- Support CI-based quality gates.

## Considered Options
### Option A: Traceability Only in Test Specifications
Store references to test implementations only within TST documents.

#### Advantages
- Simple approach.
- Minimal maintenance effort.

#### Disadvantages
- Traceability exists in only one direction.
- Difficult to verify implementation coverage automatically.
- Test code contains no requirement references.

### Option B: Traceability Only in Test Source Code
Store requirement references only within unit test source files.

#### Advantages
- Traceability is located close to the implementation.
- Supports automated code analysis.

#### Disadvantages
- Test specifications remain disconnected from implementations.
- Difficult to navigate from requirements documentation to source code.

### Option C: Bidirectional Traceability
Store implementation references within TST documents and requirement references within test source files.

#### Advantages
- Complete bidirectional traceability.
- Supports future automated traceability reporting.
- Simplifies impact analysis.
- Enables navigation from requirements to code and from code to requirements.
- Aligns with professional engineering practices.

#### Disadvantages
- Additional maintenance effort.
- Developers must keep references consistent.

## Decision Outcome
Chosen option: **Option C**

Test specifications shall reference the corresponding test implementation artifacts.

Unit test source files shall reference the requirements, verification requirements, and test specifications they implement.

Traceability annotations shall be applied at individual test-case level.

Required annotations:
´´´text
@req
@ver
@tst
´´´
File-level traceability annotations shall not be used as the primary traceability mechanism.

Traceability annotations shall be validated automatically during CI execution.

Missing or invalid traceability information shall be treated as a CI quality gate failure.

The resulting traceability chain shall be:
´´´TEXT
SYS -> SWE -> VER -> TST -> Test Implementation -> Test Execution
´´´

## Consequences
### Positive
- End-to-end traceability is established.
- Easier impact analysis.
- Improved maintainability.
- Foundation for automated traceability reporting.
- Better alignment with professional engineering practices.
- Enables automated traceability verification.
- Supports future traceability reporting.
- Detects broken traceability links early.

### Negative
- Additional maintenance effort.
- Traceability information must be updated when artifacts are renamed or restructured.
- Developers must keep references synchronized with the implementation.
