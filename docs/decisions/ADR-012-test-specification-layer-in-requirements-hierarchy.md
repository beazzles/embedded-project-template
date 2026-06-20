# ADR-012: Test Specification Layer in Requirements Hierarchy
## Status
Accepted

## Context
The project currently uses Doorstop for requirements management and traceability.

ADR-003 established a hierarchical requirements structure consisting of:
- System Requirements (SYS)
- Software Requirements (SWE)
- Verification Requirements (VER)

ADR-011 introduced automated validation of requirements traceability, including strict child relationship checks.

During the evolution of the project it became clear that VER requirements are not sufficient to fully describe the verification process in a scalable and professional way.

In particular, VER items currently mix two concerns:
- What must be verified (verification intent)
- How the verification is performed (test definition)

This coupling limits scalability for future project growth, especially in the context of:
- multiple verification methods (unit, integration, sytem, HIL)
- CI-based automated testing
- coverage-driven verification (including MC/DC later)
- separation of specification and execution artifacts

To improve scalability and align with professional systems engineering practices, an additional hierarchy level is required.

## Decision Drivers
- Clear separation of verification intent and test implementation
- Scalability for multiple test levels (unit, integration, system, HIL)
- Support for automated CI-based testing
- Improved traceability granularity
- Alignement with professional embedded and safety-critical workflows
- Enable future coverage and MC/DC integration
- Maintain consistency within Doorstop-based requirements system

## Considered Options
### Option A: No additional hierarchy (SYS -> SWE -> VER only)
Keep current structutre and reference test code directly from VER items.

#### Advantages
- Minimal complexity
- Fewer documents
- Faster to implement

#### Disadvantages
- VER items mix intent and implementation
- Limited scalability for multiple test levels
- Reduced clarity for CI/CD integration
- Harder to extend for safety-critical workflows

### Option B: Introduce Test layer (SYS -> SWE -> VER -> TST)
Add a dedicated Test Specification (TST) layer between VER and actual test code.

#### Advantages
- Clear separation of verification intent and test specification
- Scales to multiple test types and levels
- Enables structered CI integration
- Aligns with professional systems engineering practices
- Supports future MC/DC and coverage integration
- Keeps VER clean and abstract

#### Disadvantages
- Additional documentation overhead
- More initial structure to maintain
- Slightly increased onboarding complexity

## Decision Outcome
Chosen option: **Option B**

The project shall introduce a dedicated Test Specification layer (TST) into the requirements hierarchy:
```text
SYS -> SWE -> VER -> TST
```

TST items define test specifications and verification procedures and are responsible for describing how verification os performed.

TST items shall reference concrete test implementation (e.g. unit test code, integration test code or CI test definitions).

VER items shall remain focused on defining what must be verified and shall not directly reference test code.

## Consequences
### Positive
- Clear separation between verification intent and test implementation
- Improved scalability for complex verification strategies
- Better alignment with professional embedded development practices
- Foundation for CI/CD-based verification automation
- Enables structured expansion toward MC/DC and coverage requirements
- Improved traceability granularity across the verification chain

### Negative
- Increased number of requirement artifacts
- Slightly higher maintenance effort for small changes
- Requires discipline in linking VER -> TST -> Test Code
- Additional onboarding complexity for new contributors