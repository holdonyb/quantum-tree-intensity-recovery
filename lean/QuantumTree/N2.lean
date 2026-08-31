import Mathlib.Data.Real.Basic
import Mathlib.Tactic.Linarith

/-!
# The two-vertex algebraic ambiguity

For two vertices the exceptional involution acts on the real Bloch data by
`(d, X, Y, Z) ↦ (-d, -X, Y, Z)`.  The statements below verify its order and its
fixed locus exactly.
-/

namespace QuantumTree

/-- Real coordinates for the two-vertex potential/state invariants. -/
@[ext]
structure N2Data where
  d : ℝ
  X : ℝ
  Y : ℝ
  Z : ℝ

/-- The nontrivial algebraic ambiguity in the two-vertex coordinates. -/
def n2Flip (a : N2Data) : N2Data where
  d := -a.d
  X := -a.X
  Y := a.Y
  Z := a.Z

@[simp] theorem n2Flip_d (a : N2Data) : (n2Flip a).d = -a.d := rfl
@[simp] theorem n2Flip_X (a : N2Data) : (n2Flip a).X = -a.X := rfl
@[simp] theorem n2Flip_Y (a : N2Data) : (n2Flip a).Y = a.Y := rfl
@[simp] theorem n2Flip_Z (a : N2Data) : (n2Flip a).Z = a.Z := rfl

/-- The two-vertex transformation is an involution. -/
@[simp] theorem n2Flip_involutive (a : N2Data) : n2Flip (n2Flip a) = a := by
  ext <;> simp

/-- Its fixed locus is exactly the codimension-two set `d = X = 0`. -/
theorem n2Flip_fixed_iff (a : N2Data) :
    n2Flip a = a ↔ a.d = 0 ∧ a.X = 0 := by
  constructor
  · intro h
    have hd : -a.d = a.d := congrArg N2Data.d h
    have hX : -a.X = a.X := congrArg N2Data.X h
    constructor <;> linarith
  · rintro ⟨hd, hX⟩
    ext <;> simp [n2Flip, hd, hX]

end QuantumTree
