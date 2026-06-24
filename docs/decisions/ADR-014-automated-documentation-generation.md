# ADR-014: Automated API Documentation Generation
## Status
Accepted

## Context
The project aims to provide professional software documentation as part of the engineering process.

Source code documentation shall be generated automatically to:
- improve maintainability
- support onboarding of new developers
- provide API reference documentation
- integrate documentation into the CI/CD workflow
- ensure documentation generation remains reproducible

The project already uses:
- Requirements Management (Doorstop)
- Architecture Decision Records (ADR)
- Automated Testing
- Continuous Integration

API documentation shall become an additional automated engineering artifact.

The project shall remain independent of aany specific documentation hosting solution.

## Decision Drivers
- Automated generation
- Reproducible output
- CI/CD integration
- Low maintenance effort
- Industry adoption
- Support for C and C++
- Tool independence
- Future support for publication workflows

## Considered Options
### Option A: Manual Documentation
Maintain documentation manually in Markdown files.

#### Advantages
- No additional tooling
- Full control over content

#### Disadvantages
- High maintenance efforrt
- Documentation can diverge from implementation
- No API extraction
- No automation

### Option B: Doxygen
Generate API documentation directly from source code comments.

#### Advantages
- Industry standard
- Excellent C/C++ support
- Automatic API Extraction
- CI-friendly
- Generates HTML and other formats
- Works independently of hosting platform

#### Disadvantages
- Require documentation discipline
- Configuration effort

### Option C: Sphinx
Use Sphinx as primary documentation system.

#### Advantages
- Highly customizable
- Strong ecosystem

#### Disadvantages
- Additional complexity
- Less natural fit for embedded C/C++ API documentation
- Requires additional integration effort

## Decision Outcome

Option B (Doxygen) is selected.

The project shall generate API documentation using Doxygen.

Documentation generation shall be integrated into the engineering workflow and automated through CI/CD.

The documentation generation process shall remain independent from any publication mechanism.

Generated documentation shall be treated as a build artifact.

Future publication mechanisms (for example GitHub Pages, GitLab Pages, internal web servers, or artifact repositories) shall be evaluated separately.

## Consequences
### Positive
- Consistent API documentation
- Automated generation
- Improved maintainability
- Professional development workflow
- CI integration possible
- Hosting solution remains replaceable

### Negative
- Additional documentation effort
- Doxygen configuration must be maintained
- Poor source code comments lead to poor documentation output

### Neutral
- Documentation publication is intentionally deferred to a future ADR.
- Documentation artifacts may be consumed locally, through CI artifacts, or through future publication mechanisms.