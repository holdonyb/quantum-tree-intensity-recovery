# Fresh proof-joint audit: `thm-tree-quantum-movie@1`

## Verdict

- Task status: `DONE`.
- Exact branch verdict: `PROVED`.
- Audited proof node: `target@1`.
- Frozen proof SHA-256: `A51C2A4A2A048050458CA4E18002BE52B9E99D87973F90238DB66F1A1E64D174`.
- Theorem-contract SHA-256: `0C32839BAD40563859E3CF4DBF2AB7128F005B393D29F8A91F7CDD57C66A032C`.
- Mathematical result: the line-by-line joint audit found no open inference defect in Sections 0--8 for the frozen theorem, and the separately stated finite-jet stability corollary in Section 9 also closes.
- Maturity recommendation: fresh `M6` proof-joint evidence for `target@1`, subject to controller integration and the remaining distinct audit roles.
- Controller-owned overall run status remains `RUNNING`; this report does not itself integrate the node or declare overall mathematical completion.

## Isolation certificate

The audit read only `THEOREM_TREE_EXTENSION.md` and `outputs/TREE_EXTENSION_PROOF_V1.md`, after reading the attempt-2 contract. Attempt-1 audits, author reports, witness/falsification reports, sibling reports, controller notes, and positive-search metadata were not read. No affirmative conclusion was assumed and no prior candidate verdict was treated as authoritative.

## Logical scope certificate

The frozen theorem `thm-tree-quantum-movie@1` is exactly the theorem in Sections 0--8. Section 9 is headed and introduced as an **additional stability corollary not part of theorem v1**, and the conclusion preserves that separation. Stability therefore supplies no hidden strengthening of the frozen theorem contract, while still being independently audited below.

## Joint-by-joint certificate

### J0. Bipartition signature, admissibility, and involution

For every tree edge, `H_jk=-1` and `s_js_k=-1`, so `(-SHS)_jk=-1`. Its diagonal is `-deg(j)-q_j=deg(j)+q'_j` with `q'_j=-q_j-2deg(j)`, hence the transformed Hamiltonian stays in the admissible fixed-edge family. Reality of `H` gives

`exp(-it(-SHS))S conjugate(u) = S conjugate(exp(-itH)u)`,

so every labeled population is unchanged. Replacing `S` by `-S` leaves `-SHS` unchanged and multiplies the transformed state by `-1`, a permitted global phase. Thus the displayed gauge class is independent of the choice of `S_G`. Applying the transformation twice returns `(H,u)`, and it is well-defined on scalar/global-phase gauge classes.

Verdict: closed.

### J1. Krylov factors and source frequency support

With `R_ja=v_ja alpha_a`, the Krylov determinants factor into the eigenvector determinant, the product of the spectral coordinates, and the Vandermonde. Conditions 1, 4, and 5 therefore imply `alpha_a`, `v_ja`, and `R_ja` are all nonzero. The coefficient at positive frequency `d_ab` is exactly `R_ja conjugate(R_jb)`, hence nonzero in every labeled row. Pairwise distinct gaps give exactly `binom(n,2)` positive frequencies.

Verdict: closed.

### J2. Maximal-frequency transfer to an arbitrary competitor

Let the competitor have `r` active distinct eigenvalues. Its positive support has at most `binom(r,2)` elements, while equality with every source row forces all `m=binom(n,2)` source frequencies to occur. Thus

`m <= #competitor differences <= binom(r,2) <= binom(n,2)=m`.

Every inequality is equality: `r=n`, all eigenspaces are one-dimensional and active, and every competitor pair difference is distinct. Since its `m` differences contain the source's `m` differences, the two full difference sets agree. Unique-frequency coefficient equality with the everywhere-nonzero source coefficients then forces every competitor `R_tilde(j,p)` and every competitor eigenvector coordinate to be nonzero. No simplicity, cyclicity, or genericity of the competitor was assumed; all were derived.

Verdict: closed for every admissible full-space competitor, including initially repeated-spectrum or inactive candidates.

