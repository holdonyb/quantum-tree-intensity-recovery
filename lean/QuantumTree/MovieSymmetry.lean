import QuantumTree.Bipartite
import Mathlib.Analysis.Normed.Algebra.MatrixExponential

/-!
# Matrix-exponential kernel for the movie symmetry

This module moves the bipartite ambiguity from coordinate algebra to matrix
exponentials.  It proves that entrywise complex conjugation commutes with the
matrix exponential and that exponential conjugation by a diagonal sign matrix is
exact.  These are the analytic-algebraic identities used in the movie invariance
calculation; no inverse-problem reconstruction statement is asserted here.
-/

namespace QuantumTree

open Complex NormedSpace
open scoped Matrix

universe u

variable {ι : Type u} [Fintype ι] [DecidableEq ι]

/-- Entrywise complex conjugation of a matrix. -/
def entryConjMatrix (A : Matrix ι ι ℂ) : Matrix ι ι ℂ :=
  A.map (starRingEnd ℂ)

/-- Entrywise complex conjugation commutes with the matrix exponential. -/
theorem entryConjMatrix_exp (A : Matrix ι ι ℂ) :
    entryConjMatrix (exp A) = exp (entryConjMatrix A) := by
  calc
    entryConjMatrix (exp A) = (Matrix.conjTranspose (exp A)).transpose := by
      ext i j
      simp [entryConjMatrix, Matrix.conjTranspose_apply]
    _ = (exp (Matrix.conjTranspose A)).transpose := by
      rw [Matrix.exp_conjTranspose]
    _ = exp ((Matrix.conjTranspose A).transpose) := by
      rw [Matrix.exp_transpose]
    _ = exp (entryConjMatrix A) := by congr 1

/-- The diagonal matrix associated with a complex sign vector. -/
def signMatrix (s : ι → ℂ) : Matrix ι ι ℂ :=
  Matrix.diagonal s

/-- A diagonal sign matrix is its own inverse. -/
def signUnit (s : ι → ℂ) (hsquare : ∀ i, s i * s i = 1) :
    (Matrix ι ι ℂ)ˣ where
  val := signMatrix s
  inv := signMatrix s
  val_inv := by
    ext i j
    by_cases hij : i = j
    · subst j
      simp [signMatrix, hsquare]
    · simp [signMatrix, hij]
  inv_val := by
    ext i j
    by_cases hij : i = j
    · subst j
      simp [signMatrix, hsquare]
    · simp [signMatrix, hij]

/-- Exact exponential conjugation by a diagonal sign matrix. -/
theorem exp_sign_conj (s : ι → ℂ) (A : Matrix ι ι ℂ)
    (hsquare : ∀ i, s i * s i = 1) :
    exp (signMatrix s * A * signMatrix s) =
      signMatrix s * exp A * signMatrix s := by
  simpa [signUnit] using Matrix.exp_units_conj (signUnit s hsquare) A

/-- The entrywise definition of the bipartite matrix transform is sign conjugation. -/
theorem bipartiteMatrix_eq_neg_sign_conj (s : ι → ℂ) (H : Matrix ι ι ℂ) :
    bipartiteMatrix s H = -(signMatrix s * H * signMatrix s) := by
  ext i j
  simp [bipartiteMatrix, signMatrix]

/-- Entrywise complex conjugation of a state vector. -/
def entryConjVector (u : ι → ℂ) : ι → ℂ :=
  fun i => (starRingEnd ℂ) (u i)

/-- Entrywise conjugation intertwines matrix-vector multiplication. -/
theorem entryConjMatrix_mulVec (A : Matrix ι ι ℂ) (u : ι → ℂ) :
    entryConjMatrix A *ᵥ entryConjVector u = entryConjVector (A *ᵥ u) := by
  funext i
  change (A.map (starRingEnd ℂ) *ᵥ ((starRingEnd ℂ) ∘ u)) i =
    (starRingEnd ℂ) ((A *ᵥ u) i)
  exact (RingHom.map_mulVec (starRingEnd ℂ) A u i).symm

