# Clause map — `thm-tree-quantum-movie@1`

Audited proof SHA-256: `A51C2A4A2A048050458CA4E18002BE52B9E99D87973F90238DB66F1A1E64D174`.

Line references headed **Contract** point to `THEOREM_TREE_EXTENSION.md`; references headed **Proof** point to `outputs/TREE_EXTENSION_PROOF_V1.md`.

| ID | Separate frozen contract | Embedded Frozen theorem statement | Proof / scope location | Audit result |
|---|---|---|---|---|
| D1 | Contract 3: identity `thm-tree-quantum-movie@1` | Proof 1, 78: same identity | Proof 787-792 distinguishes proof and independent audits | exact |
| D2 | Contract 5: every finite connected labeled tree, `V={1,...,n}`, `n>=3` | Proof 5-6: same domain and universal `any` | Sections 0-7 keep fixed arbitrary `G`; Section 6 is per fixed tree | exact |
| D3 | Contract 8-10: `H=Delta_G+diag(q)`, real `q`, `0!=u in C^n` | Proof 8-11: same | Proof 82-95 verifies transformed admissibility; 110-154 uses a real eigenbasis and complex state | exact |
| D4 | Contract 12-17: every fixed nonempty open interval `I`, ordered labeled population movie | Proof 13-18: one fixed nonempty open `I`, same labeled movie | Proof 151-154 gives open-interval analytic uniqueness; 534-539 chooses two jet times in arbitrary such `I` | exact |
| D5 | Contract 19-23: only continuous gauge is `H+cI`, `e^{i theta}u` | Proof 20-24: continuous gauge is exactly the same | Proof 281-290 closes the same-orientation branch to precisely that gauge; proof 431-439 verifies saturation | exact; no extra continuous gauge |
| D6 | Contract 25-29: either bipartition signature, `T_G`, and `S_G -> -S_G` changes only global phase | Proof 26-36: same `S_G`, `T_G`, and choice-independence statement | Proof 82-106 verifies admissibility, movie invariance, choice-independence, and involution | exact; transformed gauge class is choice-independent |
| U1 | Contract 31-33: increasing eigenvalues; simple spectrum; all positive gaps pairwise distinct | Proof 38-42: same | Proof 127-149 and 364-382 | exact |
| U2 | Contract 34: `d_ab+d_cd=L` only for the canonical endpoint split, in either pair order | Proof 43-45: same condition expressed as equality of unordered pair sets | Proof 200-241 and 364-382 | exact algebraic reformulation |
| U3 | Contract 35-38: interior mixed-orientation exclusion for all `k<l` and every `a<b` | Proof 46-49: identical quantifiers and inequality | Proof 217-241 and 364-382 | exact |
| U4 | Contract 39: source Krylov determinant nonzero | Proof 50: identical | Proof 117-132, 414-420, 521-524 | exact |
| U5 | Contract 40: every labeled vertex Krylov determinant nonzero | Proof 51-52: every labeled vertex | Proof 126-132 and 384-420 | exact; labels retained |
| U6 | Contract 41-44: diagonal nonconstant via a sum-of-squares inequality | Proof 53: diagonal nonconstant | Proof 325-336 and 414-420 | exact over real diagonal entries |
| T1 | Contract 48-50: for every fixed `G,I`, `U_G` is nonempty semialgebraic open dense in the real parameter space and is the gauge-saturated lift of a trace-normalized slice | Proof 55: nonempty semialgebraic open dense, gauge-saturated set | Proof 338-420 proves nonempty/open/dense; 422-439 proves semialgebraicity, gauge saturation, and trace-slice lifting; real/complex-as-real parameter coordinates are explicit at 344-347 and 416-419 | exact; embedded compression does not change the ambient real parameter space |
| T2 | Contract 51-55: for every source in `U_G`, fiber is taken against every real-diagonal/nonzero-complex-state competitor, including competitors outside `U_G`, and equals the two displayed gauge classes | Proof 55-63: every source in `U_G`, competitors over the entire admissible parameter space, same two classes | Proof 156-189 begins with an arbitrary competitor and derives nondegeneracy; 191-323 exhausts both spectral orientations and explicitly closes against all competitors | exact source-generic / competitor-arbitrary semantics |
| T3 | Contract 56: the two gauge classes are distinct on `U_G` | Proof 65: same | Proof 325-336 uses condition U6 | exact |
| T4 | Contract 57: finite exact reconstruction by two-time finite-jet Prony extraction, finite turnpike enumeration, row-Gram factorization, edge-sign propagation; output exactly two classes | Proof 65-66: finite exact two-time-jet reconstruction | Proof 526-587 (finite two-time jet/Prony), 589-593 (finite turnpike), 595-618 (row Gram), 619-638 (edge phase/sign propagation and exact two outputs), 639-640 (finite exact operations) | exact; embedded summary is expanded without changing scope |
| B1 | Contract 59: unique `n=2` tree, every fiber one `T_G` orbit | Proof 67-69: same classification | Proof 642-684 covers arbitrary real `d` and every nonzero complex state | exact |
| B2 | Contract 59: singleton iff `d=0` and `X=0` | Proof 68-69: identical criterion | Proof 665-670 covers nonconstant movies including `d=0`; 672-675 covers constant movies; 684-687 proves the iff criterion | exact; no missing constant-movie case |
| B3 | Contract 59 has no nonzero-coordinate hypothesis | Embedded statement has none | Proof 651-670 uses Bloch variables and `X^2+Y^2+Z^2=N^2`; this remains valid when either coordinate vanishes. The only exclusion is `u=0`, already frozen | exact; zero-coordinate states remain included |
| L1 | Contract 61: no graph automorphism quotient; labeled outputs | Proof 65-67: identical | Row-by-row coefficients and reconstruction retain every labeled vertex at proof 134-149, 567-572, 595-638 | exact |
| S1 | No stability clause occurs in theorem v1 | Proof 71-78: heading and prose explicitly say the stability result is an additional corollary and is not part of theorem v1 | Proof Section 9, 689-783; Conclusion 787-790 again separates Sections 0-8 from Section 9 | clean separation; no theorem strengthening |
| S2 | N/A: added corollary | Proof 73-74: local Lipschitz on the explicit Section 9 finite-jet norm | Proof 691-715 defines the finite jet and quotient metrics after trace normalization; 717-749 states/proves the local chart result | scope explicit; finite jet only |
| S3 | N/A: added corollary | Proof 74-77: uniform Lipschitz for every compact `T_G`-saturated `K` in the trace-normalized `U_G`, with (9.6) | Proof 751-778 repeats exactly these quantifiers, gives `d_T`, least-squares existence, and the same finite-jet noise norm | exact; compact and saturation hypotheses are explicit |
| S4 | N/A: added corollary | The summary refers only to finite-jet noise | Proof 780-783 permits a `C^L` norm only when it controls the listed derivatives and explicitly makes no `C^0` or `L^infty(I)` Lipschitz claim | no hidden sup-norm strengthening |

## Quantifier closure

The quantifier spine is unchanged:

1. for every finite connected labeled tree `G` with `n>=3`;
2. for every fixed nonempty open interval `I`;
3. `U_G` is nonempty/open/dense/semialgebraic for that fixed labeled tree;
4. for every source `(H,u) in U_G`;
5. for every admissible competitor in the entire real-diagonal/nonzero-complex-state space;
6. the full fiber consists of exactly the two displayed gauge classes;
7. separately, for the unique `n=2` tree, the classification holds for every admissible source, including zero-coordinate and constant-movie cases;
8. separately from theorem v1, local stability is pointwise on the explicit finite jet, while uniform stability quantifies over every compact trace-normalized `T_G`-saturated `K` and uses the same finite-jet noise norm.

No universal/existential exchange, generic/everywhere substitution, representative-dependent gauge choice, or finite/truncated substitute for the exact theorem was found.