### J3. Turnpike complement injection and mixed-orientation exclusion

After endpoint normalization, each competitor interior point `y` has endpoint distances `y` and `L-y`. Condition 2 forces this unordered pair to be exactly `{x_k,L-x_k}` for a unique source interior index. Two competitor points cannot use both members of the same pair, because this would repeat their endpoint distances, contrary to J2. There are `n-2` points and `n-2` distinct complement pairs, so exactly one member of every pair is selected.

If two selected members have opposite orientations, the competitor contains `x_k` and `L-x_l` for distinct interior indices. Equality would collapse two competitor points; otherwise their distance is `|lambda_k+lambda_l-lambda_1-lambda_n|`, which must be a source gap and is forbidden by condition 3. Hence all choices have one orientation: translation of the source spectrum or translation of its reflection. For `n=3`, the single complement pair makes the conclusion immediate and condition 3 is not needed.

The exact small-parameter search in `certificates/FINITE_CHECKS.md` found no contrary object among 370 integer sources satisfying conditions 1--3.

Verdict: closed.

### J4. Complex row-Gram rigidity, direct branch, and reflected branch

For nonzero row vectors, equality of all off-diagonal Gram products gives ratios `rho_a` satisfying `rho_a conjugate(rho_b)=1`. Three distinct indices force all ratios to be one common unit complex number. This is exactly where `n>=3` is used.

In the direct spectral orientation, rowwise rigidity gives `R_tilde=DR` for diagonal unitary `D`. Similarity then gives `H_tilde=DHD^{-1}+cI`. Equality of every fixed tree edge to `-1` forces `d_j/d_k=1`; connectivity makes `D` scalar, and `u_tilde=R_tilde 1` gives only global phase.

In the reflected orientation, the positive-frequency coefficient for competitor columns `a<b` is the source coefficient `R_jB conjugate(R_jA)` with `B=n+1-b<A=n+1-a`. This is the off-diagonal Gram coefficient of `conjugate(R_j)J`, so `R_tilde=D conjugate(R)J`. The reversed spectrum yields `H_tilde=cI-DHD^{-1}`. Fixed edge signs now force `d_j/d_k=-1`; connectivity gives `D=e^{i theta}S_G`, and `u_tilde=e^{i theta}S_G conjugate(u)`.

Verdict: both signs and spectral orientations close exactly, with labeled vertices preserved.

### J5. Distinctness of the two classes

Gauge equivalence of the direct and reflected Hamiltonians would require `-SHS=H+cI`. On the diagonal this says `-h_j=h_j+c` for every vertex, so all `h_j` are equal, contradicting condition 6. The classes are therefore distinct on `U_G`.

Verdict: closed.

### J6. Generic set `U_G`

1. **Spectral locus.** For `H(M xi)=M diag(xi)+A` with distinct `xi`, eigenvectors converge to coordinate vectors and the Hellmann--Feynman eigenvalue Jacobian converges to a permutation matrix. Hence the characteristic-coefficient map has nonzero Jacobian somewhere and is dominant. Every noncanonical failure of conditions 1--3 is a proper linear hyperplane in ordered eigenvalue space. Multiplying all coordinate permutations makes a nonzero symmetric polynomial, whose pullback is a nonzero polynomial in the diagonal entries. Its nonvanishing locus is open dense.
2. **All vertex Krylov factors.** Rooted-tree induction makes any fixed root cyclic: shift the child-component spectra apart, reattach the root, and observe that an eigenvector vanishing at the root could occupy at most one branch, whose attachment coordinate would then vanish and contradict child-root cyclicity. A repeated eigenspace would contain a vector vanishing at the root, so the total spectrum is simple. Thus each `K_j` is a genuinely nonzero polynomial, and their finite product has a simultaneous open dense nonvanishing locus.
3. **State cyclicity and density.** At a diagonal choice with all `K_j!=0`, the state polynomial `K_u` is nonzero because `K_u(h,e_j)=K_j(h)`. Combining the nonzero polynomials for spectral conditions, all vertex factors, state cyclicity, and diagonal spread proves simultaneous nonemptiness and density in the full `(h,u)` space.
4. **Semialgebraicity and gauge saturation.** The ordered eigenvalue graph and all strict polynomial inequalities are semialgebraic; projection preserves semialgebraicity. A scalar Hamiltonian shift changes the Krylov columns by a unit triangular binomial transformation, and a state phase multiplies the determinant by a nonzero phase. Gap and diagonal-difference conditions are invariant. The trace-slice lifting statement follows from the direct-sum decomposition by the all-ones diagonal direction.

