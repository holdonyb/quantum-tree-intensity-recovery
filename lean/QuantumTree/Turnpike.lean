import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Ring

/-!
# The direct/reflected turnpike kernel

This file formalizes one finite combinatorial seam of the reconstruction proof.
For each labelled point `x i` in an interval of length `L`, a candidate point is
assumed to be either `x i` or its reflection `L - x i`.  If every distance
between two distinct candidates belongs to the observed distance set, while no
mixed direct/reflected distance belongs to that set, then all orientation choices
are equal.

Trust boundary: the hypotheses that the two-point candidates have already been
constructed and that all mixed distances are excluded are assumptions here.  This
file does not formalize their derivation from an intensity movie, Prony recovery,
or a semialgebraic genericity argument.
-/

namespace QuantumTree.Turnpike

open Set

/-- Choose `x` directly when `reflected = false`, and choose `L - x` when it is true. -/
def orientedPoint (L x : ℝ) (reflected : Bool) : ℝ :=
  bif reflected then L - x else x

@[simp]
theorem orientedPoint_false (L x : ℝ) : orientedPoint L x false = x := rfl

@[simp]
theorem orientedPoint_true (L x : ℝ) : orientedPoint L x true = L - x := rfl

/-- The distance made by a direct first choice and a reflected second choice. -/
theorem mixedDistance_direct_reflected (L x y : ℝ) :
    abs (orientedPoint L x false - orientedPoint L y true) = abs (x + y - L) := by
  congr 1
  rw [orientedPoint_false, orientedPoint_true]
  ring

/-- The same mixed distance with the two orientations reversed. -/
theorem mixedDistance_reflected_direct (L x y : ℝ) :
    abs (orientedPoint L x true - orientedPoint L y false) = abs (x + y - L) := by
  calc
    abs (orientedPoint L x true - orientedPoint L y false) = abs (-(x + y - L)) := by
      congr 1
      rw [orientedPoint_true, orientedPoint_false]
      ring
    _ = abs (x + y - L) := abs_neg _

/--
If all distances between distinct chosen candidates lie in `distances`, but the
distance forced by every mixed direct/reflected pair does not, then any two
orientation choices agree.
-/
theorem orientation_eq_of_mixed_distance_exclusion
    {ι : Type*} (L : ℝ) (x : ι → ℝ) (reflected : ι → Bool)
    (distances : Set ℝ)
    (hCandidate : ∀ i j, i ≠ j →
      abs (orientedPoint L (x i) (reflected i) -
        orientedPoint L (x j) (reflected j)) ∈ distances)
    (hMixedExcluded : ∀ i j, i ≠ j → abs (x i + x j - L) ∉ distances) :
    ∀ i j, reflected i = reflected j := by
  intro i j
  by_contra hOrientation
  have hIndices : i ≠ j := by
    intro hij
    apply hOrientation
    simp [hij]
  have hDistance :
      abs (orientedPoint L (x i) (reflected i) -
        orientedPoint L (x j) (reflected j)) = abs (x i + x j - L) := by
    cases hi : reflected i <;> cases hj : reflected j
    · simp [hi, hj] at hOrientation
    · simpa [hi, hj] using mixedDistance_direct_reflected L (x i) (x j)
    · simpa [hi, hj] using mixedDistance_reflected_direct L (x i) (x j)
    · simp [hi, hj] at hOrientation
  apply hMixedExcluded i j hIndices
  rw [← hDistance]
  exact hCandidate i j hIndices

/--
On a nonempty labelled family, the uniform orientation conclusion splits
explicitly into the all-direct and all-reflected branches.
-/
theorem all_direct_or_all_reflected_of_mixed_distance_exclusion
    {ι : Type*} [Nonempty ι] (L : ℝ) (x : ι → ℝ) (reflected : ι → Bool)
    (distances : Set ℝ)
    (hCandidate : ∀ i j, i ≠ j →
      abs (orientedPoint L (x i) (reflected i) -
        orientedPoint L (x j) (reflected j)) ∈ distances)
    (hMixedExcluded : ∀ i j, i ≠ j → abs (x i + x j - L) ∉ distances) :
    (∀ i, reflected i = false) ∨ (∀ i, reflected i = true) := by
  let i₀ : ι := Classical.choice (inferInstance : Nonempty ι)
  have hUniform := orientation_eq_of_mixed_distance_exclusion
    L x reflected distances hCandidate hMixedExcluded
  cases h₀ : reflected i₀
  · left
    intro i
    calc
      reflected i = reflected i₀ := hUniform i i₀
      _ = false := h₀
  · right
    intro i
    calc
      reflected i = reflected i₀ := hUniform i i₀
      _ = true := h₀

/-- The branch split stated directly as a formula for every candidate point. -/
theorem orientedPoints_direct_or_reflected_of_mixed_distance_exclusion
    {ι : Type*} [Nonempty ι] (L : ℝ) (x : ι → ℝ) (reflected : ι → Bool)
    (distances : Set ℝ)
    (hCandidate : ∀ i j, i ≠ j →
      abs (orientedPoint L (x i) (reflected i) -
        orientedPoint L (x j) (reflected j)) ∈ distances)
    (hMixedExcluded : ∀ i j, i ≠ j → abs (x i + x j - L) ∉ distances) :
    (∀ i, orientedPoint L (x i) (reflected i) = x i) ∨
      (∀ i, orientedPoint L (x i) (reflected i) = L - x i) := by
  rcases all_direct_or_all_reflected_of_mixed_distance_exclusion
    L x reflected distances hCandidate hMixedExcluded with hDirect | hReflected
  · left
    intro i
    simp [hDirect i]
  · right
    intro i
    simp [hReflected i]

end QuantumTree.Turnpike
