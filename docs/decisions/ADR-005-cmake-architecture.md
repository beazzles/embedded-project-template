# ADR-005: Use Modern Modular CMake Architecture
## Status
Accepted

## Context
The project template is intended to support professional embedded software development workflows including:
- Requirements Management
- Automated Testing
- Code Coverage Analysis
- CI/CD Pipelines
- Safety-oriented Development Practices
- Security-oriented Development Practices
- Future Embedded Linux Projects
- Future Distributed Embedded Systems

As the project grows, build system maintainability becomes increasingly important. A monolithic build configuration does not scale well and makes dependency management, testing and reuse more difficult.

A scalable and maintainable build architecture is therefore required.

## Decision
The project shall use a Modern CMake architecture based on the following principles:
- Hierarchical Project Structure
- Target-Based Architecture
- Layered Software Architecture
- Interface Libraries for shared build configuration

The project shall avoid monolithic CMake configurations.

### Hierarchical Project Structure
The root CMakeLists.txt shall primarily orchestrate the build by including subdirectories.

Individual modules shall manage their own build definitions.

### Target-Based Architecture
Each software module shall be represented by an explicit CMake target.

Dependencies, include directories and compile options shall be associated with the target that requires them.

Global project setting shall be minimized.

### Layered Architecture
The software architecture shall support logical layers such as:
- Application
- Services
- Drivers
- Platform

Dependencies shall flow only from higher layers to lower layers.

### Interface Libraries
Shared compiler settings, language standards and project-wide configuration shall be implemented using CMake Interface Libraries.

Examples include:
- project_options
- project_warnings

## Consequences
### Positive
- Improved scalability
- Better maintainability
- Clear dependency management
- Improved testability
- Better CI/CD integration
- Supports reusable modules
- Compatible with future STM32 and Embedded Linux projects
- Supports future safety-oriented and security-oriented workflows

### Negative
- More initial setup effort
- Additional CMake files must be maintained
- Higher learning curve compared to monolithic projects

## Explicitly Rejected Alternatives
### Monolithic CMake Project
A single large CMakeLists.txt managing all sources, include paths and compiler options was rejected due to poor scalability and maintainability.

## Related Documents
- README.md
- CONTRIBUTING.md
- ADR-004: Use a Multi-Level Testing Strategy
- modules/
- tests/
- cmake/