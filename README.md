# Indecomposable continua

This Lean project proves that a compact connected Hausdorff space is
indecomposable if and only if every proper subcontinuum has empty relative
interior, equivalently is nowhere dense. It also proves that removing a proper
subcontinuum leaves a connected nonempty set, and that an indecomposable
continuum has no cut points.

The continuum is the ambient type `X`. A subcontinuum is a compact connected
subset; Mathlib's `IsConnected` includes nonemptiness. Indecomposability says
that two subcontinua covering X cannot both be proper. These definitions are
written out in both [Challenge.lean](Challenge.lean) and
[Solution.lean](Solution.lean). A singleton continuum satisfies the
characterizations. Point removal is preconnected even in that case; the
connected point-removal theorem adds `Nontrivial X` to ensure nonemptiness.
For a continuum C in a larger space Y, instantiate X with the subtype C.
Interior and nowhere density then use the topology induced on C.

The selected statements are:

| Declaration in `IndecomposableContinuum` | Content |
| --- | --- |
| `indecomposable_iff_empty_interior` | Interior characterization |
| `indecomposable_iff_nowhere_dense` | Nowhere-dense characterization |
| `connected_compl_of_proper_subcontinuum` | No proper subcontinuum separates X |
| `preconnected_compl_singleton` | Point removal, including singleton continua |
| `connected_compl_singleton` | Nonempty point removal for nontrivial X |

The proof follows Paul Bankston's [Metric Topology: A First Course](https://www.mscsnet.mu.edu/~paul/Paper/4450102text.pdf#page=91),
Propositions 29.1 and 29.2, printed pages 91 and 92, and Exercise 29(6), page 93.
Although the course title mentions metric topology, these statements concern
Hausdorff continua. This project uses compact Hausdorff generality throughout.

If X is a union of two proper subcontinua K and L, the nonempty open complement
of L lies in K, so K has interior. Conversely, suppose a proper subcontinuum K
has interior. If its complement is connected, K and the closure of that
complement give a decomposition. The closure misses the interior of K, so it
is proper. If the complement is disconnected, separate it into two nonempty
open sides U and V. A gluing lemma makes K ∪ U and K ∪ V connected. They are
closed, proper, and cover X. The same gluing argument proves the connected
complement consequence. Compact subsets of a Hausdorff space are closed, so
empty interior agrees with nowhere density.

The intended audience is researchers in continuum theory and developers of
formal general topology. The interior criterion links decomposition to local
topology and gives a reusable obstruction to separation by a subcontinuum.
The mathematical result is classical. This project does not claim a new
theorem or a first formalization.

The pinned Mathlib source scan covered 9,084 Lean files in Mathlib, Archive,
Counterexamples, MathlibTest, and Wanted. Searches for indecomposability,
subcontinua, continua, and connectedness near complement or interior found no
equivalent target among the inspected candidates. Indecomposability hits
concerned algebra, category theory, and ordinals. Mathlib already supplies
closed-set connectedness criteria, connected closures, compactness, and the
closed-set nowhere-dense criterion. The new proof combines these into the
classical characterization. A source search cannot establish global absence.

Lean is pinned to `leanprover/lean4:v4.35.0-rc2`; Mathlib is pinned to
`065356127b1dc0016f66b7283ce0ce2c4055aa55`. On a machine with the pinned
toolchain and dependencies available:

```sh
lake exe cache get
lake build --wfail
python3 scripts/verify.py
```

[DEFINITIONS.md](DEFINITIONS.md) explains the predicates and links complete
pinned source bodies. [VERIFICATION.md](VERIFICATION.md) records what was
checked and the remaining limits. Challenge has five deliberate proof holes;
Solution supplies all five proofs. Independent review, publication, hosted CI,
Comparator, NanoDa, and registry review are coordinated outside this author
workspace and are not claimed as completed here.
