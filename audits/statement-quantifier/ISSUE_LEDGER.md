# Issue ledger — attempt 2

Audited exact versions:

- theorem statement: `thm-tree-quantum-movie@1`
- proof node: `target@1`
- proof SHA-256: `A51C2A4A2A048050458CA4E18002BE52B9E99D87973F90238DB66F1A1E64D174`

## Counts

- Open issues: `0`
- Closed issues: `0`
- Blocking issues: `0`

No statement, domain, quantifier, gauge, label, `S_G`-choice, `n=2`, reconstruction-scope, or stability-separation mismatch was found. The ledger is intentionally empty; no prior issue list was read or imported.

## Audited non-issues

These wording differences were checked and are not issues:

| Observation | Reason it is semantically exact |
|---|---|
| Embedded U6 says “the diagonal of `H` is nonconstant” instead of repeating the contract's sum of squared diagonal differences | For real diagonal entries, the displayed sum is nonzero exactly when the diagonal is nonconstant. |
| Embedded U2 uses equality of unordered pair sets | This is exactly the contract's “the two pairs ... in either order.” |
| Embedded T1 compresses “subset of the real parameter space” and the trace-slice lifting parenthesis | The ambient real `q` and complex-as-real `u` domain is fixed immediately above; Section 6.3 explicitly proves gauge saturation and trace-slice lifting. |
| Embedded T4 summarizes the four reconstruction stages as “finite exact two-time-jet reconstruction” | Section 7 names and executes all four contract stages and states that exactly the two classes are returned. |
| `S_G` versus `-S_G` changes the transformed representative | The Hamiltonian is unchanged and the state changes by `-1`, which is precisely the frozen global-phase gauge; the class and `d_T` are independent of the choice. |
| Section 9 uses a finite jet larger than the minimal reconstruction data in a few coordinates | Stability is an explicitly separate corollary, and its own jet and Euclidean norm are defined exactly; it does not alter theorem v1 or claim full-movie sup-norm control. |

## Required repair evidence

None.
