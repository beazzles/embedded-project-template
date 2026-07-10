# Embedded Project Template
## Purpose
This repository provides a language-agnostic template for professional embedded software projects.

This template focuses on:
- Requirements management
- Traceability
- Testing
- Coverage
- Documentation
- CI/CD
- Code quality

The template intentionally does not contain source code and does not enforce a specific programming language.

Supported project types include:
- STM32 firmware projects
- Embedded Linux projects
- Raspberry Pi projects
- Security-related projects
- Edge AI projects

## Project Structure
| Directory | Purpose |
|-----------|---------|
| app/ | Application logic and use cases |
| modules/ | Reusable functional modules |
| platform/ | Platform-specific implementation and hardware integration |
| tests/ | Unit, integration and system tests |
| requirements/ | Requirements and traceability |
| docs/ | Architecture, ADRs, Doxygen and images |
| scripts/ | Automation scripts |
| tools/ | Project-specific helper tools |
| .github/workflows/ | CI/CD pipelines |

## Directory Details
### app/
Contains the application-specific logic and use cases.

Typical contents:
- Main application flow
- State machines
- Application services
- System orchestration

This directory should contain as little hardware-specific code as possible.

### modules/
Contains reusable functional modules.

Examples:
- Communication stacks
- Sensor management
- Diagnostics
- Control algorithms
- Security services

Modules should be designed to be as platform-independent as practical and should be accompanied by unit tests.

### platform/
Contains platform-specific implementations and hardware integration.

Examples:
- STM32 integration
- Raspberry Pi integration
- Board Support Packages (BSP)
- Hardware abstraction layers (HAL)

For STM32 projects, generated STM32CubeMX code should be isolated in this area to clearly separate generated code from application code.

### tests/
Contains verification activities.

Structure:
- unit/ - Unit tests
- integration/ - Integration tests
- system/ - System tests
- test-data/ - Test resources and reference data

The project follows a verification-oriented approach where tests are traceable to requirements.

### requirements/
Contains project requirements managed with Doorstop.

Structure:
- system/ - System requirements
- software/ - Software requirements
- verification/ - Verification requirements

Requirements should support bidirectional traceability between requirements, implementation and tests.

### docs/
Contains project documentation.

Structure:
- architecture/ - Architecture descriptions and diagrams
- decisions/ - Architecture Decision Records (ADR)
- doxygen/ - Generated API documentation
- images/ - Documentation graphics and diagrams

Documentation is considered part of the project deliverables.

### scripts/
Contains automation scrips.

Examples:
- Build automation
- Test execution
- Coverage generation
- Documentation generation

CI/CD pipelines should prefer using these scripts rather than duplicating logic.

### tools/
Contains project-specific tools and helper utilities.

Examples:
- Code generation helpers
- Developement utilities
- Project maintenance tools

This directory should not contain third-party tools that can be installed through package managers.

### .github/workflows/
Contains GitHub Actions workflows.

Typical responsibilities:
- Build verification
- Static analysis
- Test execution
- Coverage reporting
- Documentation checks

The CI/CD pipeline should provide automated quality gates for the project.

## Requirements Strategy
Requirements should be organized hierarchically:
- System Requirements
- Software Requirements
- Verification Requirements

Traceability should be maintained from requirement to implementation and test.

## Testing Strategy
The project supports:
- Unit Tests
- Integration Tests
- System Tests

Coverage measurement is considered mandatory.

## Documentation Strategy
Documentation consists of:
- Architecture documentation
- Architecture Decision Records (ADR)
- Doxygen API documentation

## CI/CD Strategy
The repository is designed for *GitHub Actions* based automation.

Typical pipline stages:
1. Build
2. Static Analysis
3. Unit Tests
4. Coverage
5. Documentation Generation

## Commit Conventions
This repository follows the *Conventional Commits* specification.

See CONTRIBUTING.md for details.

## Requirements Management
This project uses a three-level requirements hierarchy:
- SYS (System Requirements)
- SWE (Software Requirements)
- VER (Verification Requirements)

Requirements should maintain traceability:

SYS -> SWE -> VER

Requirement IDs:
- SYSxxx (System Requirements)
- SWExxx (Software Requirements)
- VERxxx (Verification Requirements)

Doorstop is the recommended requirements management tool.

### Doorstop Usage
Recommended export formats:
- Mardown
- HTML

