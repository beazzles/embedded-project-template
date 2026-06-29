# ADR-015: Documentation Publication Strategy
## Status
Accepted

## Context
ADR-014 established automated API documentation generation using Doxygen.

The documentation pipeline currently provides:
```text
Source Code -> Doxygen -> HTML Documentation -> CI Artifact
```

The generated documentation can be downloaded from CI workflows, but it is not directly accessible to users or contributors.

For a reusable Engineering Platform, documentation should be:
- Automatically generated
- Easily accessible
- Independent of a specific hosting platform
- Puplishable through different infrastructure providers

Examples include:
- GitHub Pages
- GitLab Pages
- Azure DevOps
- Jenkins
- Internal web servers
- Artifact repositories

The platform should therefore separate **Documentation Generation** from **Documentation Publication**.

## Decision
The Engineering Platform shall distinguish between:

### Documentation Source
Documentation shall be maintained directly within project artifacts, including:
- Source code comments
- Requirements
- Architecture documentation
- ADRs

### Documentation Generation
Documentation shall be generated automatically from source artifacts.

The output format shall be **HTML** unless a project explicitly requires additional formats.

### Documentation Publication
Generated documentation shall be published through a dedicated publication layer.

The publication mechanism shall be considered an implementation detail and shall remain replaceable.

The publication process shall consume generated documentation artifacts and shall not depend directly on source files.

## Reference Implementation
The reference implementation for the Engineering Platform shall use GitHub Pages to publish generated Doxygen documentation.

This choice is made because:

- It is available without additional infrastructure.
- It integrates well with GitHub Actions.
- It provides a practical demonstration of the publication architecture.

Alternative publication mechanisms may be substituted without modifying the documentation generation process.

Projects may temporarily disable publication while remaining compliant with this ADR, provided that documentation generation remains functional.

## Consequences 
### Positive
- Documentation becomes directly accessible.
- Documentation generation and publication remain decoupled.
- Publication infrastructure remains replaceable.
- The architecture scales to self-hosted environments.
- Contributors can consume documentation without downloading CI artifacts.

### Negative
- Additional CI workflow complexity is introduced.
- Publication failures become a separate operational concern.
- Generated documentation must be managed as a deployable artifact.
- The reference implementation depends on GitHub Pages availability.

## Alternatives Considered
### Store Generated HTML in Git
Rejected because:
- Generated files create noisy commits.
- Repository size continuously grows.
- Generated artifacts are reproducible.

### CI Artifacts Only
Rejected because:
- Documentation remains difficult to discover.
- Contributors must manually download artifacts.

### GitHub Pages as a Mandatory Platform Component
Rejected because:
- It creates unnecessary platform coupling.
- It conflicts with the Engineering Platform goal of infrastructure independence.

## References
- ADR-008: GitHub Actions Workflow
- ADR-014: Automated API Documentation Generation

## Implementation Status
Reference implementation completed.

The documentation publication pipeline automatically:

- generates Doxygen documentation,
- publishes the generated HTML documentation,
- deploys the generated artifacts to GitHub Pages.

The publication mechanism is independent from the documentation generator itself and may later be adapted to alternative publication targets while preserving the documentation generation workflow.