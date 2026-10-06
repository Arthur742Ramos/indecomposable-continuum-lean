module
public import Solution

open Set IndecomposableContinuum
universe u
variable {X : Type u} [TopologicalSpace X]

local instance : ConnectedSpace Unit where
  isPreconnected_univ := Set.Subsingleton.isPreconnected (by
    intro a _ b _
    exact Subsingleton.elim _ _)
  toNonempty := ⟨()⟩

example (K : Set X) : IsSubcontinuum K ↔ IsCompact K ∧ IsConnected K := Iff.rfl
example : IsIndecomposable X ↔
    ∀ K L : Set X, IsSubcontinuum K → IsSubcontinuum L →
      K ∪ L = univ → K = univ ∨ L = univ := Iff.rfl
example : IsIndecomposable Unit := by
  intro K L hK _ _
  left
  obtain ⟨x, hx⟩ := hK.2.nonempty
  ext y
  simp only [mem_univ, iff_true]
  exact (Subsingleton.elim x y) ▸ hx
example : IsPreconnected (({()} : Set Unit)ᶜ) :=
  preconnected_compl_singleton (by
    intro K L hK _ _
    left
    obtain ⟨x, hx⟩ := hK.2.nonempty
    ext y
    simp only [mem_univ, iff_true]
    exact (Subsingleton.elim x y) ▸ hx) ()
example : ¬ IsConnected (∅ : Set Unit) := fun h => h.nonempty.ne_empty rfl

-- The relative theorem is obtained by using the actual induced subtype topology.
example [T2Space X] (C : Set X) (hc : IsCompact C) (hn : IsConnected C) :
    IsIndecomposable C ↔
      ∀ K : Set C, IsSubcontinuum K → K ≠ univ → interior K = ∅ := by
  let : CompactSpace C := isCompact_iff_compactSpace.mp hc
  let : ConnectedSpace C := isConnected_iff_connectedSpace.mp hn
  exact indecomposable_iff_empty_interior

#print axioms IndecomposableContinuum.indecomposable_iff_empty_interior
#print axioms IndecomposableContinuum.indecomposable_iff_nowhere_dense
#print axioms IndecomposableContinuum.connected_compl_of_proper_subcontinuum
#print axioms IndecomposableContinuum.preconnected_compl_singleton
#print axioms IndecomposableContinuum.connected_compl_singleton
#print axioms IndecomposableContinuum.IsSubcontinuum
#print axioms IndecomposableContinuum.IsIndecomposable
