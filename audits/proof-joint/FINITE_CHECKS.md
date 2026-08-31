# Exact finite-check certificate

Both commands were run with Python exact integers and exited `0`.

## Coefficient templates `(6.5)`

Command: `python -B scripts/check_templates.py`

```text
n=3: PASS C1=6 C2=7 C3=0 canonical_C2_zeros=2
n=4: PASS C1=30 C2=32 C3=12 canonical_C2_zeros=4
n=5: PASS C1=90 C2=94 C3=60 canonical_C2_zeros=6
n=6: PASS C1=210 C2=217 C3=180 canonical_C2_zeros=8
n=7: PASS C1=420 C2=431 C3=420 canonical_C2_zeros=10
n=8: PASS C1=756 C2=772 C3=840 canonical_C2_zeros=12
n=9: PASS C1=1260 C2=1282 C3=1512 canonical_C2_zeros=14
n=10: PASS C1=1980 C2=2009 C3=2520 canonical_C2_zeros=16
n=11: PASS C1=2970 C2=3007 C3=3960 canonical_C2_zeros=18
n=12: PASS C1=4290 C2=4336 C3=5940 canonical_C2_zeros=20
```

Every retained vector was nonzero, had coordinate sum zero, maximum coefficient magnitude at most two, and `l1` norm at most six. Every unpruned zero `C2` vector was a canonical endpoint split; there were exactly `2(n-2)` ordered instances.

## Turnpike search

Command: `python -B scripts/check_turnpike.py`

```text
n=3: PASS sources=112
n=4: PASS sources=252
n=5: PASS sources=6
n=6: PASS sources=0
TOTAL_PASS sources=370
```

The search exhausted normalized integer point sets with `3<=n<=6` and `L<=16`. For every one of the 370 sources satisfying conditions 1--3, the only same-difference point sets were the source and its reflection. No eligible `n=6` source exists within this deliberately small `L` range, so the `n=6` line is not positive evidence. Universal closure comes from the symbolic proof in `REPORT.md`, not this search.
