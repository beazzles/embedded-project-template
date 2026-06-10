# ADR-007: Use Automated Static Analysis and Formatting
## Status
Accepted

## Context
The project template aims to support professional embedded software development practices with a strong  focus on maintainability, code quality, verification, and long-term sustainability.

Automated testing and coverage measurement help verify software behavior but do not detect all classes of implementation issues.

Static analysis and automated formatting provide additional quality assurance by:
- Detecting potential defects before execution
- Enforcing coding standards
- Improving code readability and consistency
- Supporting maintainability
- Reducing review effort
- Supporting safety- and security-oriented development workflows

To establish a consistent quality process, the project requires standardized tooling for formatting and static analysis.

## Decision
The project shall use automated formatting and static analysis tools as part of the standard development workflow.

### Formatting Tool
The primary code formatting tool shall be *clang-format*.

A single project-wide formatting configuration shall be maintained.

Formatting shall be applied consistently across all C and C++ source files.

### Static Analysis Tools
The project shall use *cppcheck* and *clang-tidy*.

*cppcheck* shall provide lightweight static analysis independent of compiler-specific diagnostics.

*clang-tidy* shall provide deeper compiler-assisted analysis based on project build information.

### Workflow Integration
All tools shall be executable locally.

All tools shall be integrated into the CI/CD pipeline.

Static analysis results shall be treated as development quality indicators and used to identify potential defects early in the development lifecycle.

### Future Extensions
The architecture shall allow future integration of:
- MISRA compliance checks
- Custom clang-tidy rule sets
- Security-focused analysis profiles
- Automated formatting verification in CI
- Quality gates based on analysis results

## Consequences
### Positive
- Consistent code formatting
- Improved readability
- Early defect detection
- Reduced review effort
- Improved maintainability
- Supports professional development workflows
- Supports future safety-oriented processes
- Supports future security-oriented processes

### Negative
- Increased build and analysis time
- Additional tooling complexity
- Potential false-positive findings
- Developers must understand analysis results and apply engineering judgement

## Explicitly Rejected Alternatives
### Manual Formatting Only
Rely solely on developer discipline for code formatting.

#### Reason
Inconsistent results and unnecessary review effort.

### Single Static Analysis Tool
Use only one static analysis tool.

#### Reason
Different tools identify different classes of issues and complement each other.

### IDE-Specific Analysis
Depend on analysis capabilities provided exclusively by a specific IDE.

#### Reason
Reduces portability and tool independence.

## Related Documents
- README.md
- CONTRIBUTING.md
- ADR-004: Use a Multi-Level Testing Strategy
- ADR-005: Use Modern Modular CMake Architecture
- ADR-006: Use Mandatory Unit Test Coverage Measurement