/-- A diagonal sign matrix acts by coordinatewise multiplication. -/
theorem signMatrix_mulVec (s u : ι → ℂ) :
    signMatrix s *ᵥ u = fun i => s i * u i := by
  funext i
  classical
  simp only [signMatrix, Matrix.mulVec, dotProduct]
  rw [Finset.sum_eq_single i]
  · simp
  · intro j _ hji
    rw [Matrix.diagonal_apply_ne' s hji]
    simp
  · simp

/-- Acting twice by a sign matrix is the identity. -/
theorem signMatrix_mulVec_involution (s u : ι → ℂ)
    (hsquare : ∀ i, s i * s i = 1) :
    signMatrix s *ᵥ (signMatrix s *ᵥ u) = u := by
  funext i
  rw [signMatrix_mulVec, signMatrix_mulVec]
  calc
    s i * (s i * u i) = (s i * s i) * u i := by ring
    _ = u i := by rw [hsquare i, one_mul]

/-- The coordinate definition of the transformed state is diagonal-sign action. -/
theorem bipartiteState_eq_signMatrix_mulVec (s u : ι → ℂ) :
    bipartiteState s u = signMatrix s *ᵥ entryConjVector u := by
  funext i
  rw [signMatrix_mulVec]
  rfl

/-- The matrix exponent in Schrödinger evolution. -/
def schrodingerExponent (H : Matrix ι ι ℂ) (t : ℝ) : Matrix ι ι ℂ :=
  (-(Complex.I * (t : ℂ))) • H

/-- The finite-dimensional Schrödinger evolution matrix. -/
noncomputable def evolutionMatrix (H : Matrix ι ι ℂ) (t : ℝ) : Matrix ι ι ℂ :=
  exp (schrodingerExponent H t)

/-- The evolved state. -/
noncomputable def evolve (H : Matrix ι ι ℂ) (u : ι → ℂ) (t : ℝ) : ι → ℂ :=
  evolutionMatrix H t *ᵥ u

/-- Conjugating a real Hamiltonian reverses the sign of the Schrödinger exponent. -/
theorem entryConjMatrix_schrodingerExponent
    (H : Matrix ι ι ℂ) (t : ℝ)
    (hreal : ∀ i j, star (H i j) = H i j) :
    entryConjMatrix (schrodingerExponent H t) =
      (Complex.I * (t : ℂ)) • H := by
  ext i j
  change star ((-(Complex.I * (t : ℂ))) * H i j) =
    (Complex.I * (t : ℂ)) * H i j
  rw [star_mul', hreal i j]
  simp

/-- The reflected Hamiltonian's exponent is sign-conjugate to the time-reversed one. -/
theorem schrodingerExponent_bipartiteMatrix
    (s : ι → ℂ) (H : Matrix ι ι ℂ) (t : ℝ) :
    schrodingerExponent (bipartiteMatrix s H) t =
      signMatrix s * ((Complex.I * (t : ℂ)) • H) * signMatrix s := by
  ext i j
  simp [schrodingerExponent, bipartiteMatrix, signMatrix]
  ring

/-- Exact matrix-level movie symmetry for a real Hamiltonian. -/
theorem evolutionMatrix_bipartiteMatrix
    (s : ι → ℂ) (H : Matrix ι ι ℂ) (t : ℝ)
    (hsquare : ∀ i, s i * s i = 1)
    (hreal : ∀ i j, star (H i j) = H i j) :
    evolutionMatrix (bipartiteMatrix s H) t =
      signMatrix s * entryConjMatrix (evolutionMatrix H t) * signMatrix s := by
  calc
    evolutionMatrix (bipartiteMatrix s H) t =
        exp (signMatrix s * ((Complex.I * (t : ℂ)) • H) * signMatrix s) := by
      rw [evolutionMatrix, schrodingerExponent_bipartiteMatrix]
    _ = signMatrix s * exp ((Complex.I * (t : ℂ)) • H) * signMatrix s :=
      exp_sign_conj s _ hsquare
    _ = signMatrix s * entryConjMatrix (evolutionMatrix H t) * signMatrix s := by
      rw [evolutionMatrix, entryConjMatrix_exp,
        entryConjMatrix_schrodingerExponent H t hreal]

/-- The transformed trajectory is the signed conjugate of the original trajectory. -/
theorem evolve_bipartiteMatrix
    (s : ι → ℂ) (H : Matrix ι ι ℂ) (u : ι → ℂ) (t : ℝ)
    (hsquare : ∀ i, s i * s i = 1)
    (hreal : ∀ i j, star (H i j) = H i j) :
    evolve (bipartiteMatrix s H) (bipartiteState s u) t =
      bipartiteState s (evolve H u t) := by
  calc
    evolve (bipartiteMatrix s H) (bipartiteState s u) t =
        signMatrix s *ᵥ
          (entryConjMatrix (evolutionMatrix H t) *ᵥ
            (signMatrix s *ᵥ bipartiteState s u)) := by
      rw [evolve, evolutionMatrix_bipartiteMatrix s H t hsquare hreal]
      simp [Matrix.mul_assoc]
    _ = signMatrix s *ᵥ
          (entryConjMatrix (evolutionMatrix H t) *ᵥ entryConjVector u) := by
      rw [bipartiteState_eq_signMatrix_mulVec,
        signMatrix_mulVec_involution s (entryConjVector u) hsquare]
    _ = signMatrix s *ᵥ entryConjVector (evolve H u t) := by
      rw [entryConjMatrix_mulVec]
      rfl
    _ = bipartiteState s (evolve H u t) := by
      rw [bipartiteState_eq_signMatrix_mulVec]

/-- Every labeled vertex intensity is invariant for every real time. -/
theorem intensity_movie_bipartite_invariant
    (s : ι → ℂ) (H : Matrix ι ι ℂ) (u : ι → ℂ) (t : ℝ) (i : ι)
    (hsquare : ∀ k, s k * s k = 1)
    (hsreal : ∀ k, star (s k) = s k)
    (hHreal : ∀ k l, star (H k l) = H k l) :
    normSq (evolve (bipartiteMatrix s H) (bipartiteState s u) t i) =
      normSq (evolve H u t i) := by
  rw [evolve_bipartiteMatrix s H u t hsquare hHreal]
  exact bipartiteState_normSq s (evolve H u t) i (hsquare i) (hsreal i)

end QuantumTree
