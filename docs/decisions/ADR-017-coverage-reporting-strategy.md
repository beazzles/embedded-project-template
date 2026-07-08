# ADR-017: Coverage Reporting Strategy
## Status
Accepted

## Context
ADR-006 introduced automated code coverage measurement for local development using `gcov` and `gcovr`.

Developers can already generate coverage reports locally after executing the unit test suite.

However, local coverage measurement alone does not provide consistent visibility during collaborative development.

As the Engineering Platform evolves, coverage information should become part of the Continuous Integration process to provide immediate feedback for every change.

Different integration stages require different quality objectives:
- Feature integration primarily benefits from visibility into the impact of changes on test coverage.
- Release integration requires stronger quality guarantees before changes become part of the stable project state.

Therefore, the Engineering Platform requires a coverage reporting strategy that distinguishes between development feedback and release quality evaluation.

## Decision
The Engineering Platform shall automatically collect code coverage information during Continuous Integration.

Coverage shall be measured for every pull request targeting the permanent branches.

Coverage serves different purposes depending on the integration stage:
- Pull requests targeting the **develop** branch shall generate and publish coverage reports to provide feedback to developers.
- Pull requests targeting the **main** branch shall evaluate coverage as part of the overall release quality assessment.

Coverage thresholds shall **not** be introduced as part of this Architecture Decision Record.

The definition of concrete coverage requirements and release quality criteria is intentionally deferred to future Architecture Decision Records covering release management.

Coverage reporting shall remain independent of any specific CI platform. 

The CI system is responsible for invoking the measurement tools and publishing the generated reports, while the coverage generation itself shall remain script-driven and reusable across different CI implementations.

## Consequences
### Advantages
- Code coverage becomes part of the automated Continuous Integration process.
- Developers receive immediate feedback about the impact of changes on test coverage.
- Release integration can incorporate coverage into the overall release quality assessment.
- Coverage reporting remains independent of a specific CI platform through script-driven execution.
- Future coverage thresholds can be introduced without changing the overall reporting strategy.

### Disadvantages
- Coverage measurement increase Continuous Integration execution time.
- Additional reports and artifacts are generatted and must be managed.
- Code coverage alone is not a sufficient indicator of software quality and must always be interpreted together with other quality metrics.
- Release quality criteria remain incomplete until future Architecture Decision Records define concrete coverage thresholds.

## Decision
### Coverage as a Release Quality Criterion
Using code coverage as part of the release quality evaluation was selected.

This approach distinguishes between development feedback and release readiness. Developers receive continuous visibility during feature integration while release decisions may later incorporate minimum coverage requirements defined by future Architecture Decision Records.

## Alternatives Considered
### Local Coverage Measurement Only
Coverage reports generated exclusively during local development were considered.

Although this approach minimizes Continuous Integration execution time, it does not provide consistent visibility across all contributors and cannot be used as part of an automated quality process.

### Coverage as an Immediate Quality Gate
Using code coverage as a mandatory quality gate for all pull requests was considered.

While this approach enforces continuous test coverage, it may unnecessarily restrict feature integration during active development and reduce development flexibility.

### External Coverage Reporting Services

External services such as `Codecov` or `Coveralls` were considered.

Although these platforms provide advanced reporting capabilities, they introduce unnecessary external dependencies and reduce platform independence.

The Engineering Platform therefore prefers generating and publishing coverage reports using locally executed tooling.

## Scope

This ADR defines the overall coverage reporting strategy for the Engineering Platform.

It intentionally does not define:
- minimum coverage thresholds,
- release quality criteria,
- coverage badges,
- historical coverage tracking,
- coverage trend analysis,
- external reporting services.

These topics may be addressed by future Architecture Decision Records as the Engineering Platform evolves.