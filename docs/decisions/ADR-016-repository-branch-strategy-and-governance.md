# ADR-016: Repository Branch Strategy and Governance
## Status 
Accepted

## Context
As the Engineering Platform evolved, the development workflow became increasingly important.

During the implementation of previous Architecture Decision Records, particularly ADR-015 (Documentation Publication Strategy), several shortcomings in the existing repository workflow became apparent:
- Development was initially performed directly on the main branch.
- Branch protection rules required changes to be introduced through pull requests.
- Temporary development branches needed different protection rules than permanent branches.
- Deployment branches (such as *gh-pages*) serve a fundamentally different purpose than development branches.
- No formal branching strategy had been documented.

To ensure a consistent, maintainable and scalable development workflow, a repository branching strategy shall be defined.

The selected workflow should:
- support professional software development practices,
- remain suitable for small projects,
- scale to larger projects,
- remain independent of a specific repository hosting platform.

## Decision
The Engineering Platform shall adopt a simplified GitFlow-inspired branching strategy.

The following branch types are defined:
| Branch    | Purpose |
|-----------|:--------|
| main      | Stable development branch representing released project state |
| develop   | Integration branch for completed features before release |
| feature/* | Development of new functionality |
| fix/*     | Development of non-critical bug-fixes |
| hotfix/*  | Development of critical fixes for released versions |
| gh-pages  | Automatically generated deployment artifacts maintained exclusively by CI |

Development shall follow the workflow below:
```text
feature/* / fix/*
        ↓
     develop
        ↓
       main
```

Critical production fixes may be introduced using dedicated _hotfix/*_ branches.

Deployment branches containing generated artifacts shall not be treated as development branches.

## Consequences
### Advantages
- Clear separation between development and stable releases.
- Consistent workflow for all contributors
- Professional development process aligned with established branching strategies.
- Suitable for both individual developers and collaborative development.
- Platform-independent workflow independent of repository hosting providers.
- Clear distinction between development branches and deployment branches.

### Disadvantages
- Slightly increased workflow complexity compared to a single-branch model.
- Additional branch management is required.
- Release management remains outside of this ADR.

## Alternatives Considered
### Single Main Branch
A single permanent branch was considered.

Although simple, this approach does not provide a clear separation between ongoing development and stable releases.

### GitHub Flow
A workflow using short-lived feature branches merged directly into *main* was considered.

While suirable for many projects, it does not provide an integration branch for grouping multiple features prior to release.

### Full GitFlow
The complete GitFlow model including dedicated release branches was considered.

Although powerful,it introduces additional complexity that is currently unnecessary for this project.

Release branches may be introduced in a future Architecture Decision Record if project requirements justify the additional workflow complexity.

## Scope
This ADR defines the repository branching strategy only.

It intentionally does **not** define:
- release management,
- semantic versioning,
- release branches,
- release automation,
- artifact publishing.

These topics will be addressed by future Architecture Decision Records as the Engineering Platform approaches production readiness.
