module
public import Lean.Environment

/-! Export raw expression types, universe parameters, and literal project predicate values. -/
@[expose] public section
open Lean
def main (args : List String) : IO Unit := do
  let [moduleName] := args | throw <| IO.userError "Expected one module name"
  initSearchPath (← findSysroot)
  let env ← importModules #[{ module := moduleName.toName }] {} (level := .exported)
  for name in #[`IndecomposableContinuum.indecomposable_iff_empty_interior,
      `IndecomposableContinuum.indecomposable_iff_nowhere_dense,
      `IndecomposableContinuum.connected_compl_of_proper_subcontinuum,
      `IndecomposableContinuum.preconnected_compl_singleton,
      `IndecomposableContinuum.connected_compl_singleton,
      `IndecomposableContinuum.IsSubcontinuum, `IndecomposableContinuum.IsIndecomposable] do
    let some info := env.find? name | throw <| IO.userError s!"Missing declaration: {name}"
    IO.println s!"RAW TYPE {name}"
    IO.println (reprStr info.levelParams)
    IO.println (reprStr info.type)
    if name == `IndecomposableContinuum.IsSubcontinuum ||
        name == `IndecomposableContinuum.IsIndecomposable then
      IO.println (reprStr info.value?)
