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