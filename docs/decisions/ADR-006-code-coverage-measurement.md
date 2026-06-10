# ADR-006: Use Mandatory Unit Test Coverage Measurement
## Status
Accepted

## Context
The project template is intended to support professional embedded software development practices including:
- Requirements Management
- Automated Testing
- Continuous Integration
- Safety-oriented Development Practices
- Security-oriented Development Practices

Automated tests alone provide limited information about which parts of the software are actually exercised during execution.

Code coverage measurement helps identify:
- Untested source files
- Untested functions
- Untested branches
- Gaps between implementation and verification

Coverage data is commonly used as an additional verification metric in professional embedded development enviroments, particularly when demonstrating verification completeness. Coverage helps identify untested code paths, while tools such as *gcovr* can generate text, HTML, XML and other report formats suitable for local analysis and CI pipelines.

The project therefore requires a standardized approach for collecting and reporting coverage information.

## Decision
The primary coverage reporting tool shall be *gcovr*.

The following report formats shall be supported:
- Console Summary
- HTML Report
- Detailed HTML Report

*gcovr* is selected because it integrates well with GCC/gcov-based workflows and supports machine-readable as well as human-readable reporting formats.

### Coverage Instrumentation
Coverage shall be enabled through dedicated build configuration options.

Coverage instrumentation shall only be enabled when explicitly requested.

Production firmware builds shall not include coverage instrumentation.

### CI/CD Integration
Coverage generation shall be integrated into the cI/CD pipeline.

Coverage reports shall be generated automatically during coverage-enabled test executions.

### Future Extensions
The architecture shall allow future integration of:
- Coverage thresholds
- Coverage trend monitoring
- Coverage reporting services
- Branch coverage metrics 
- Safety-oriented verification metrics

## Consequences
### Positives
- Improved verification quality
- Detection of untested code paths
- Better visibility of test effectiveness
- Supports CI/CD quality gates
- Supports future safety-oriented workflows
- Supports future security-oriented workflows
- Encourages systematic test development

### Negative
- Increased build time for coverage-enabled builds
- Additional build configuration complexity
- Coverage percentages may be misinterpreted if used without engineering judgement
- High coverage does not guarantee correctness

## Explicitly Rejected Alternatives
### No Coverage Measurement
Reject coverage measurement entirely.

#### Reason
Lack of visibility into verification completeness and reduced ability to identify untested code.

### Coverage as an Optional Project Feature
Coverage support exists but is not considered part of the standard workflow.

#### Reason
Coverage should be a first-class verification capability of the template rather than an afterthought.

### Coverage in Production Builds
Enable coverage instrumentation in normal firmware builds.

#### Reason
Coverage instrumentation increases binary size and execution overhead and is not appropriate for production firmware.

## Related Documents
- README.md
- CONTRIBUTIN.md
- ADR-004: Use a Multi-Level Testing Strategy
- ADR-005: Use Modern Modular CMake Architecture
- tests/
- cmake/