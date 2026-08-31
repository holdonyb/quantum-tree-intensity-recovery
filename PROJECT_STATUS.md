# Project status

## Objective

Package the frozen tree-extension theorem, its adversarial audits, and a reproducible
Lean verification layer for publication-oriented development.

## Current state

- Frozen written proof SHA-256:
  `A51C2A4A2A048050458CA4E18002BE52B9E99D87973F90238DB66F1A1E64D174`.
- Independent proof-joint audit: passed on the frozen hash.
- Independent theorem-statement/quantifier audit: passed on the frozen hash.
- Lean 4.31 / Mathlib v4.31 native `lake build`: passed (2364 jobs).
- Lean trust boundary: selected kernels plus exact matrix-exponential movie symmetry;
  the remaining human-checked layers are listed in `artifacts/FORMAL_VERIFICATION.md`.
- Placeholder/custom-axiom source scan: clean.
- Principal-theorem axiom audit: only `propext`, `Quot.sound`, and
  `Classical.choice`.
- GitHub target: `holdonyb/quantum-tree-intensity-recovery` (private by default).

## Validation

Run from the repository root:

```text
cd lean
lake build
lake env lean AxiomAudit.lean
```

The CI additionally rejects `sorry`, `admit`, and project `axiom` declarations and
checks the frozen proof hash.

## Remaining publication work

1. Formalize the analytic Fourier/Prony extraction layer.
2. Formalize the inverse spectral reconstruction layer.
3. Formalize semialgebraic genericity/nonemptiness and the finite-jet stability layer.
4. Perform a separate date-bounded literature review before making a priority claim.
