import Mathlib.Data.Nat.Choose.Basic

/-!
# Pair-count rigidity

The full-space argument counts one coefficient for each unordered spectral pair.
This file proves the exact arithmetic squeeze: if `r ≤ n` and the `r`-point set has
at least as many unordered pairs as the `n`-point set, then `r = n` (for `n ≥ 2`).
-/

namespace QuantumTree

/-- Twice the number of unordered pairs from an `n`-element set.  The factor two
avoids division in the monotonicity argument. -/
def twicePairCount (n : ℕ) : ℕ := n * (n - 1)

/-- The scaled pair count is rigid under the natural support bound. -/
theorem eq_of_twicePairCount_le {r n : ℕ} (hn : 2 ≤ n) (hrn : r ≤ n)
    (hcount : twicePairCount n ≤ twicePairCount r) : r = n := by
  apply Nat.le_antisymm hrn
  by_contra hnr
  have hrlt : r < n := Nat.lt_of_not_ge hnr
  have hsub : r - 1 ≤ n - 1 := Nat.sub_le_sub_right hrn 1
  have hfirst : r * (r - 1) ≤ r * (n - 1) := Nat.mul_le_mul_left r hsub
  have hnsub : 0 < n - 1 :=
    Nat.sub_pos_of_lt (lt_of_lt_of_le (by decide : 1 < 2) hn)
  have hsecond : r * (n - 1) < n * (n - 1) :=
    Nat.mul_lt_mul_of_pos_right hrlt hnsub
  have hstrict : twicePairCount r < twicePairCount n := by
    exact lt_of_le_of_lt hfirst hsecond
  exact (Nat.not_lt_of_ge hcount) hstrict

/-- From one point onward, the triangular number `Nat.choose n 2` increases
strictly at every successor. -/
theorem choose_two_strict_succ {n : ℕ} (hn : 1 ≤ n) :
    Nat.choose n 2 < Nat.choose (n + 1) 2 := by
  rw [Nat.choose_succ_succ', Nat.choose_one_right]
  exact Nat.lt_add_of_pos_left (lt_of_lt_of_le Nat.zero_lt_one hn)

/-- Exact triangular-number formulation of the support-cardinality squeeze. -/
theorem eq_of_choose_two_le {r n : ℕ} (hn : 2 ≤ n) (hrn : r ≤ n)
    (hcount : Nat.choose n 2 ≤ Nat.choose r 2) : r = n := by
  apply Nat.le_antisymm hrn
  by_contra hnr
  have hrlt : r < n := Nat.lt_of_not_ge hnr
  have hrpred : r ≤ n - 1 := Nat.le_pred_of_lt hrlt
  have hmono : Nat.choose r 2 ≤ Nat.choose (n - 1) 2 :=
    Nat.choose_le_choose 2 hrpred
  have hpredPos : 1 ≤ n - 1 := by
    simpa using Nat.sub_le_sub_right hn 1
  have hstep : Nat.choose (n - 1) 2 < Nat.choose (n - 1 + 1) 2 :=
    choose_two_strict_succ hpredPos
  have hone : 1 ≤ n := le_trans (by decide : 1 ≤ 2) hn
  have hnrepr : n - 1 + 1 = n := Nat.sub_add_cancel hone
  rw [hnrepr] at hstep
  have hstrict : Nat.choose r 2 < Nat.choose n 2 :=
    lt_of_le_of_lt hmono hstep
  exact (Nat.not_lt_of_ge hcount) hstrict

end QuantumTree
