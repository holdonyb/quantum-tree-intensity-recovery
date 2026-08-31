import QuantumTree

/-!
# Trusted-kernel audit

The commands below print every transitive axiom dependency of the principal
checked theorems.  The expected output is limited to standard Lean/Mathlib
foundations such as `propext`, `Quot.sound`, and `Classical.choice`; the project
declares no custom axioms.
-/

#print axioms QuantumTree.correctedPhase_constant
#print axioms QuantumTree.eq_of_choose_two_le
#print axioms QuantumTree.Turnpike.orientedPoints_direct_or_reflected_of_mixed_distance_exclusion
#print axioms QuantumTree.bipartiteMatrix_involution
#print axioms QuantumTree.bipartiteState_involution
#print axioms QuantumTree.intensity_movie_bipartite_invariant
#print axioms QuantumTree.n2Flip_involutive
#print axioms QuantumTree.n2Flip_fixed_iff
