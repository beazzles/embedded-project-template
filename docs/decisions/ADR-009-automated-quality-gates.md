# ADR-009: Use Automated Quality Gates in CI/CD
## Status
Accepted

## Context
The project already uses various tools to ensure code quality:
- clang-format for formatting
- clang-tidy for static analysis
- cppcheck for static analysis
- gcov/gcovr for code coverage measurement
- CppUTest for unit tests
- GitHub Actions for continuous integration

Currently, these tools are run locally by the developer. This leads to several problems:
- Execution may be forgotten.
- Results may vary between developers.
- Quality requirements are not enforced centrally.
- The build pipeline currently only guarantees successful compilation and test execution.

For a professional embedded software project, quality requirements should be verified in a reproducible and automated manner.

## Decision
Quality checks are being gradually integrated into the GitHub Actions CI pipeline.

The CI pipeline is becoming the central mechanism for enforcing quality requirements.

The following checks are to be automated:
1. Code formatting using clang-format
2. Static analysis using cppcheck
3. Static analysis using clang-tidy
4. Code coverage generation using gcov/gcovr
5. Future introduction of coverage thresholds (quality gates)
6. Future introduction of conventional commit validation

Local execution of the tools remains possible and is recommended, but does not replace the centralized checks performed by the CI pipeline.

Quality checks are implemented as standalone pipeline steps or jobs to keep the pipeline modular and extensible.

## Consequences
### Positive
- Quality requirements are enforced centrally.
- All developers are evaluated according to the same standards.
- Bugs are detected early.
- The pipeline serves as objective proof of quality.
- Project quality is ensured regardless of individual development environments.
- The architecture is scalable for future quality gates.

### Negative
- Longer pipeline runtimes.
- Additional maintenance effort for CI configuration.
- Developers must adhere to stricter quality standards.

### Neutral
- Local tests will remain available.
- Quality tools must be maintained both locally and in the CI environment.

## Alternatives Considered
### Local checks only

#### Advantages
- Simpler CI configuration
- Faster pipeline

#### Disadvantages
- No centralized enforcement
- Bugs can slip into the repository unnoticed

Not selected.

### Full quality checks only after project completion

#### Advantages
- Lower initial effort

#### Disadvantages
- Quality issues are detected late
- Subsequent cleanup causes additional effort

Not selected.

### Quality checks exclusively in pull requests

#### Advantages
- Fewer pipeline runs

#### Disadvantages
- Bugs are detected later
- Poorer feedback for developers

Not selected.