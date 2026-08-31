# Integrable proof of thm-tree-quantum-movie@1

## Frozen theorem statement

Let \(G=(V,E)\) be any finite connected labeled tree with
\(V=\{1,\ldots,n\}\), \(n\ge3\). Let

\[
H=\Delta_G+Q,\qquad Q=\operatorname{diag}(q_1,\ldots,q_n)\in
\mathbb R^{n\times n},\qquad 0\ne u\in\mathbb C^n,
\]

and, for one fixed nonempty open interval \(I\subset\mathbb R\), observe

\[
\mathcal D_{G,I}(H,u)=
\left(t\mapsto |(e^{-itH}u)_j|^2\right)_{j=1}^n\big|_I.
\]

The continuous gauge is exactly

\[
(H,u)\sim(H+cI,e^{i\theta}u),\qquad c,\theta\in\mathbb R.
\]

Fix a bipartition signature
\(S_G=\operatorname{diag}(s_1,\ldots,s_n)\), where
\(s_j\in\{\pm1\}\) and \(s_js_k=-1\) on each edge, and define

\[
T_G[H,u]=[-S_GHS_G,S_G\bar u].
\]

Replacing \(S_G\) by \(-S_G\) multiplies the transformed state by the
global phase \(-1\), so the resulting gauge class is independent of the
choice of bipartition signature.

For the increasing eigenvalues \(\lambda_1<\cdots<\lambda_n\), put
\(d_{ab}=\lambda_b-\lambda_a\) and \(L=d_{1n}\). Define \(U_G\) by:

1. the spectrum is simple and all positive \(d_{ab}\) are pairwise
   distinct;
2. \(d_{ab}+d_{cd}=L\) only for the canonical two pairs
   \(\{(a,b),(c,d)\}=\{(1,k),(k,n)\}\),
   \(2\le k\le n-1\);
3. for \(2\le k<l\le n-1\) and every \(a<b\),
   \[
   |\lambda_k+\lambda_l-\lambda_1-\lambda_n|\ne d_{ab};
   \]
4. \(K_u=\det[u,Hu,\ldots,H^{n-1}u]\ne0\);
5. \(K_j=\det[e_j,He_j,\ldots,H^{n-1}e_j]\ne0\) for every labeled
   vertex \(j\);
6. the diagonal of \(H\) is nonconstant.

Then \(U_G\) is a nonempty semialgebraic open dense, gauge-saturated set,
and for every source \((H,u)\in U_G\), with competitors ranging over the
entire admissible parameter space,

\[
\mathcal D_{G,I}^{-1}(\mathcal D_{G,I}(H,u))
=\{[H,u],[-S_GHS_G,S_G\bar u]\}.
\tag{T}
\]

The two classes in (T) are distinct, and the proof supplies a finite exact
two-time-jet reconstruction. No graph automorphism is quotiented; all
outputs remain labeled. For \(n=2\), every fiber is one \(T_G\)-orbit,
and that orbit is a singleton exactly when
\(d=(q_1-q_2)/2=0\) and \(X=2\Re(u_1\bar u_2)=0\).

### Additional stability corollary (not part of theorem v1)

On the explicit finite-jet norm of Section 9, the inverse is locally
Lipschitz at every point of \(U_G\). It is uniformly Lipschitz on every
compact \(T_G\)-saturated subset
\(K\subset U_G\cap\{\operatorname{tr}H=0\}\), with the noisy
least-squares estimate (9.6). This corollary strengthens the paper but is
kept logically separate from the frozen theorem `thm-tree-quantum-movie@1`.

## 0. Conventions and the bipartite involution

Write \(h_j=H_{jj}=\deg(j)+q_j\). Thus \(H_{jk}=-1\) on an
edge and \(H_{jk}=0\) on a nonedge. If \(S=\operatorname{diag}(s_j)\)
is a bipartition signature, then, on an edge,

\[
(-SHS)_{jk}=-s_j(-1)s_k=s_js_k=-1.
\]

Consequently

