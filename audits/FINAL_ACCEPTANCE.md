# Final mathematical acceptance

## Frozen artifacts

- Theorem: `thm-tree-quantum-movie@1` in `THEOREM_TREE_EXTENSION.md`.
- Integrated proof and stability corollary: `outputs/TREE_EXTENSION_PROOF_V1.md`.
- Final proof SHA-256: `A51C2A4A2A048050458CA4E18002BE52B9E99D87973F90238DB66F1A1E64D174`.
- Fresh proof-joint audit: `agents/task-tree-proof-joint-audit-v1-attempt2/REPORT.md`, SHA-256 `CA5F847F1E83661314A8D447523ED5338AE3CB2111DA78B99D248FF8E73361C2`.
- Fresh theorem-statement/quantifier audit: `agents/task-tree-statement-audit-v1-attempt2/REPORT.md`, SHA-256 `F2231C94267C892E75F5649A076DE1807D82E5718FADE1C8C4A50A12D808E5E5`.

## Accepted result

For every finite connected labeled tree (G) with (n\ge3) and every fixed nonempty open interval (I), the six-condition set (U_G) in the frozen theorem is nonempty semialgebraic open dense and gauge saturated. For every source in (U_G), with the competitor ranging over the entire admissible parameter space,

\[
\mathcal D_{G,I}^{-1}(\mathcal D_{G,I}(H,u))
=\{[H,u],[-S_GHS_G,S_G\bar u]\}.
\]

The two classes are distinct on (U_G), no vertex automorphism is quotiented, and a finite exact two-time-jet algorithm returns precisely these classes. The (n=2) fiber is globally one (T_G)-orbit and is a singleton exactly at (d=0=X).

Separately, the finite jet in Section 9 has a local real-analytic, locally Lipschitz two-orbit inverse. On every compact (T_G)-saturated (K\subset U_G\cap\{\operatorname{tr}H=0\}), the inverse has a uniform Lipschitz constant and constrained least squares obeys the explicit (2C_K\|\eta\|_2) error bound. No (C^0\) or (L^\infty) movie-noise claim is made.

## Closed proof chain

1. Krylov--Vandermonde identities turn conditions 4--5 into nonvanishing of every spectral state coefficient and every eigenvector coordinate.
2. The unique tree path supplies an explicit nonzero leading eigenvector coordinate for the separated diagonal family.
3. Base-four domination and the finite symmetric root-norm polynomial cut out every bad spectral relation, giving an explicit simultaneous witness and a proper algebraic exceptional set.
4. Maximal source frequency support forces every arbitrary equal-movie competitor into the simple, distinct-gap, fully active regime.
5. Conditions 2--3 reduce finite turnpike to translation or total reflection.
6. Row-Gram rigidity reconstructs the spectral row matrix up to vertex phases; connected tree edges force either a global phase or the unique bipartition signature.
7. The nonconstant diagonal separates the two classes.
8. Two-time differential projectors recover zero-time Fourier coefficients by an integer power, closing exact finite reconstruction on an arbitrary open interval.
9. Every inverse operation is real analytic away from the displayed discriminants, yielding the finite-jet stability corollary.

## Adversarial audit closure

The first statement audit found two exact presentation mismatches and forced a new proof hash. Both were repaired. The proof-joint and statement/quantifier audits were then rerun from scratch on the new hash under isolated visibility; both returned `PROVED`, with zero open issues. See `AUDIT_LOG.md` for the immutable attempt history.

## Why this is exactly the requested strengthening

- It proves the result for every fixed finite labeled tree, not merely paths, stars, generic tree shapes, or bounded sizes.
- Genericity applies only to the source; competitors remain completely arbitrary.
- The unavoidable antiunitary bipartite reflection is classified rather than silently quotiented.
- Stability is a separate rigorous corollary in an explicit finite-jet norm, not an unsupported extrapolation from floating-point experiments or sup-norm data.
