# Definition fidelity

The continuum is the type `X` with its given topology. `CompactSpace X`,
`T2Space X`, and `ConnectedSpace X` say that it is compact, Hausdorff, connected,
and nonempty. A continuum may be a singleton. The last theorem alone adds
`Nontrivial X`, because removing the point of a singleton leaves the empty set.
Mathlib calls the empty set preconnected and reserves connected for nonempty sets.

`IsSubcontinuum K` has the complete value `IsCompact K ∧ IsConnected K`.
`IsIndecomposable X` quantifies over two such subsets and says that a cover
`K ∪ L = univ` forces one of them to be the whole space. Both definitions are
written out in Challenge and Solution; they contain no unspecified values.
Proper means `K ≠ univ`, including a singleton as a possible subcontinuum.

`interior K` is the union of the open subsets contained in K. `closure K` is
the intersection of its closed supersets. Mathlib defines `IsNowhereDense K`
as `interior (closure K) = ∅`. A subcontinuum is closed in the Hausdorff space,
so its closure equals itself and these two characterizations agree.

For a continuum C contained in a larger space Y, instantiate `X` with the
subtype C. Its topology is induced by inclusion into Y. The interior in the
theorems is then relative to C. An ambient interior in Y could be empty even
for a decomposable C, and is not the predicate in this project.

The files below are unmodified complete source files at the pinned Mathlib
commit. Each declaration range includes its whole body, including structure
fields and proof bodies for the finite-open-cover characterization. The
manifest records file and excerpt hashes, upstream Git blobs, dependency
cross-references, and license provenance. Standard set and filter machinery
supporting these definitions is indexed in the same manifest. Source evidence
uses `.lean.txt` filenames so it cannot masquerade as a project module.

The literal Lean audit checks the actual imported predicates, the supplied
project definitions, open-cover compactness, and the induced subtype topology.
Integrity checks reject changed bytes, a changed pin, a missing predicate, and
a header-only declaration even when its excerpt hash is adjusted.

## TopologicalSpace

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Basic.lean) (lines 73 to 83).

```lean
class TopologicalSpace (X : Type u) where
  /-- A predicate saying that a set is an open set. Use `IsOpen` in the root namespace instead. -/
  protected IsOpen : Set X → Prop
  /-- The set representing the whole space is an open set.
  Use `isOpen_univ` in the root namespace instead. -/
  protected isOpen_univ : IsOpen univ
  /-- The intersection of two open sets is an open set. Use `IsOpen.inter` instead. -/
  protected isOpen_inter : ∀ s t, IsOpen s → IsOpen t → IsOpen (s ∩ t)
  /-- The union of a family of open sets is an open set.
  Use `isOpen_sUnion` in the root namespace instead. -/
  protected isOpen_sUnion : ∀ s, (∀ t ∈ s, IsOpen t) → IsOpen (⋃₀ s)
```

## IsOpen

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Basic.lean) (lines 95 to 95).

```lean
def IsOpen : Set X → Prop := TopologicalSpace.IsOpen
```

## IsClosed

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Basic.lean) (lines 107 to 109).

```lean
class IsClosed (s : Set X) : Prop where
  /-- The complement of a closed set is an open set. -/
  isOpen_compl : IsOpen sᶜ
```

## IsPreconnected

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Connected/Basic.lean) (lines 50 to 52).

```lean
def IsPreconnected (s : Set α) : Prop :=
  ∀ u v : Set α, IsOpen u → IsOpen v → s ⊆ u ∪ v → (s ∩ u).Nonempty → (s ∩ v).Nonempty →
    (s ∩ (u ∩ v)).Nonempty
```

## IsConnected

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Connected/Basic.lean) (lines 55 to 56).

```lean
def IsConnected (s : Set α) : Prop :=
  s.Nonempty ∧ IsPreconnected s
```

## PreconnectedSpace

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Connected/Basic.lean) (lines 697 to 699).