\[
-SHS=\Delta_G+\operatorname{diag}(q'_j),\qquad
q'_j=-q_j-2\deg(j).                                      \tag{0.1}
\]

In particular the transformed Hamiltonian is admissible. Moreover

\[
e^{-it(-SHS)}S\bar u=S e^{itH}\bar u
                  =S\overline{e^{-itH}u},                \tag{0.2}
\]

so it has exactly the same labeled population movie. Replacing \(S\) by
\(-S\) only multiplies the transformed state by \(-1\), and applying the
transformation twice gives the original pair.

## 1. Spectral notation and the meaning of the Krylov conditions

Let \(v_1,\ldots,v_n\) be a real orthonormal eigenbasis of \(H\), ordered
by \(\lambda_1<\cdots<\lambda_n\), and put

\[
\alpha_a=v_a^Tu,\qquad R_{ja}=v_{ja}\alpha_a.             \tag{1.1}
\]

The Krylov determinant has the factorization

\[
\det[u,Hu,\ldots,H^{n-1}u]
=\det(V)\Bigl(\prod_a\alpha_a\Bigr)
  \prod_{a<b}(\lambda_b-\lambda_a),                       \tag{1.2}
\]

up to the immaterial sign convention for the Vandermonde determinant.
The same formula with \(u=e_j\) replaces \(\alpha_a\) by \(v_{ja}\).
Conditions 1, 4, and 5 therefore imply

\[
\alpha_a\ne0,\qquad v_{ja}\ne0,\qquad R_{ja}\ne0
\quad(1\le j,a\le n).                                    \tag{1.3}
\]

For every labeled row,

\[
p_j(t):=|(e^{-itH}u)_j|^2
=\sum_{a,b}R_{ja}\overline{R_{jb}}
          e^{-it(\lambda_a-\lambda_b)}.                   \tag{1.4}
\]

Hence the coefficient of \(e^{+id_{ab}t}\), \(a<b\), is
\(R_{ja}\overline{R_{jb}}\), which is nonzero for every row. Condition 1
says that the positive frequency support is precisely the
\(m=\binom n2\)-element set

\[
D=\{d_{ab}:a<b\}.                                         \tag{1.5}
\]

Finite exponential sums agreeing on a nonempty open interval agree
identically: subtract them and use the Vandermonde matrix formed by the
first derivatives at one point. We will use coefficient equality without
further comment.

## 2. An arbitrary competitor is forced to be nondegenerate

Let \((\widetilde H,\widetilde u)\) be any admissible competitor with the
same movie; no genericity is assumed. Let
\(\mu_1<\cdots<\mu_r\) be its *active* distinct eigenvalues and

\[
w_p=P_{\mu_p}\widetilde u\ne0                             \tag{2.1}
\]

the corresponding eigenspace projections. Every positive frequency of
the competitor is a difference \(\mu_q-\mu_p\). Since all \(m\) target
frequencies occur with a nonzero coefficient in every row,

\[
m\le \#\{\mu_q-\mu_p:p<q\}
   \le \binom r2\le\binom n2=m.                           \tag{2.2}
\]

All inequalities are equalities. Thus \(r=n\), every eigenspace is
one-dimensional, every eigenvalue is active, and all competitor positive
differences are pairwise distinct. Its full positive difference set is
exactly \(D\).

Write \(\widetilde v_p\) for its real unit eigenvectors,
\(\widetilde\alpha_p=\widetilde v_p^T\widetilde u\ne0\), and
\(\widetilde R_{jp}=\widetilde v_{jp}\widetilde\alpha_p\). Because every
competitor difference now has a unique representing pair, its coefficient
at that frequency is
\(\widetilde R_{jp}\overline{\widetilde R_{jq}}\). It equals a nonzero
target coefficient at every vertex. Hence every \(\widetilde R_{jp}\), and
therefore every \(\widetilde v_{jp}\), is nonzero. In particular the
competitor has simple spectrum, cyclic state, and every labeled vertex is
cyclic. This conclusion was derived rather than assumed.

## 3. The finite turnpike set has only two orientations

Normalize the source spectrum by

\[
x_a=\lambda_a-\lambda_1,\qquad
0=x_1<x_2<\cdots<x_n=L.                                  \tag{3.1}
\]

Normalize the competitor spectrum to
\(0=y_1<\cdots<y_n=L\). For each interior \(y\), the two distances \(y\)
and \(L-y\) belong to \(D\) and sum to \(L\). By condition 2 their unique
source pairs are \((1,k)\) and \((k,n)\) for some interior \(k\). Thus

\[
\{y,L-y\}=\{x_k,L-x_k\}.                                 \tag{3.2}
\]

Different competitor interior points cannot use the same complementary
pair: otherwise the two points would be \(x_k,L-x_k\), making two distinct
competitor endpoint pairs have the same distance, contrary to the already
proved distinctness of all competitor differences. There are \(n-2\)
interior points and \(n-2\) source complementary pairs, so the competitor
chooses exactly one member of every pair
\(\{x_k,L-x_k\}\).

Suppose the choices have mixed orientations. Then for distinct interior
indices \(k,l\), the competitor contains \(x_k\) and \(L-x_l\). If these
coincide, the competitor does not have \(n\) distinct points. Otherwise
their positive distance is

\[
|x_k-(L-x_l)|
=|\lambda_k+\lambda_l-\lambda_1-\lambda_n|,               \tag{3.3}
\]

which must belong to \(D\), in direct contradiction with condition 3.
Thus all choices have the same orientation. Therefore exactly one of

\[
\widetilde\mu_a=\lambda_a+c,                              \tag{3.4}
\]

or

\[
\widetilde\mu_a=c-\lambda_{n+1-a}                         \tag{3.5}
\]

holds. For \(n=3\), there is only one interior complementary pair, so the
same conclusion holds without invoking condition 3.

## 4. Row Gram rigidity and edge-phase propagation

We use the elementary fact that if \(r,z\in(\mathbb C^*)^n\), \(n\ge3\),
and

\[
z_a\bar z_b=r_a\bar r_b\quad(a\ne b),                    \tag{4.1}
\]

then \(z=e^{i\phi}r\). Indeed, with \(\rho_a=z_a/r_a\), one has
\(\rho_a\bar\rho_b=1\) for every \(a\ne b\). Three distinct indices first
show that all \(\rho_a\) are equal, and then that their common modulus is
one.

Let \(J\) reverse the \(n\) spectral columns.

### 4.1 Same spectral orientation

Under (3.4), equality of every positive-frequency row coefficient and
(4.1) give a diagonal unitary \(D=\operatorname{diag}(d_j)\) such that

\[
\widetilde R=DR.                                          \tag{4.2}
\]

Both \(R=V\operatorname{diag}(\alpha)\) and \(\widetilde R\) are
invertible. Since the columns are eigenvectors times nonzero scalars,

\[
\begin{aligned}
\widetilde H
 &=\widetilde R\operatorname{diag}(\widetilde\mu)
                   \widetilde R^{-1}  \\
 &=D R(\Lambda+cI)R^{-1}D^{-1}
  =DHD^{-1}+cI.                                           \tag{4.3}
\end{aligned}
\]

For every edge \(jk\), both off-diagonal entries in (4.3) equal \(-1\),
so \(d_j/d_k=1\). Connectivity gives \(D=e^{i\theta}I\). Finally

\[
\widetilde u=\widetilde R\mathbf1=e^{i\theta}R\mathbf1
             =e^{i\theta}u.                              \tag{4.4}
\]

This is precisely the scalar-Hamiltonian/global-phase gauge class of
\((H,u)\).

### 4.2 Reflected spectral orientation

For \(a<b\), the competitor pair corresponds to source indices
\(B=n+1-b<A=n+1-a\). Its coefficient equals
\(R_{jB}\overline{R_{jA}}\), which is the off-diagonal Gram coefficient
of the row vector \(\overline{R_j}J\). Thus (4.1) gives

\[
\widetilde R=D\bar R J                                   \tag{4.5}
\]

for a diagonal unitary \(D\). Using (3.5), \(J^2=I\), and the reality of
\(H\),

\[
\begin{aligned}
\widetilde H
 &=D\bar R J(cI-J\Lambda J)J\bar R^{-1}D^{-1} \\
 &=cI-DHD^{-1}.                                           \tag{4.6}
\end{aligned}
\]

On an edge, (4.6) reads \(-1=d_j/d_k\). Therefore
\(D=e^{i\theta}S\) for either bipartition signature \(S\), and

\[
(\widetilde H,\widetilde u)
=(cI-SHS,\ e^{i\theta}S\bar u).                           \tag{4.7}
\]

This is exactly the gauge class of \(T_G[H,u]\). Sections 2--4 prove the
fiber assertion against *all* competitors, including degenerate ones.

## 5. The two classes are distinct

If the two displayed pairs were gauge equivalent, their Hamiltonians
would satisfy

\[
-SHS=H+cI.                                                \tag{5.1}
\]

On the diagonal this gives \(-h_j=h_j+c\) for every \(j\), so all \(h_j\)
would be equal. This contradicts condition 6. Hence the two gauge classes
are distinct on \(U_G\).

## 6. Nonemptiness, openness, density, and semialgebraicity

We give all algebraic nonvanishing arguments explicitly.

### 6.1 The spectral conditions are generically attainable

Use the diagonal entries \(h=(h_1,\ldots,h_n)\) as free coordinates;
passing between \(h\) and \(q\) is an affine translation. Let
\(\Phi(h)\) be the coefficient vector of the monic characteristic
polynomial of \(H(h)\). This is a polynomial map.

Choose distinct real numbers \(\xi_1,\ldots,\xi_n\) and put
\(h_j=M\xi_j\). As \(M\to\infty\), diagonal dominance and the elementary
spectral projection formula show that the ordered eigenvectors converge,
after a permutation, to the coordinate vectors. The Hellmann--Feynman
Jacobian is

\[
\frac{\partial\lambda_a}{\partial h_j}=v_{ja}^2,          \tag{6.1}
\]

and therefore converges to a permutation matrix. It is invertible for all
sufficiently large finite \(M\). The eigenvalue map is consequently a
local diffeomorphism at such a point. Equivalently, \(\Phi\) has nonzero
Jacobian somewhere and is a dominant polynomial map.

In the ordered cone \(\lambda_1<\cdots<\lambda_n\), failure of conditions
1--3 is a finite union of proper linear hyperplanes:

* equalities of two distinct positive differences;
* equalities \(d_{ab}+d_{cd}=L\) except the identically complementary
  pairs \((1,k),(k,n)\);
* equalities
  \(\lambda_k+\lambda_l-\lambda_1-\lambda_n=
   \pm(\lambda_b-\lambda_a)\) in condition 3.

None of the retained linear forms is identically zero. Their complement
is therefore open dense and nonempty in every eigenvalue open box. To see
global density back in \(h\)-space without any unstated general-position
step, multiply all permutations of all these nonzero linear forms (and
the ordinary Vandermonde factors). The result is a nonzero symmetric
polynomial \(P(\lambda)\), hence a nonzero polynomial in the characteristic
coefficients. Dominance of \(\Phi\) implies \(P\circ\Phi\) is a nonzero
polynomial. Its nonvanishing locus is an open dense set on which conditions
1--3 hold.

### 6.2 Every vertex Krylov polynomial is genuinely nonzero

For a rooted finite tree \((T,r)\), there exists a choice of diagonal
entries for which \(r\) is cyclic. Prove this by induction on \(|T|\).
For the one-vertex tree it is immediate. Remove \(r\) and regard the
components as rooted at the neighbors \(r_i\). By induction choose their
diagonals so each component Hamiltonian \(H_i\) is simple and \(r_i\) is
cyclic. Add different scalar shifts to the component diagonals so the
spectra of the \(H_i\)'s are pairwise disjoint, and then reattach \(r\).

If an eigenvector \(x\) of the resulting arrowhead matrix had \(x_r=0\),
then

\[
(H_i-\lambda I)x_i=0                                     \tag{6.2}
\]

on every branch. Spectral disjointness permits at most one nonzero
branch. The eigenvalue equation at \(r\) then says that the coordinate of
that branch eigenvector at \(r_i\) is zero, contradicting cyclicity of
\(r_i\). Thus no eigenvector vanishes at \(r\). A repeated eigenspace would
have dimension at least two and hence contain a nonzero vector whose
\(r\)-coordinate vanishes; therefore the whole matrix is simple. Formula
(1.2) now proves \(K_r\ne0\).

It follows that, for each labeled vertex \(j\), the polynomial \(K_j(h)\)
is not the zero polynomial. Since the real polynomial ring is an integral
domain, \(\prod_jK_j(h)\) is also nonzero. Thus there is an open dense set
where *all* labeled vertices are cyclic simultaneously.

Intersect this locus with the spectral locus from 6.1 and with the
complement of the proper algebraic set \(h_1=\cdots=h_n\). The intersection
is open dense and nonempty. For any \(h\) in it, \(K_u(h,u)\) is a nonzero
polynomial in the \(2n\) real state coordinates: for example,
\(K_u(h,e_j)=K_j(h)\ne0\). Its nonvanishing locus in state space is open
dense and nonempty. This proves nonemptiness and density of all six
conditions simultaneously, rather than assuming a generic point.

### 6.3 Semialgebraicity and gauge saturation

The Krylov and diagonal conditions are polynomial inequalities. The
ordered eigenvalue graph is semialgebraic (characteristic equations plus
ordering inequalities), and conditions 1--3 are finite polynomial
inequalities on that graph; projection gives a semialgebraic set in
\(h\)-space. Eigenvalue continuity and strict nonvanishing make the full
set open.

Adding \(cI\) preserves all eigenvalue differences. It also preserves
each Krylov determinant, since
\([u,(H+cI)u,\ldots,(H+cI)^{n-1}u]\) is obtained from the old Krylov matrix
by a unit upper-triangular binomial change of columns. Diagonal differences
are preserved as well. Global state phase only multiplies the Krylov
determinant by a nonzero phase. Thus \(U_G\) is scalar/global-phase gauge
saturated. Decomposing \(h\)-space as a trace-normalized hyperplane plus
\(\mathbb R\mathbf1\) shows that the open dense set is exactly the lift of
an open dense set on the trace-normalized slice.

### 6.4 An explicit simultaneous witness and bad-set polynomial

The preceding polynomial argument already proves density. We now give a
single verifiable point at which all factors are simultaneously nonzero.
Let \(A\) have entries \(-1\) on tree edges and zero elsewhere, set

\[
x_r=\frac{4^{r-1}-1}{3},\qquad
H_R=R\operatorname{diag}(x)+A.                           \tag{6.3}
\]

For \(L(\varepsilon)=\operatorname{diag}(x)+\varepsilon A\), normalize
the analytic eigenvector born at \(x_k\) by making its \(k\)-th
coordinate equal to one. If

\[
k=v_0,v_1,\ldots,v_d=j
\]

is the unique tree path from \(k\) to \(j\), coefficientwise expansion
of the eigenvalue equation gives

\[
v_j^{(k)}(\varepsilon)=
\frac{(-1)^d\prod_{m=1}^d A_{v_m v_{m-1}}}
     {\prod_{m=1}^d(x_{v_m}-x_k)}\,\varepsilon^d
+O(\varepsilon^{d+1}).                                  \tag{6.4}
\]

The displayed coefficient is nonzero. Indeed, induct on the distance
from \(k\): every coefficient below the distance vanishes; at the
distance order exactly one neighbor, the predecessor on the unique path,
can contribute. Also \(\lambda_k(\varepsilon)=x_k+O(\varepsilon^2)\)
because \(A_{kk}=0\), so the eigenvalue correction enters only at higher
order. Finiteness of the pairs \((j,k)\) gives simultaneous nonvanishing
of all eigenvector coordinates for all sufficiently small nonzero
\(\varepsilon\). Since \(R^{-1}H_R=L(1/R)\), all \(K_j(H_R)\ne0\) for
sufficiently large \(R\).

For algebraic bookkeeping define

\[
\begin{aligned}
\mathcal C_1={}&\{e_b-e_a-e_d+e_c:(a,b)\ne(c,d),\ a<b,\ c<d\},\\
\mathcal C_2={}&\{e_b-e_a+e_d-e_c-e_n+e_1:
\{(a,b),(c,d)\}\ne\{(1,k),(k,n)\}\ \forall k\},\\
\mathcal C_3={}&\{e_k+e_l-e_1-e_n+s(e_b-e_a):
2\le k<l\le n-1,\ a<b,\ s\in\{\pm1\}\}.
\end{aligned}                                           \tag{6.5}
\]

In \(\mathcal C_2\) retain \(a<b,c<d\). The only zero coefficient
vector in its unpruned template is a canonical endpoint split, and these
were deleted; the endpoint restrictions likewise make every vector in
\(\mathcal C_1\cup\mathcal C_3\) nonzero. Every remaining vector has
coordinate sum zero, \(|c_r|\le2\), and \(\|c\|_1\le6\).

For each such vector put

\[
\mathcal N_c(h)=\prod_{\sigma\in S_n}
\left(\sum_r c_r\lambda_{\sigma(r)}(h)\right)^2.          \tag{6.6}
\]

This root norm is symmetric, hence an explicitly finite polynomial in
the characteristic coefficients and therefore in \(h\). For every
coordinate permutation, highest-base-four-place domination gives

\[
|c\cdot x|=\frac13\left|\sum_r c_r4^{r-1}\right|>\frac13.
\]

Writing \(\beta=\|A\|_2\), Weyl's inequality yields

\[
|c\cdot\lambda(H_R)|\ge R/3-6\beta>0
\quad\text{for }R>18\beta,                              \tag{6.7}
\]

simultaneously for every root permutation. Thus the characteristic
discriminant times all \(\mathcal N_c\), all \(K_j^2\), \(|K_u|^2\),
and the diagonal-spread factor is one explicit nonzero polynomial.
Taking \(u=e_1\) at a sufficiently large \(R\) makes \(K_u=K_1\ne0\)
and supplies the promised simultaneous witness.

## 7. Finite exact reconstruction

Let

\[
M=1+2\binom n2=n(n-1)+1.                                 \tag{7.1}
\]

Choose a nonzero \(t_0\in I\), and then choose a sufficiently large
positive integer \(N\) so that

\[
t_1=t_0+\delta\in I,\qquad \delta=t_0/N.                 \tag{7.2}
\]

At \(t_0\), use the finite jet \(p_1^{(r)}(t_0)\),
\(0\le r\le2M-1\). If
\(\Omega=\{0\}\cup D\cup(-D)\), then

\[
p_1^{(r)}(t_0)=\sum_{\omega\in\Omega}
 c_{1,\omega}e^{i\omega t_0}(i\omega)^r.                \tag{7.3}
\]

Every weight in (7.3) is nonzero. The \(M\times M\) moment Hankel matrix
factors as a Vandermonde matrix, a nonsingular diagonal weight matrix,
and its transpose, so it is invertible. The usual finite Prony recurrence
therefore recovers the monic annihilating polynomial

\[
A(z)=\prod_{\omega\in\Omega}(z-i\omega).                 \tag{7.4}
\]

Its roots give \(\Omega\), hence \(D\). For every frequency put

\[
\Pi_\omega(D)=
\prod_{\nu\in\Omega,\,\nu\ne\omega}
\frac{D-i\nu}{i\omega-i\nu}.                            \tag{7.5}
\]

For every labeled vertex use the derivatives through order \(M-1\) at
both \(t_0,t_1\). They give, by this finite differential projector,

\[
\Pi_\omega(D)p_j(t_s)=c_{j,\omega}e^{i\omega t_s}.
\]

Every projected value is nonzero. Consequently

\[
\zeta_\omega=
\frac{\Pi_\omega(D)p_j(t_1)}{\Pi_\omega(D)p_j(t_0)}
=e^{i\omega\delta},\qquad
c_{j,\omega}=\Pi_\omega(D)p_j(t_0)\zeta_\omega^{-N}.     \tag{7.6}
\]

The ratio is independent of \(j\), which is also an exact consistency
check. The special choice \(t_0=N\delta\) makes (7.6) use only division
and an integer power; thus it recovers the zero-time Gram coefficients
without an analytic-continuation step or an unstated transcendental
oracle. This is the promised two-time finite-jet Prony extraction.

Next enumerate finitely all \(n\)-point sets containing \(0,L=\max D\)
whose positive difference set is \(D\). Equivalently, after condition 2,
choose one element from each of the \(n-2\) complementary pairs and check
all distances. Section 3 proves that exactly the source set and its
reflection survive.

For either ordered candidate \(a_1<\cdots<a_n\), associate the unique
frequency \(a_q-a_p\) with every \(p<q\) and form, for each row \(j\), the
off-diagonal Hermitian matrix

\[
(G_j)_{pq}=c_{j,a_q-a_p},\quad
(G_j)_{qp}=\overline{(G_j)_{pq}}.                         \tag{7.7}
\]

For three distinct indices \(p,b,c\), recover the diagonal exactly by

\[
(G_j)_{pp}=\frac{(G_j)_{pb}(G_j)_{cp}}{(G_j)_{cb}}.       \tag{7.8}
\]

All denominators are nonzero. The zero-frequency coefficient verifies
\(c_{j,0}=\operatorname{tr}G_j\). Factor the rank-one positive matrix
\(G_j=r_jr_j^*\); this determines \(r_j\) up to a row phase. Stack the rows
to obtain an invertible \(R_0\), and set

\[
B=R_0\operatorname{diag}(a_1,\ldots,a_n)R_0^{-1}.         \tag{7.9}
\]

The remaining row phases are recovered on the tree. Fix a root and set
\(z_{\rm root}=1\). For every oriented tree edge \(p\to k\), propagate

\[
z_k=-z_p B_{pk}.                                         \tag{7.10}
\]

For a valid candidate, the exact checks are: \(B\) vanishes on nonedges,
has real diagonal, \(|B_{pk}|=1\) and \(B_{pk}B_{kp}=1\) on every edge.
Since a tree has no cycle, (7.10) is consistent and unique up to one global
phase. With \(Z=\operatorname{diag}(z_j)\), output

\[
H_0=ZBZ^{-1},\qquad u_0=ZR_0\mathbf1.                   \tag{7.11}
\]

Then every edge entry of \(H_0\) is exactly \(-1\); adding a scalar to all
\(a_j\)'s only changes \(H_0\) by scalar gauge. Row-factor phases cancel
between (7.6)--(7.8). Sections 3 and 4 show that the two candidates return
precisely the classes of \((H,u)\) and \((-SHS,S\bar u)\), and no others.
All steps use finitely many derivatives, polynomial root extraction,
finite enumeration, and exact algebraic matrix operations.

## 8. The \(n=2\) boundary

After removing scalar Hamiltonian gauge, write

\[
H_0=\begin{pmatrix}d&-1\\-1&-d\end{pmatrix},\qquad
d=(q_1-q_2)/2.                                            \tag{8.1}
\]

Modulo global state phase, put

\[
N=|u_1|^2+|u_2|^2,\quad X=2\Re(u_1\bar u_2),\quad
Y=2\Im(u_1\bar u_2),\quad Z=|u_1|^2-|u_2|^2.             \tag{8.2}
\]

They satisfy \(X^2+Y^2+Z^2=N^2\). The labeled movie determines \(N\) and
the analytic function \(Z(t)=p_1(t)-p_2(t)\), and at time zero

\[
Z(0)=Z,\qquad Z'(0)=2Y,\qquad Z''(0)=-4(dX+Z).             \tag{8.3}
\]

If \(Z(t)\) is nonconstant, its unique positive frequency is
\(2\sqrt{1+d^2}\), which determines \(|d|\). For \(d\ne0\), (8.3) then
determines \(X\) for either sign of \(d\); the two solutions are
\((d,X,Y,Z)\) and \((-d,-X,Y,Z)\). For \(d=0\), the movie determines
\(Y,Z\), and the sphere identity gives the two values
\(X=\pm\sqrt{N^2-Y^2-Z^2}\), again with coalescence only when \(X=0\).

If \(Z(t)\) is constant, (8.3) and the equation of motion give
\(Y=0\) and \(dX+Z=0\). Here \(X\ne0\), since otherwise \(Z=0\) and then
\(N=0\). The sphere identity gives exactly the two choices of \(X\), with
\(d=-Z/X\); they again form the same pair.

For \(S=\operatorname{diag}(1,-1)\), the involution acts on these
coordinates by

\[
(d,X,Y,Z)\longmapsto(-d,-X,Y,Z).                          \tag{8.4}
\]

Thus every \(n=2\) fiber is one \(T_G\)-orbit. The two classes coincide
exactly when the Hamiltonians coincide modulo scalar gauge, forcing
\(d=0\), and the rank-one state density matrices coincide, forcing
\(X=-X\), i.e. \(X=0\). This proves the stated singleton criterion.

## 9. Finite-jet noise stability

This section states the norm exactly; it does not identify sup-norm movie
noise with derivative noise. Retain the times \(t_0,t_1\) and integer
\(N\) from Section 7, put \(L=2M-1\), and define

\[
\mathcal J(H,u)=
\bigl(p_j^{(m)}(t_s)\bigr)_
{s\in\{0,1\},\,1\le j\le n,\,0\le m\le L}
\in\mathbb R^{2n(L+1)}.                                  \tag{9.1}
\]

Use the Euclidean norm on this finite jet. Normalize scalar Hamiltonian
gauge by \(\operatorname{tr}H=0\), and define

\[
d_{\rm ph}(x,y)^2=\|H-H'\|_F^2+
\min_{|\zeta|=1}\|u-\zeta u'\|_2^2,                     \tag{9.2}
\]

where \(x=(H,u)\), \(y=(H',u')\). Finally set

\[
d_T(x,y)=\min_{\epsilon\in\{0,1\}}
d_{\rm ph}(x,T_G^\epsilon y).                            \tag{9.3}
\]

### 9.1 Local theorem

For every trace-normalized \(x_0\in U_G\), there is a neighborhood
\(V\) of its continuous-gauge class and a finite constant \(C_{x_0}\)
such that

\[
d_{\rm ph}(x,y)\le C_{x_0}
\|\mathcal J(x)-\mathcal J(y)\|_2
\qquad(x,y\in V).                                       \tag{9.4}
\]

To prove this, inspect the finite reconstruction in Section 7. At
\(x_0\), the Prony Hankel matrix is invertible and the annihilator roots
are simple. Hence its coefficients and locally labeled roots are
real-analytic functions of the jet. The differential projectors,
two-time ratios, integer powers, and Vandermonde solves are real-analytic
because their displayed denominators are nonzero. Distinct gaps give a
fixed local matching to ordered eigenvalue pairs. Each row Gram vector is
recovered real-analytically from three nonzero off-diagonal entries;
the stacked matrix is invertible; and the rooted tree recurrence (7.10)
recovers every row phase. Choose any nonzero coordinate of the source
state as a local global-phase chart. These operations compose to a local
real-analytic left inverse of \(\mathcal J\). Its derivative is bounded
on a smaller closed neighborhood, proving (9.4) by the mean-value
inequality.

The constant can be certified from lower bounds for the frequency
separation, the smallest singular values of the Prony Hankel,
Vandermonde, and stacked row matrices, the minimum recovered Fourier
coefficient, the phase-chart anchor, and the edge-propagation
denominators. It is not uniform when any one of these margins tends to
zero.

### 9.2 Uniform compact theorem and noisy least squares

Let \(K\subset U_G\cap\{\operatorname{tr}H=0\}\) be compact and
\(T_G\)-saturated. Section 7 proves that the finite jet itself, not only
the full movie, has exactly one \(T_G\)-orbit in each fiber on \(K\).
The local estimates (9.4) give a finite cover of \(K/T_G\). For pairs not
lying in a common inverse chart, compactness and injectivity give a
strictly positive minimum jet separation. Combining the two regimes
gives a finite \(C_K\) such that

\[
d_T(x,y)\le C_K\|\mathcal J(x)-\mathcal J(y)\|_2
\qquad(x,y\in K).                                       \tag{9.5}
\]

If noisy data are \(Y=\mathcal J(x)+\eta\), \(x\in K\), and
\(\widehat x\) minimizes \(\|\mathcal J(y)-Y\|_2\) over \(K/T_G\),
then a minimizer exists and

\[
\|\mathcal J(\widehat x)-\mathcal J(x)\|_2\le2\|\eta\|_2.
\]

Therefore

\[
d_T(\widehat x,x)\le2C_K\|\eta\|_2.                    \tag{9.6}
\]

Equations (9.4)--(9.6) also apply to a \(C^L\) movie-error norm that
controls the listed derivatives. A mere \(C^0\) or \(L^\infty(I)\)
error does not control pointwise high derivatives, so no sup-norm
Lipschitz claim is made.

## Conclusion

Sections 0--8 prove all four \(n\ge3\) clauses, including arbitrary
full-space competitors, and independently derive the stated \(n=2\)
boundary. Section 9 adds local and compact-uniform finite-jet noise
stability with an explicit norm. The proof is now submitted to the two
independent audits recorded separately; mathematical acceptance is not
based on the author verdict alone.
