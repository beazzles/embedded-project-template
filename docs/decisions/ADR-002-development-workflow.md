# ADR-002: Use Conventional Commits and Changelog-Based Release Tracking
## Status
Accepted

## Context
The project template is intended to support professional embedded software development practices.

As projects grow, it becomes increasingly important to:
- Maintain a clear and understandable commit history
- Support traceability of changes
- Simplify release management
- Improve collaboration
- Enable future CI/CD automation

A consistent approach for commit messages and release documentation is therefore required.

## Decision
The project shall use the *Conventional Commits" specification for commit messages.

Format:

\<type\>(\<scope\>): \<description\>

Common commit types include:
- feat
- fix
- docs
- test
- build
- ci
- refactor
- chore

The project shall maintain a CHANGELOG.md file following the principles of *Keep a Changelog*.

Changes shall first be documented in the *Unreleased* section and moved to versioned sections during the release process.

The project shall use *Semantic Versioning* where applicable.

Version format:

MAJOR.MINOR.PATCH

Future CI/CD workflows should automatically verify commit message compliance.

## Consequences
### Positive
- Improved readability of commit history
- Better traceability of changes
- Consistent release documentation
- Simplified changelog generation
- Improved support for CI/CD automation
- Professional development workflow

### Negative
- Contributors must learn and follow the commit convention
- Additional effort required to maintain the changelog
- Release process becomes slightly more structured

## Related Documents
- CONTRIBUTING.md
- CHANGELOG.md