Requirements are stored in the repository and remain accessible without Doorstop.

## Testing Strategy

The project uses a multi-level testing strategy:

- Unit Tests
- Integration Tests
- System Tests

Directory layout:

```text
tests/
├── unit/
├── integration/
└── system/
```

Coverage measurement is mandatory for unit tests.

## Build Architecture
The project uses a Modern CMake architecture based on the following principles:
- Hierarchical Project-Structure
- Target-Based Architecture
- Layered Software Architecture
- Interface Libraries

### Project Structure
```text
CMakeLists.txt
cmake/
modules/
tests/
```

### Design Goals
- Scalability
- Maintainability
- Testability
- Reusability
- CI/CD Integration

### Module Ownership
Each software module is responsible for:
- Its own source files
- Its own public headers
- Its own build configuration

### Shared Build Configuration
Project-wide compiler settings, language standards and warning policies are implemented through dedicated CMake Interface Libraries.

### Testing Integration
The build architecture is designed to support:
- Unit Tests
- Integration Tests
- System Tests
- Coverage Analysis
- Continuous Integration

### Future Compatibility
The architecture is intended to support:
- STM32-based projects
- Embedded Linux projects
- Security-oriented projects
- Edge AI projects
- Distributed embedded systems

## Coverage

The Engineering Platform supports host-based code coverage measurement for unit tests.

Coverage measurement is implemented using GCC coverage instrumentation and `gcovr`.

Coverage instrumentation is disabled by default and must be enabled explicitly.

### Configure Coverage Build

```bash
cmake -S . -B build -DENABLE_COVERAGE=ON
```

### Build

```bash
cmake --build build
```

### Run Tests

```bash
ctest --test-dir build --output-on-failure
```

### Generate Coverage Reports

```bash
./scripts/ci/coverage.sh
```

The coverage script generates the following reports:

```text
reports/
└── coverage/
    ├── index.html
    └── coverage.xml
```

- `index.html` provides a human-readable coverage report.
- `coverage.xml` provides a machine-readable report for Continuous Integration systems and future quality gates.

Coverage support is intended for verification activities and shall not be enabled for production firmware builds.

See ADR-006 for the coverage architecture and ADR-017 for the coverage reporting strategy.

## Code Formatting
The project uses *clang-format* for automated source code formatting.

### Format a single file
```bash
clang-format -i path/to/file.c
```

### Format all project files
```bash
find . ( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp") -exec clang-format -i {};
```

The formatting configuration is stored in *.clang-format*.

## Code Quality

The template supports automated formatting and static analysis.

### clang-format

Format a single file:

```bash
clang-format -i path/to/file.c
```

Format all source files:

```bash
find . ( -name "*.c" -o -name "*.h" -o -name "*.cpp" -o -name "*.hpp" ) -exec clang-format -i {} ;
```

The formatting configuration is stored in:

```text
.clang-format
```

### cppcheck

Configure a build with cppcheck enabled:

```bash
cmake -S . -B build -DENABLE_CPPCHECK=ON
```

Build the project:

```bash
cmake --build build
```

### clang-tidy

Configure a build with clang-tidy enabled:

```bash
cmake -S . -B build -DENABLE_CLANG_TIDY=ON
```

Build the project:

```bash
cmake --build build
```

clang-tidy uses the generated compile_commands.json database for project-aware analysis. :contentReference[oaicite:0]{index=0}

The project configuration is stored in:

```text
.clang-tidy
```

### Combined Analysis

```bash
cmake -S . -B build -DENABLE_CPPCHECK=ON -DENABLE_CLANG_TIDY=ON

cmake --build build
```

See ADR-007 for rationale and architectural decisions.

## Continuous Quality Assurance

Project quality is checked both locally and within the GitHub Actions CI pipeline.

Tools used:
- clang-format
- clang-tidy
- cppcheck
- CppUTest
- gcov / gcovr

The goal is the early detection of:
- Formatting errors
- Static analysis errors
- Test errors
- Insufficient test coverage

Local execution remains possible and is recommended. However, the CI pipeline is the primary reference for quality assessment.

### Format Checking

Compliance with formatting guidelines is automatically checked by GitHub Actions.

The `format.yml` workflow runs clang-format in check mode and fails if the source code does not conform to the specifications in the `.clang-format` file.

Local formatting:

```bash
clang-format -i <file>
```