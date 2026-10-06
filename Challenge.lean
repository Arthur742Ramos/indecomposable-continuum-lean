/-
Copyright (c) 2026 Arthur Freitas Ramos, David Barros Hulak,
Ruy Jose Guerra Barretto de Queiroz. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Arthur Freitas Ramos, David Barros Hulak, Ruy Jose Guerra Barretto de Queiroz
-/
module

public import Mathlib.Topology.Separation.Hausdorff
public import Mathlib.Topology.Connected.Clopen
public import Mathlib.Topology.GDelta.Basic

/-!
The classical interior characterization of indecomposable compact Hausdorff
continua, with connected-complement and no-cut-point consequences.
The type X represents the continuum itself: interior and nowhere density are
relative to X. To work with a continuum K in a larger space, use the subtype K.
Singleton continua are permitted. ConnectedSpace supplies nonemptiness.
-/

@[expose] public section
open Set
universe u
namespace IndecomposableContinuum
variable {X : Type u} [tX : TopologicalSpace X]

/-- A subcontinuum is a nonempty compact connected subset. -/
def IsSubcontinuum (K : Set X) : Prop := IsCompact K ∧ IsConnected K

/-- A space is indecomposable when no two proper subcontinua cover it.
The principal theorems assume separately that the space is a continuum. -/
def IsIndecomposable (X : Type u) [tX : TopologicalSpace X] : Prop :=
  ∀ K L : Set X, IsSubcontinuum K → IsSubcontinuum L →
    K ∪ L = univ → K = univ ∨ L = univ

/-- A compact connected Hausdorff space is indecomposable exactly when
every proper subcontinuum has empty interior in that space. -/
theorem indecomposable_iff_empty_interior [cX : CompactSpace X] [hX : T2Space X]
    [cnX : ConnectedSpace X] :
    IsIndecomposable X ↔ ∀ K : Set X, IsSubcontinuum K → K ≠ univ → interior K = ∅ := by
  sorry

/-- The same characterization using Mathlib's nowhere-dense predicate. -/
theorem indecomposable_iff_nowhere_dense [cX : CompactSpace X] [hX : T2Space X]
    [cnX : ConnectedSpace X] :
    IsIndecomposable X ↔ ∀ K : Set X, IsSubcontinuum K → K ≠ univ → IsNowhereDense K := by
  sorry

/-- Removing a proper subcontinuum from an indecomposable continuum
leaves a nonempty connected set. -/
theorem connected_compl_of_proper_subcontinuum [cX : CompactSpace X] [hX : T2Space X]
    [cnX : ConnectedSpace X] (hi : IsIndecomposable X) {K : Set X}
    (hK : IsSubcontinuum K) (hp : K ≠ univ) : IsConnected Kᶜ := by
  sorry

/-- Every point has preconnected complement. This includes a singleton continuum,
where the complement is empty. -/
theorem preconnected_compl_singleton [cX : CompactSpace X] [hX : T2Space X]
    [cnX : ConnectedSpace X] (hi : IsIndecomposable X) (x : X) : IsPreconnected ({x}ᶜ : Set X) := by
  sorry

/-- A nontrivial indecomposable continuum has no cut points, with nonempty
connected complements. -/
theorem connected_compl_singleton [cX : CompactSpace X] [hX : T2Space X]
    [cnX : ConnectedSpace X] [ntX : Nontrivial X] (hi : IsIndecomposable X) (x : X) :
    IsConnected ({x}ᶜ : Set X) := by
  sorry

end IndecomposableContinuum
