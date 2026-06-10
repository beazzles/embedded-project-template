# Contributing Guidlines
## Purpose
This repository follows a professional embedded software development workflow.

The goals are:
- Maintainability
- Traceability
- Testability
- Documentation quality
- Automated verification

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

Use the appropriate category:

* Added
* Changed
* Deprecated
* Removed
* Fixed
* Security

Guidelines:

* Focus on user-visible or contributor-relevant changes.
* Keep entries concise and human-readable.
* Do not duplicate commit messages.
* Do not document every internal refactoring unless it affects contributors or users.
* Update the changelog before creating a commit.
* Changelog entries shall describe completed changes only.
* Planned features, roadmap items, and future work shall not be added to the changelog until implementation has been completed.

Typical workflow:

1. Implement the change.
2. Update documentation if required.
3. Update `CHANGELOG.md`.
4. Create the commit.
5. Open a pull request.


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

## Code Quality
Contributers should ensure:
- Code formatting passes
- Static analysis passes
- Unit tests pass
- Documentation is updated when necessary

## Requirements Traceability
Changes affecting functionality should be traceable to documented requirements.

Where practical:

Requirements -> Implementation -> Test

shall be maintained.

## Testing
The following verification levels are supported:
- Unit Tests
- Integration Tests
- System Tests

New functionality should be accompanied by appropriate tests.

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
- Build success
- Static analysis
- Test execution
- Coverage generation
- Documentation generation

## Changelog Management
This repository maintains a CHANGELOG.md file.

The changelog follows the principles of *Keep a Changelog*.

### Categories
Use the following categories where applicable:
- Added
- Changed
- Deprecated
- Removed
- Fixed
- Security

### Unreleased Section
New changes should first be added to the *Unreleased* section.

### Release Process
When creating a release:
1. Move entries from *Unreleased* to the new version section.
2. Add the release date.
3. Create a new empty *Unreleased* section

## Semantic Versioning
This project follows *Semantic Versioning*.

### Examples
#### Bugfix
1.0.0 -> 1.0.1

#### New feature
1.0.0 -> 1.1.0

#### Breaking Change
1.0.0 -> 2.0.0

## Requirements Structure
The project uses a three-level requirements hierarchy:
- SYS (System Requirements)
- SWE (Software Requirements)
- VER (Verification Requirements)

Where practical, requirements should maintain traceability:

SYS -> SWE -> VER

Requirement IDs:
- SYSxxx (System Requirements)
- SWExxx (Software Requirements)
- VERxxx (Verification Requirements)

## Testing

New functionality should be accompanied by:

- Requirements (where applicable)
- Unit Tests
- Coverage updates

Integration and system tests should be added when the feature spans multiple modules or system boundaries.

## Coverage Expectations
New functionality should be accompanied by appropriate unit tests.

Developers are encouraged to review coverage reports whenn adding or modifying functionality.

Coverage metrics are intended to support verification activities and should not be used as the sole indicator of software quality.

## Code Quality Expectations

Contributors should ensure that:

- Source files follow the project formatting rules.
- New code passes cppcheck analysis.
- New code passes clang-tidy analysis.
- New functionality is accompanied by appropriate unit tests.
- Coverage reports are reviewed when modifying existing functionality.

Static analysis findings should be reviewed and resolved whenever practical.