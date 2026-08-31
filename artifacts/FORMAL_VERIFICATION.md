# Formal verification map

## Meaning of a green Lean build

A successful `lake build` means that every theorem exported by the modules under
`lean/QuantumTree/` has been checked by the Lean 4 kernel against Mathlib v4.31.0.
The source contains no `sorry`, `admit`, or project-defined `axiom` declaration.
`lean/AxiomAudit.lean` prints the transitive axiom dependencies of the principal
theorems; only standard Lean/Mathlib foundations are accepted.

## Kernel-checked scope

The checked modules cover:

1. propagation of equality along a connected edge relation;
2. signed phase propagation after a bipartite signing;
3. the direct/reflected orientation dichotomy under the explicit mixed-distance
   exclusion hypothesis;
4. algebraic properties of the bipartite matrix/state involution;
5. entrywise conjugation of matrix exponentials and the exact trajectory identity
   \(e^{-it(-SHS)}S\bar u=S\overline{e^{-itH}u}\), hence equality of every labeled
   coordinate intensity for every real time;
6. the exact \(\binom n2\) support-count squeeze in the arbitrary-competitor argument;
7. the two-vertex algebraic involution and its fixed locus.

Principal checked theorems are:

- `QuantumTree.correctedPhase_constant`;
- `QuantumTree.eq_of_choose_two_le`;
- `QuantumTree.Turnpike.orientedPoints_direct_or_reflected_of_mixed_distance_exclusion`;
- `QuantumTree.bipartiteMatrix_involution` and
  `QuantumTree.bipartiteState_involution`;
- `QuantumTree.intensity_movie_bipartite_invariant`;
- `QuantumTree.n2Flip_involutive` and `QuantumTree.n2Flip_fixed_iff`.

Their transitive axiom dependencies are enumerated in `lean/AxiomAudit.lean`.
The captured successful local output is stored in `artifacts/LEAN_AXIOM_AUDIT.txt`.

## Human-checked scope

The present Lean layer does not formalize:

- exact extraction of spectral gaps and Fourier coefficients from equality on a
  nonempty open time interval;
- the Prony/Vandermonde reconstruction and unlabeled spectral matching arguments;
- Jacobi/tree inverse spectral reconstruction;
- the explicit semialgebraic/Zariski exceptional set and its nonemptiness;
- the inverse-function theorem and compact noisy least-squares stability estimate.

Those steps are contained in the frozen manuscript and have passed the included human
audits, but that evidence is categorically different from Lean kernel checking.

## No overclaim policy

This repository may be described as a machine-checked formalization of selected proof
kernels.  It must not be described as a full formal proof of the tree recovery theorem
until every item in the human-checked scope has been replaced by a checked Lean theorem.
