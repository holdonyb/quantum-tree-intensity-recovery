import Mathlib.Logic.Relation
import Mathlib.Tactic.Ring

/-!
# Propagation along a connected edge relation

This file isolates the discrete rigidity step used in the reconstruction proof.  An
edgewise equality propagates along the reflexive-transitive closure of the edge
relation.  In particular, two quantities which both change sign across every edge
have globally constant product on a connected graph.
-/

namespace QuantumTree

/-- Connectivity expressed without choosing paths: every ordered pair is related by
the reflexive-transitive closure of the edge relation.  For an undirected graph the
caller supplies the usual symmetric adjacency relation. -/
def RelationConnected {V : Type*} (E : V → V → Prop) : Prop :=
  ∀ x y, Relation.ReflTransGen E x y

/-- Equality on edges propagates along a finite walk. -/
theorem eq_of_reflTransGen {V A : Type*} {E : V → V → Prop} {f : V → A}
    (hedge : ∀ ⦃x y⦄, E x y → f x = f y) {x y : V}
    (hxy : Relation.ReflTransGen E x y) : f x = f y := by
  induction hxy with
  | refl => rfl
  | tail hwalk hedgeLast ih => exact ih.trans (hedge hedgeLast)

/-- A function which agrees at the endpoints of every edge is constant on a
connected relation. -/
theorem constant_of_edge_eq {V A : Type*} {E : V → V → Prop} {f : V → A}
    (hconn : RelationConnected E)
    (hedge : ∀ ⦃x y⦄, E x y → f x = f y) :
    ∀ x y, f x = f y := by
  intro x y
  exact eq_of_reflTransGen hedge (hconn x y)

/-- If both a phase factor and a bipartite sign change sign across every edge,
their product agrees at the endpoints of every edge. -/
theorem correctedPhase_edge_eq {V R : Type*} [CommRing R]
    {E : V → V → Prop} (phase sign : V → R)
    (hphase : ∀ ⦃x y⦄, E x y → phase y = -phase x)
    (hsign : ∀ ⦃x y⦄, E x y → sign y = -sign x)
    ⦃x y : V⦄ (hxy : E x y) :
    phase x * sign x = phase y * sign y := by
  rw [hphase hxy, hsign hxy]
  ring

/-- Connected-edge phase rigidity: after correcting by the bipartite sign, the
edgewise alternating phase is a single global constant. -/
theorem correctedPhase_constant {V R : Type*} [CommRing R]
    {E : V → V → Prop} (hconn : RelationConnected E)
    (phase sign : V → R)
    (hphase : ∀ ⦃x y⦄, E x y → phase y = -phase x)
    (hsign : ∀ ⦃x y⦄, E x y → sign y = -sign x) :
    ∀ x y, phase x * sign x = phase y * sign y := by
  apply constant_of_edge_eq hconn
  intro x y hxy
  exact correctedPhase_edge_eq phase sign hphase hsign hxy

end QuantumTree
