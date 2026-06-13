# ADR-008: Use Modular GitHub Actions CI/CD Workflows

## Status

Accepted

## Context

The project template aims to provide a professional embedded software development workflow with automated verification, quality assurance, and continuous integration capabilities.

The repository already supports:

* Modern CMake-based builds
* Unit testing using CppUTest and CTest
* Coverage measurement using gcov and gcovr
* Static analysis using cppcheck and clang-tidy
* Automated code formatting using clang-format

To ensure consistent execution of these quality activities across all contributors and environments, an automated CI/CD solution is required.

GitHub Actions is selected as the CI/CD platform because it integrates directly with GitHub repositories, supports Linux-based build environments, and can execute all required quality assurance activities.

As the project evolves, the CI/CD infrastructure is expected to grow in complexity. Therefore maintainability and scalability must be considered from the beginning.

## Decision

The project shall use GitHub Actions as its CI/CD platform.

GitHub Actions workflows shall be organized as multiple specialized workflows rather than a single monolithic workflow.

The workflow structure shall follow the principle of separation of concerns.

The initial workflow architecture shall consist of:

```text
.github/
└── workflows/
    ├── build.yml
    ├── test.yml
    ├── quality.yml
    ├── coverage.yml
    └── commitlint.yml
```

### Workflow Responsibilities

#### build.yml

Responsible for:

* CMake configuration
* Project build verification
* Build environment validation

#### test.yml

Responsible for:

* Unit test execution
* CTest execution
* Test result reporting

#### quality.yml

Responsible for:

* cppcheck execution
* clang-tidy execution
* Formatting validation

#### coverage.yml

Responsible for:

* Coverage-enabled build
* Coverage report generation
* Coverage artifact publication

#### commitlint.yml

Responsible for:

* Conventional Commit validation
* Rejection of non-compliant commit messages

### Commit Message Validation

The repository shall enforce Conventional Commits.

Commit validation shall be performed automatically by CI.

Non-compliant commit messages shall cause CI failure.

### Future Extensions

The architecture shall support future integration of:

* Release automation
* Documentation generation
* Requirements traceability validation
* Security scanning
* Artifact publication
* Multi-target build pipelines
* Embedded target-specific validation workflows

## Consequences

### Positive

* Automated verification of repository integrity
* Consistent execution of quality checks
* Reduced manual validation effort
* Improved contributor experience
* Better scalability of CI/CD infrastructure
* Easier maintenance of workflow definitions
* Clear separation of responsibilities
* Supports professional development practices

### Negative

* Increased repository complexity
* More workflow files must be maintained
* Longer CI execution times as additional workflows are introduced
* Additional GitHub Actions knowledge required for contributors

## Explicitly Rejected Alternatives

### Single Monolithic Workflow

Use a single workflow file containing all build, test, coverage, and quality activities.

Reason:

As the repository grows, a monolithic workflow becomes harder to maintain, debug, and extend.

### Manual Verification Only

Require contributors to execute all quality checks locally.

Reason:

Results become dependent on individual developer discipline and environment consistency cannot be guaranteed.

## Related Documents

* README.md
* CONTRIBUTING.md
* ADR-004: Use a Multi-Level Testing Strategy
* ADR-005: Use Modern Modular CMake Architecture
* ADR-006: Use Mandatory Unit Test Coverage Measurement
* ADR-007: Use Automated Static Analysis and Formatting
