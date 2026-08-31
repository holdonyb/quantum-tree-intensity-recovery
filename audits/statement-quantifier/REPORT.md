# Statement and quantifier re-audit — attempt 2

## Disposition

- Task status: `DONE`
- Branch verdict: `PROVED`
- Audited statement: `thm-tree-quantum-movie@1`
- Audited proof node/version: `target@1`
- Proof SHA-256: `A51C2A4A2A048050458CA4E18002BE52B9E99D87973F90238DB66F1A1E64D174`
- Hash gate: exact match to the sole valid hash in `TASK_CONTRACT.json`
- Open statement/quantifier issues: `0`
- Proof-node status: unchanged (`ACTIVE`; controller-owned)
- Maturity recommendation: this report supplies a fresh successful theorem-statement/quantifier-audit record for the exact hash. It does not alone assign target maturity or authorize overall completion.
- Controller-owned overall `run_status`: unchanged (`RUNNING` unless and until every independent gate closes).

`PROVED` here is the task-contract verdict that the embedded frozen statement and the separate frozen theorem contract have the same mathematical scope. It is not a standalone verdict on every proof inference.

## Key result

Every clause of `THEOREM_TREE_EXTENSION.md` has a semantically exact counterpart in the embedded `Frozen theorem statement` and an identified proof location. The embedded wording compresses a few algebraically equivalent formulations, but introduces no weakened quantifier, added hypothesis, changed gauge/equivalence, unlabeled quotient, generic-competitor restriction, or altered `n=2` boundary.

The new stability material is explicitly labeled `Additional stability corollary (not part of theorem v1)` and remains logically outside the frozen theorem. Its scope is the explicit Euclidean finite-jet norm after trace normalization; compact-uniform control is only on compact `T_G`-saturated subsets; the noisy estimate uses that same finite-jet norm; and the text explicitly disclaims `C^0`/`L^\infty` movie-noise control.

The choice of bipartition signature is independent at the gauge-class level: replacing `S_G` by `-S_G` leaves the transformed Hamiltonian unchanged and multiplies the transformed state by `-1`, an allowed global phase. This is stated in the embedded theorem and repeated in the proof.

## Scope checks

| Check | Result | Exact locations |
|---|---|---|
| Universal finite connected labeled tree, `n>=3` | closed | contract 5, 48; proof 5-6 |
| Fixed nonempty open interval `I` | closed | contract 12, 48; proof 13; finite-jet choice 534-539 |
| Real diagonal potential and nonzero complex source | closed | contract 8-9; proof 8-11 |
| Six-condition `U_G` for each fixed labeled tree | closed | contract 31-44; proof 38-53; genericity 338-439 |
| Source generic, competitor arbitrary | closed | contract 51-55; proof 55-63; arbitrary competitor 156-189 and 322-323 |
| Only scalar-Hamiltonian/global-phase continuous gauge | closed | contract 19-23; proof 20-24; same-orientation closure 281-290 |
| No graph-automorphism quotient; labels retained | closed | contract 61; proof 65-67; rowwise reconstruction 595-638 |
| `S_G` choice independence | closed | contract 25-29; proof 26-36 and 104-106 |
| Exactly two distinct gauge classes on `U_G` | closed | contract 51-56; proof 55-65 and 325-336 |
| Finite exact two-time-jet reconstruction | closed | contract 57; proof 65-66 and Section 7, 526-640 |
| Full `n=2` boundary and singleton criterion | closed | contract 59; proof 67-69 and Section 8, 642-687 |
| Zero-coordinate `n=2` states | covered without exclusion | proof 651-670 uses only the Bloch-sphere identity and `u!=0`; no coordinate-nonzero hypothesis is added |
| Constant `n=2` movies | closed | proof 672-675 |
| Stability separated from theorem v1 | closed | proof 71-78; separate Section 9, 689-783 |
| Local finite-jet stability scope | closed | proof 691-715 and 717-749 |
| Compact-uniform stability and noisy estimate | closed | proof 751-778; `K` is compact and `T_G`-saturated |
| No `C^0` or `L^\infty` strengthening | closed | proof 780-783 |

The full clause-by-clause mapping is in `outputs/CLAUSE_MAP.md`; the issue ledger is in `outputs/ISSUE_LEDGER.md`.

## Confidence limits

This isolated review read only the two declared visible mathematical artifacts. It did not read earlier audits, author reports, witness reports, sibling reports, or controller conclusions. The verdict covers theorem-statement identity, quantifiers, domains, gauge/equivalence, labels, boundary scope, and stability separation; it does not replace proof-joint, blind-rederivation, citation/formalization, or controller integration duties.

## Exact remaining gap

None within this task contract. Any other final-gate obligations remain controller-owned and outside this isolated audit.

## Artifact paths

- `agents/task-tree-statement-audit-v1-attempt2/REPORT.md`
- `agents/task-tree-statement-audit-v1-attempt2/NOTES.md`
- `agents/task-tree-statement-audit-v1-attempt2/outputs/CLAUSE_MAP.md`
- `agents/task-tree-statement-audit-v1-attempt2/outputs/ISSUE_LEDGER.md`
- `agents/task-tree-statement-audit-v1-attempt2/certificates/MANIFEST.json`

## Recommended successor task

Controller final integration for this exact proof hash, subject to all other independent audit and maturity gates.
