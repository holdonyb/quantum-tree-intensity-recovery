import Mathlib.Data.Complex.Basic
import Mathlib.Data.Matrix.Basic

/-!
# Bipartite sign involution

This file checks the algebraic core of the bipartite ambiguity.  If `s` is a
real sign vector, the matrix and state transformations are

* `H i j ↦ -(s i * H i j * s j)`, and
* `u i ↦ s i * conj (u i)`.

The graph-theoretic input is deliberately exposed as hypotheses: every sign
squares to one, and endpoint signs on an edge have product `-1`.
-/

namespace QuantumTree

open Complex
open ComplexConjugate

universe u

variable {ι : Type u}

/-- The matrix part of the bipartite antiunitary involution. -/
def bipartiteMatrix (s : ι → ℂ) (H : Matrix ι ι ℂ) : Matrix ι ι ℂ :=
  fun i j => -(s i * H i j * s j)

/-- The state part of the bipartite antiunitary involution. -/
def bipartiteState (s u : ι → ℂ) : ι → ℂ :=
  fun i => s i * conj (u i)

/-- A `-1` edge remains a `-1` edge when its endpoint signs are opposite. -/
theorem bipartiteMatrix_edge_preserved
    (s : ι → ℂ) (H : Matrix ι ι ℂ) (i j : ι)
    (hH : H i j = -1) (hopposite : s i * s j = -1) :
    bipartiteMatrix s H i j = -1 := by
  rw [bipartiteMatrix, hH]
  calc
    -(s i * -1 * s j) = s i * s j := by ring
    _ = -1 := hopposite

/-- A diagonal entry changes sign when the corresponding sign squares to one. -/
theorem bipartiteMatrix_diagonal
    (s : ι → ℂ) (H : Matrix ι ι ℂ) (i : ι)
    (hsquare : s i * s i = 1) :
    bipartiteMatrix s H i i = -H i i := by
  rw [bipartiteMatrix]
  calc
    -(s i * H i i * s i) = -(H i i * (s i * s i)) := by ring
    _ = -H i i := by rw [hsquare, mul_one]

/-- Applying the matrix transformation twice is the identity. -/
theorem bipartiteMatrix_involution
    (s : ι → ℂ) (H : Matrix ι ι ℂ)
    (hsquare : ∀ i, s i * s i = 1) :
    bipartiteMatrix s (bipartiteMatrix s H) = H := by
  funext i j
  rw [bipartiteMatrix, bipartiteMatrix]
  calc
    -(s i * (-(s i * H i j * s j)) * s j) =
        (s i * s i) * H i j * (s j * s j) := by ring
    _ = H i j := by rw [hsquare i, hsquare j, one_mul, mul_one]

/-- Applying the state transformation twice is the identity for real signs. -/
theorem bipartiteState_involution
    (s u : ι → ℂ)
    (hsquare : ∀ i, s i * s i = 1)
    (hreal : ∀ i, conj (s i) = s i) :
    bipartiteState s (bipartiteState s u) = u := by
  funext i
  rw [bipartiteState, bipartiteState, map_mul, conj_conj, hreal i]
  calc
    s i * (s i * u i) = (s i * s i) * u i := by ring
    _ = u i := by rw [hsquare i, one_mul]

/-- A real complex sign whose square is one has squared norm one. -/
theorem normSq_eq_one_of_real_square_one
    (z : ℂ) (hsquare : z * z = 1) (hreal : conj z = z) :
    normSq z = 1 := by
  apply ofReal_injective
  rw [normSq_eq_conj_mul_self, hreal, hsquare]
  rfl

/-- The state transformation preserves every coordinate intensity. -/
theorem bipartiteState_normSq
    (s u : ι → ℂ) (i : ι)
    (hsquare : s i * s i = 1)
    (hreal : conj (s i) = s i) :
    normSq (bipartiteState s u i) = normSq (u i) := by
  rw [bipartiteState, normSq_mul, normSq_conj,
    normSq_eq_one_of_real_square_one (s i) hsquare hreal, one_mul]

/-- Negating every sign does not change the transformed matrix. -/
theorem bipartiteMatrix_neg_signature
    (s : ι → ℂ) (H : Matrix ι ι ℂ) :
    bipartiteMatrix (fun i => -s i) H = bipartiteMatrix s H := by
  funext i j
  simp only [bipartiteMatrix]
  ring

/-- Negating every sign only multiplies the transformed state by global `-1`. -/
theorem bipartiteState_neg_signature
    (s u : ι → ℂ) :
    bipartiteState (fun i => -s i) u = fun i => -bipartiteState s u i := by
  funext i
  simp only [bipartiteState]
  ring

end QuantumTree
