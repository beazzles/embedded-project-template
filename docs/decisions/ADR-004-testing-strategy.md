# ADR-004: Use a Multi-Level Testing Strategy

## Status

Accepted

## Context

The project template aims to support professional embedded software development practices, including:

* Requirements traceability
* Automated testing
* Code coverage measurement
* Continuous Integration and Continuous Delivery (CI/CD)
* Future safety-oriented development workflows
* Future security-oriented development workflows

Embedded systems often require different levels of testing. Limiting testing to unit tests alone does not sufficiently verify interactions between software modules or the behavior of the complete system.

A scalable testing strategy is required that supports both small hobby projects and larger professional projects.

## Decision

The project shall use a multi-level testing strategy consisting of:

* Unit Tests
* Integration Tests
* System Tests

The repository shall contain the following test structure:

```text
tests/
├── unit/
├── integration/
└── system/
```

Unit tests shall verify individual software modules in isolation.

Integration tests shall verify interactions between multiple software modules.

System tests shall verify complete system behavior, including interactions with target hardware and external systems where applicable.

Code coverage measurement shall be mandatory for unit tests.

Code coverage measurement for integration and system tests is recommended where practical.

## Consequences

### Positive

* Supports professional software development workflows
* Encourages early defect detection
* Improves software quality
* Enables automated quality gates in CI/CD pipelines
* Scales from small projects to larger embedded systems
* Provides a foundation for future safety-oriented and security-oriented projects
* Supports future distributed embedded systems and Embedded Linux projects

### Negative

* Additional implementation effort
* Increased maintenance effort for test code
* Longer build and test execution times
* Contributors must understand different testing levels and their purpose

## Related Documents

* README.md
* CONTRIBUTING.md
* ADR-003: Use a Three-Level Requirements Hierarchy
* tests/