```lean
class PreconnectedSpace (α : Type u) [TopologicalSpace α] : Prop where
  /-- The universal set `Set.univ` in a preconnected space is a preconnected set. -/
  isPreconnected_univ : IsPreconnected (univ : Set α)
```

## ConnectedSpace

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Connected/Basic.lean) (lines 705 to 707).

```lean
class ConnectedSpace (α : Type u) [TopologicalSpace α] : Prop extends PreconnectedSpace α where
  /-- A connected space is nonempty. -/
  toNonempty : Nonempty α
```

## CompactSpace

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Filter.lean) (lines 297 to 299).

```lean
class CompactSpace : Prop where
  /-- In a compact space, `Set.univ` is a compact set. -/
  isCompact_univ : IsCompact (Set.univ : Set X)
```

## IsCompact

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Filter.lean) (lines 290 to 291).

```lean
def IsCompact (s : Set X) :=
  ∀ ⦃f⦄ [NeBot f], f ≤ 𝓟 s → ∃ x ∈ s, ClusterPt x f
```

## isCompact_iff_finite_subcover

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Compactness/Compact.lean) (lines 386 to 389).

```lean
theorem isCompact_iff_finite_subcover :
    IsCompact s ↔ ∀ {ι : Type u} (U : ι → Set X),
      (∀ i, IsOpen (U i)) → (s ⊆ ⋃ i, U i) → ∃ t : Finset ι, s ⊆ ⋃ i ∈ t, U i :=
  ⟨fun hs => hs.elim_finite_subcover, isCompact_of_finite_subcover⟩
```

## T2Space

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Separation/Hausdorff.lean) (lines 85 to 87).

```lean
class T2Space (X : Type u) [TopologicalSpace X] : Prop where
  /-- Every two points in a Hausdorff space admit disjoint open neighbourhoods. -/
  t2 : Pairwise fun x y => ∃ u v : Set X, IsOpen u ∧ IsOpen v ∧ x ∈ u ∧ y ∈ v ∧ Disjoint u v
```

## interior

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Basic.lean) (lines 122 to 123).

```lean
def interior (s : Set X) : Set X :=
  ⋃₀ { t | IsOpen t ∧ t ⊆ s }
```

## closure

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Basic.lean) (lines 126 to 127).

```lean
def closure (s : Set X) : Set X :=
  ⋂₀ { t | IsClosed t ∧ s ⊆ t }
```

## IsNowhereDense

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/GDelta/Basic.lean) (lines 200 to 200).

```lean
def IsNowhereDense (s : Set X) := interior (closure s) = ∅
```

## Nontrivial

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Basic/Nontrivial/Defs.lean) (lines 28 to 30).

```lean
class Nontrivial (α : Type*) : Prop where
  /-- In a nontrivial type, there exists a pair of distinct terms. -/
  exists_pair_ne : ∃ x y : α, x ≠ y
```

## subtype topology

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Induced.lean) (lines 76 to 78).

```lean
instance _root_.instTopologicalSpaceSubtype {p : X → Prop} [t : TopologicalSpace X] :
    TopologicalSpace (Subtype p) :=
  induced (↑) t
```

## TopologicalSpace.induced

[Complete pinned source](https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Topology/Defs/Induced.lean) (lines 64 to 74).

```lean
def induced (f : X → Y) (t : TopologicalSpace Y) : TopologicalSpace X where
  IsOpen s := ∃ t, IsOpen t ∧ f ⁻¹' t = s
  isOpen_univ := ⟨univ, isOpen_univ, preimage_univ⟩
  isOpen_inter := by
    rintro s₁ s₂ ⟨s'₁, hs₁, rfl⟩ ⟨s'₂, hs₂, rfl⟩
    exact ⟨s'₁ ∩ s'₂, hs₁.inter hs₂, preimage_inter⟩
  isOpen_sUnion S h := by
    choose! g hgo hfg using h
    refine ⟨⋃₀ (g '' S), isOpen_sUnion <| forall_mem_image.2 hgo, ?_⟩
    rw [preimage_sUnion, biUnion_image, sUnion_eq_biUnion]
    exact iUnion₂_congr hfg
```

