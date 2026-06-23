# Contributing Guidlines
## Purpose
This repository follows a professional embedded software development workflow.

The goals are:
- Maintainability
- Traceability
- Testability
- Documentation quality
- Automated verification

Documentation, requirements, tests and source code are considered first-class project artifacts.

## Commit Convention
This repository follows the *Conventional Commits* specification.

### Format
\<type\>(\<scope\>): \<description\>

### Common types
| Type | Description |
|------|-------------|
| feat | new software feature |
| fix | bug fix |
| docs | README, ADRs, architecture |
| test | unit / integration |
| build | CMake, toolchain, compiler |
| ci | GitHub Actions |
| refactor | code restructuring |
| chore | repository maintenance, configuration |

### Examples
feat(sensor): add temperature conversion  
fix(build): resolve linker configuration  
docs(readme): update project structure documentation
test(comm): add uart module tests  
ci(github): add build workflow  
chore(template): update repository configuration

## Changelog Maintenance

All notable changes shall be recorded in `CHANGELOG.md`.

Changes are added to the `[Unreleased]` section until the next release.

The changelog follows the principles of *Keep a Changelog*.

### Categories
* Added
* Changed
* Deprecated
* Removed
* Fixed
* Security

### Guidelines
* Focus on user-visible or contributor-relevant changes.
* Keep entries concise and human-readable.
* Do not duplicate commit messages.
* Do not document every internal refactoring unless it affects contributors or users.
* Update the changelog before creating a commit.
* Changelog entries shall describe completed changes only.
* Planned features, roadmap items, and future work shall not be added to the changelog until implementation has been completed.

### Typical workflow
1. Implement the change.
2. Update documentation if required.
3. Update `CHANGELOG.md`.
4. Create the commit.
5. Open a pull request.

### Release Process
When creating a release:
1. Move entries from `Unreleased` to the new version section.
2. Add the release date.
3. Create a new empty `Unreleased` section.

## Branching Strategy
The master branch shall remain in a buildable state.

### Recommended workflow
1. Create a feature branch.
2. Implement the change.
3. Run local verification.
4. Create a pull request.
5. Merge after review.

### Example
feature/add-temperature-sensor

## Requirements Structure
The project uses a three-level requirements hierarchy:
- SYS (System Requirements)
- SWE (Software Requirements)
- VER (Verification Requirements)
- TST (Test Specifications)

The following traceability chain shall be maintained:
```text
SYS -> SWE -> VER -> TST
```
Requirement IDs:
- SYSxxx
- SWExxx
- VERxxx
- TSTxxx

## Requirements Traceability
Changes affecting functionality should be traceable to documented requirements.

Where practical:
```text
Requirements -> Implementation -> Test
```
shall be maintained.

## Test Traceability
All test implementations shall maintain bidirectional traceability to the corresponding artifacts.

The following traceability chain shall be maintained:
```text
SYS -> SWE -> VER -> TST -> Test Implementation
```
Each unit test shall contain traceability annotations at individual test-case level.

Required annotations:
- *@req*
- *@ver*
- *@tst*

### Example
```code
/**
@req SWE001
@ver VER001
@tst TET001
*/
TEST(StatusLed, InitSetsLedOff)
{
    ...
}
```
File-level traceability annotations shall not be used as the primary traceability mechanism.

Traceability annotations are automatically verified by CI.

## Testing
The following verification levels are supported:
- Unit Tests
- Integration Tests
- System Tests

New functionality should be accompanied by:
- Requirements updates where applicable
- Appropriate tests
- Verification updates where applicable

Integration and system tests should be added when functionality spans multiple modules or system boundaries.

## Coverage Expectations
New functionality should be accompanied by appropriate unit tests.

Developers are encouraged to review coverage reports whenn adding or modifying functionality.

Coverage metrics are intended to support verification activities and should not be used as the sole indicator of software quality.

## Code Quality
Contributers should ensure that:
- Source files follow project formatting rules.
- New code passes cppcheck analysis.
- New code passes clang-tidy analysis.
- New functionality is accompanied by appropriate unit tests.
- Coverage reports are reviewed when modifying existing functionality.
- Documentation is updated when necessary.

Static-analysis findings should be reviewed and resolved whenever practical.


## Code Formatting
All C and C++ source files shall comply with the rules defined in *.clang-format*.

Compliance is automatically verified by CI.

Before committing, modified files should be formatted locally using clang-format.

## Documentation
The following documentation shall be maintained:
- Requirements
- Architecture documentation
- Architecture Decision Records (ADR)
- API documentation

Documentation is considered part of the project deliverables.

## Continuous Integration
All contributions should be compatible with the CI/CD pipeline.

Future workflows may automatically verify:
- Commit message format
- Requirements validation
- Requirements traceability
- Build success
- Static analysis
- Test execution
- Coverage generation
- Documentation generation

Contributors should not intentionally break any CI quality gate.

## Semantic Versioning
This project follows *Semantic Versioning*.

### Bugfix
1.0.0 -> 1.0.1

### New feature
1.0.0 -> 1.1.0

### Breaking Change
1.0.0 -> 2.0.0