Verdict: nonempty, semialgebraic, open, dense, and gauge-saturated all close.

### J6.4. Explicit witness, coefficient templates, and `R>18||A||` bound

For `L(epsilon)=diag(x)+epsilon A`, normalize the eigenvector born at `x_k` by its `k` coordinate. At a vertex `j` at tree distance `d`, lower coefficients vanish. At order `d`, only the unique predecessor on the tree path contributes, giving exactly

`(-1)^d product_path(A_edge) / product_path(x_vertex-x_k)`.

All denominators and edge factors are nonzero. The eigenvalue correction starts at order two because `A_kk=0`, so it cannot alter this leading term. Finiteness of `(j,k)` gives simultaneous nonvanishing for sufficiently small nonzero `epsilon=1/R`, hence every `K_j(H_R)` is nonzero for all sufficiently large `R`.

For the templates in (6.5):

- `C1=0` would make the two ordered endpoint pairs identical, which is excluded.
- For `C2=0`, multiset comparison forces one positive endpoint to be `n`; cancellation then forces the other pair to be `(1,k)`, so the only zeros are the deleted canonical endpoint splits, in either order.
- For sign `+` in `C3`, the positive multiset has no index `1` while the negative multiset does; for sign `-`, the positive multiset has no index `n` while the negative multiset does. Thus `C3` never vanishes.

Every retained vector has coordinate sum zero, maximum coefficient magnitude at most two, and `l1` norm at most six. Under any coordinate permutation, let `j>=2` be its highest nonzero base-four digit. Highest-place domination gives

`|sum c_r 4^(r-1)| >= 4^(j-1)-2 sum_{r<j}4^(r-1) = (4^(j-1)+2)/3 > 1`,

so `|c dot x|>1/3`. Weyl moves each ordered eigenvalue by at most `beta=||A||_2`; the linear form therefore moves by at most `6 beta`. Hence `|c dot lambda(H_R)| >= R/3-6 beta>0` for `R>18 beta`, uniformly over every root permutation. The symmetric root-norm product is consequently a nonzero polynomial. Taking `u=e_1` makes `K_u=K_1`, and sufficiently large `R` simultaneously closes all witness factors.

The exact template enumeration in `certificates/FINITE_CHECKS.md` agrees for every template with `3<=n<=12`; the preceding symbolic argument supplies arbitrary `n`.

Verdict: closed.

### J7. Two-time finite-jet reconstruction

There are `M=1+2 binom(n,2)` frequencies including zero. Every weight in row 1 is nonzero, including the positive zero-frequency weight. The `M x M` Hankel matrix is `V diag(weights) V^T`, so the `2M` derivatives through order `2M-1` recover the annihilator and its simple roots.

Choose nonzero `t0 in I` and large integer `N` with `t1=t0+t0/N in I`; then `delta=t0/N` and `t0=N delta`. The differential projector uses derivatives only through order `M-1` and returns `c_j,omega exp(i omega t_s)`. Their nonzero two-time ratio is `zeta=exp(i omega delta)`, and multiplication by `zeta^{-N}` recovers the zero-time coefficient exactly. This avoids analytic continuation, logarithms, and phase unwrapping.

Finite turnpike enumeration leaves precisely the two orientations from J3. For each row, formula (7.8) is exactly

`(r_p conjugate(r_b))(r_c conjugate(r_p))/(r_c conjugate(r_b))=|r_p|^2`,

