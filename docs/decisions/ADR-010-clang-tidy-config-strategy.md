# ADR-010: Clang-Tidy Configuration Strategy
## Status
Accepted

## Context
The project uses automated static analysis as part of the quality assurance process.

Cppcheck is already used to provide broad static analysis for both C and C++ code. However, Cppcheck focuses primarily on the same level of semantic analysis, code quality guidance, and coding guidline enforcement as Clang-Tidy.

Clang-Tidy proviedes access to:
- Clang Static Analyzer checks
- Bug-prone code detection 
- Performance-related recommendations
- Readability improvements
- C++ Core Guidelines enforcement

The project aims to maintain a high-quality embedded software development workflow while avoiding excessive noise from generated code, third-party libraries, and framework internals.

The project also intends to follow MISRA-compatible design principles where practical, without enforcing full MISRA compliance at this stage.

## Decision
The project shall use Clang-Tidy as an automated static analysis tool.

The initial Clang-Tidy configuration shall enable the following check groups:
- clang-analyzer-*
- bugprone-*
- performance-*
- readability-*
- cppcoreguidlines-*

The following checks shall initially be treated as build-breaking quality gates:
- clang-analyzer-*
- bugprone-*
- performance-*

cppcoreguidelines and readability findings shall initially be reported as warnings only.

This allows the project to evaluate the practical usefulness of individual guideline checks before promoting them to mandatory quality gates.

Generated code and third-party code shall be excluded from analysis wherever practical.

Examples include:
- STM32CubeMX generated code
- Vendor HAL libraries
- RTOS source code
- External middleware
- Other third-pary dependencies

Clang-Tidy findings originating from test framework internals shall not be used as justification to weaken the overall project configuration.

Instead, individual framework-related findings may be selectively suppressed when justified.

The project shall maintain a single Clang-Tidy configuration file in the repository root.

## Consequences
### Positive
- Stronger static analysis coverage
- Early detection of defects
- Better adherenceto modern coding practices
- Improved maintainability
- Alignement with professional embedded software development workflows
- Foundation for future MISRA-oriented development

### Negative
- Additional CI execution time
- Occasional false positives
- Ongoing maintenance of the Clang-Tidy configuration
- Periodic review required when upgrading Clang versions

## Future Considerations
Future revisions may:
- Promote selected CppCoreGuidelines checks to build-breaking errors
- Introduce naming convention enforcement
- Add project-specific rule customisation
- Integrate additional safety-oriented rule sets
- Refine exclusions for generated and third-party code

The project shall prefer gradual tightening of analysis rules over enabling all available checks as mandatory requirements from the beginning.