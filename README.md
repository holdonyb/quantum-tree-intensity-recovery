# Joint recovery from quantum intensity movies on trees

This research repository studies recovery of an unknown real diagonal potential and
an unknown nonzero complex initial state from all labeled vertex intensities of the
continuous-time Schrödinger evolution on a finite tree.

The frozen written result proves that, for every finite connected labeled tree with
at least three vertices, an explicit semialgebraic open dense set has exactly two
gauge classes in each movie fiber:

\[
[H,u]\quad\text{and}\quad[-S_G H S_G,\,S_G\overline u],
\]

where \(H=\Delta_G+Q\) and \(S_G\) is a bipartition signature.  It also classifies
the complete two-vertex fiber and gives a separate finite-jet local/compact
Lipschitz stability corollary.

## Verification status

The mathematical manuscript and two independent adversarial audits are frozen in
this repository.  The Lean development checks a deliberately stated collection of
discrete and algebraic proof kernels, including the exact matrix-exponential movie
symmetry, without `sorry`, `admit`, or project-defined axioms.

It is **not** an end-to-end formalization of the full inverse-problem theorem.  In
particular, spectral extraction from an open-interval movie, Prony/Vandermonde
reconstruction, inverse spectral reconstruction, generic-set nonemptiness, and the
inverse-function stability passage remain human-checked parts of the frozen proof.
See [`artifacts/FORMAL_VERIFICATION.md`](artifacts/FORMAL_VERIFICATION.md) for the
exact trust boundary.

The repository makes no priority claim by itself.  Any novelty or publication-priority
statement requires a separate, date-bounded literature review.

## Reproduce

Lean 4.31.0 and Mathlib v4.31.0 are pinned:

```text
cd lean
lake build
lake env lean AxiomAudit.lean
```

To verify the frozen manuscript:

```text
sha256sum --check paper/TREE_EXTENSION_PROOF.sha256
```

## Contents

- `paper/TREE_EXTENSION_PROOF.md` — frozen theorem, reconstruction, and stability proof;
- `audits/` — independent proof-joint and theorem-statement audits;
- `lean/QuantumTree/` — trusted-kernel Lean modules;
- `artifacts/FORMAL_VERIFICATION.md` — theorem-by-theorem formalization map;
- `PROJECT_STATUS.md` — current state and next formalization milestones.