so it recovers the missing Gram diagonal; all denominators are nonzero. Rank-one factorization fixes each row up to phase and yields an invertible stacked matrix. Similarity reconstructs a phase-twisted Hamiltonian. On the rooted tree, `z_k=-z_p B_pk` makes both directed entries of each edge equal `-1`; the no-cycle property makes propagation consistent and labels remain fixed. The two outputs are exactly the direct and reflected gauge classes.

Verdict: finite exact reconstruction closes for every open interval, including intervals not containing zero.

### J8. The `n=2` boundary

Direct differentiation of the Bloch coordinates gives `Z'=2Y` and `Z''=-4(dX+Z)`. If `Z(t)` is nonconstant, its unique positive frequency gives `|d|`; for each sign, the second derivative fixes `X`, producing the two `T_G`-paired points. When `d=0`, the sphere identity gives `X=+-sqrt(N^2-Y^2-Z^2)`. If `Z(t)` is constant, then `Y=0`, `dX+Z=0`, and `X!=0`; the sphere identity again gives precisely two paired choices. The involution acts as `(d,X,Y,Z)->(-d,-X,Y,Z)`. Coalescence requires both `d=0` and `X=0`, and those conditions suffice.

Verdict: closed, independently of the `n>=3` row-Gram argument.

### J9. Separate finite-jet stability corollary

On the trace-zero slice and near any `x0 in U_G`, every denominator and matrix determinant used by the finite reconstruction remains nonzero. Simple Prony roots admit locally fixed analytic labels; turnpike pairing is locally fixed; Gram rows, the stacked similarity, tree phase propagation, and a nonzero source-coordinate phase chart are all real-analytic. Their composition is a local real-analytic left inverse of the finite jet map. A bounded derivative on a smaller closed neighborhood gives (9.4) in the phase-quotient metric.

For compact `T_G`-saturated `K`, pass to the phase-and-`T_G` quotient measured by `d_T`. Finitely many local inverse charts cover it. The closed set of pairs not lying in a common chart is compact and disjoint from the quotient diagonal; finite-jet injectivity gives a positive jet separation there. Combining the local constants with the bounded-diameter/separation estimate gives (9.5). Least-squares existence follows from compactness, and optimality plus the triangle inequality gives the factor two in (9.6). The norm is exactly the listed finite derivative jet; the proof explicitly makes no `C0` or `L-infinity` derivative-control claim.

Verdict: closed as a corollary separate from theorem v1.

## Boundary and quantifier closure

- Universal finite labeled trees with `n>=3`: covered by the unique-path, connectivity, and finite-template arguments.
- `n=3`: row-Gram rigidity still has three indices; condition 3 is vacuous and the single complement pair closes turnpike orientation.
- `n=2`: covered separately in J8.
- Arbitrary nonempty open `I`: the two nonzero times can always be chosen inside `I` and need not straddle or include zero.
- Arbitrary full-space competitor: degeneracy is eliminated in J2 rather than assumed away.
- Both spectral orientations: separately checked in J4, including conjugation signs.
- Fixed edge weights and labeled outputs: enforced by the edge-ratio propagation; no automorphism quotient is introduced.
- Gauge: scalar Hamiltonian and global phase only; the `S_G` choice is gauge-independent.
- Stability: exact finite-jet norm only; compact uniformization stays inside `U_G` and no claim is made as margins approach its boundary.

## Issues and confidence limits

No blocking or nonblocking mathematical issue was found in the authorized frozen inputs. The finite scripts are falsification aids, not proof of universal quantifiers. This audit supplies proof-joint evidence only; it supplies no author-independent statement/quantifier-audit verdict, citation M7 credit, formalization credit, or controller integration authority.

## Exact remaining obligation and successor

The current proof-joint task has no remaining mathematical gap at proof hash `A51C2A4...D174`. The recommended successor is the distinct theorem-statement and quantifier audit required by the contract, followed by controller integration if all remaining roster duties close.
