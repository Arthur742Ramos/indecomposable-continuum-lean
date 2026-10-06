# Verification record

The author checks passed with Lean `4.35.0-rc2` (commit
`11acb17ec6b07a8f9e9173e6845197929540936b`) and Mathlib commit
`065356127b1dc0016f66b7283ce0ce2c4055aa55`.

The local gate compiled Solution from source with warnings treated as errors.
It then compiled a randomly renamed Challenge using only dependency paths,
with no Solution artifact on its import path. Challenge produced exactly its
five intended proof-hole warnings. Separate imports exported complete raw
Lean expressions and universe parameter lists for the five selected theorems
and both project predicates. The outputs matched byte for byte, including the
complete values of `IsSubcontinuum` and `IsIndecomposable`.

Transitive axiom inspection found only `propext`, `Classical.choice`, and
`Quot.sound` in the five proofs. The two predicate values use `propext` and
`Quot.sound`. Solution contains no proof holes, new axioms, unsafe declarations,
native-decision shortcuts, or hidden theorem certificates.

The semantic audit checked the actual literal project definitions, singleton
indecomposability, preconnected point removal in a singleton, failure of
connectedness for the empty set, and application of the main theorem to a
compact connected subtype in a larger Hausdorff space. The dependency audit
checked literal preconnectedness, connectedness, open and closed sets, interior,
closure, nowhere density, compactness through finite open covers, Hausdorff
separation, connected-space classes, nontriviality, and induced subtype topology.

The bounded definition dossier has 15 complete pinned source files and 39
indexed declaration bodies. Fresh authenticated source reads matched all 15
upstream Git blobs. Its integrity check also compared the 14 topology and
supporting source files with the consumed Mathlib files. Four negative controls
were rejected: changed source bytes, a changed pin, a missing predicate, and a
header-only declaration with its hash and displayed excerpt adjusted to match.
The complete original source bodies remain directly inspectable.

The current official v0.4 schema accepted `formalization.yaml`. Its negative
controls rejected an invalid relationship, a thin wrapper without a substantive
source, and a negative admission count. The pinned Palomar metadata contract
also accepted the JSON-form YAML through a duplicate-rejecting JSON decoder
adapter. This adapter does not claim to parse arbitrary YAML.

Local compiler stages ran serially in a Windows Job Object limited to one CPU,
3 GiB of aggregate committed memory, and 30 minutes. Private receipts record
the exact argv, compiler hash, source hashes before and after each stage,
resource observations, exit status, and cleanup of all owned processes.
No shared process was controlled. Failed proof and audit attempts are retained
in the private evidence; the final source passed the complete gate.

The ordinary `lake build --wfail` attempt failed during dependency setup: Git
could not connect to GitHub to fetch the pinned Mathlib revision. Dependency
installation was not retried, and no global Git, network, or security setting
was changed. This is a build-access limitation; the successful direct proof
checks used copied dependency artifacts whose source and artifact bytes were
qualified against the prior cache. The earlier Git revision observations are
inherited evidence, and a clean dependency rebuild is not claimed.

The pinned CI workflow is supplied for the publication lane. Its execution,
an ordinary successful Lake build, a clean dependency rebuild, independent
review, human expert review, hosted Comparator, NanoDa, con-ron replay, and
registry review remain outstanding. This author lane neither publishes the
repository nor submits to the registry.
