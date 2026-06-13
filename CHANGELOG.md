# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog and this project adheres to Semantic Versioning.

## [Unreleased]
### Added
- Repository structure for embedded project template
- Apache 2.0 license
- CONTRIBUTING.md contributor guide
- CHANGELOG.md following Keep a Changelog format
- Architecture Decision Record (ADR) process
- ADR-001: Repository and Documentation Structure
- ADR-002: Changelog Management Strategy
- ADR-003: Requirements Management with Doorstop
- ADR-004: Multi-Level Testing Strategy
- ADR-005: Modern Modular CMake Architecture
- ADR-006: Mandatory Unit Test Coverage Measurement
- ADR-007: Automated Static Analysis and Formatting
- Doorstop-based requirements management
- SYS/SWE/VER requirements hierarchy
- Modern target-based CMake architecture
- Interface-library based project configuration
- Layered project structure
- Unit testing with CppUTest
- Test execution with CTest
- Coverage measurement using gcov and gcovr
- HTML coverage report generation
- clang-format configuration
- cppcheck integration
- clang-tidy integration
- compile_commands.json generation
- Development workflow documentation
- Code quality workflow documentation
- GitHub Actions workflow for automated clang-format verification

### Changed
- Refined repository documentation and development workflow
- Standardized ADR structure and formatting across the repository
- Renamed requirements directories to system, software and verification
- Improved README structure and setup instructions
- Expanded CONTRIBUTING.md with development process guidance

### Fixed
- Corrected CppUTest test runner configuration
- Corrected unit test executable generation
- Corrected coverage target integration in CMake
- Corrected CTest configuration for host-based testing
