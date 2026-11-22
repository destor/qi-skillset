# Mathematics map

Where the mathematics the course uses is treated in four free books. Use it to cite by chapter and section, in the same way as `textbook-map.md`. Anything not listed here: cite the chapter only, or give no reference.

- **LADR:** Axler, *Linear Algebra Done Right*, 4th edition (2024). Open access (Creative Commons BY-NC) at https://linear.axler.net/. Sections are labelled by chapter and letter (7B).
- **LADW:** Treil, *Linear Algebra Done Wrong*, version of 31 August 2026. Free for non-commercial use (Creative Commons BY-NC-ND 3.0) from the author's page, https://sites.google.com/a/brown.edu/sergei-treil-homepage/linear-algebra-done-wrong.
- **Watrous:** Watrous, *The Theory of Quantum Information* (Cambridge University Press, 2018). The author's manuscript is free for personal use at https://cs.uwaterloo.ca/~watrous/TQI/. Numbers below are those of the manuscript.
- **Judson:** Judson, *Abstract Algebra: Theory and Applications*, annual edition (GNU Free Documentation License), at http://abstract.pugetsound.edu/. Numbers below are those of the 2026 edition.

Notes:

- LADR for the concepts and the proofs; LADW for computing with explicit matrices and determinants. Give one of them, not both, unless the user needs the computation as well.
- Watrous is precise and heavy. For channels, point first to the physical account (N-C §8.2, the part of Preskill Ch 3 on dilation to a unitary on a larger system), then to Watrous for the proofs.
- Point to a mathematics source only where a step uses mathematics that the reader is not assumed to have; the course textbooks come first.

## Linear algebra

- Inner products, norms, orthonormal bases: LADR 6A, 6B; LADW 5.1, 5.2
- Orthogonal complements and projections: LADR 6C; LADW 5.3
- Eigenvalues and eigenvectors: LADR 5A; LADW 4.1 (characteristic polynomial: 4.1.2)
- Diagonalization: LADR 5D; LADW 4.2
- Determinants: LADR 9C; LADW Ch 3
- Trace: LADR 8D; LADW 1.5.5, 4.1.6; Watrous 1.1.2
- Adjoints: LADR 7A; LADW 5.5
- Self-adjoint and normal operators: LADR 7A; LADW 6.2
- Spectral theorem: LADR 7B; LADW 6.2; Watrous 1.1.3
- Functions of operators ($\sqrt{A}$, $\log A$, $e^{A}$): LADW 4.2.2; Watrous 1.1.3
- Positive operators and square roots: LADR 7C (square roots of general operators: 8C); LADW 6.3.1; Watrous 1.1.2
- Isometries and unitary operators: LADR 7D; LADW 5.6; Watrous 1.1.2
- Singular value decomposition: LADR 7E; LADW 6.3.3, 6.3.4; Watrous 1.1.3
- Polar decomposition: LADR 7F; LADW 6.3.2; Watrous 1.1.3
- Schmidt decomposition: LADW 6.3.3 (written for an operator; the same mathematics as for a state of two systems); Watrous 1.1.3; N-C §2.5
- Operator norms, trace norm: LADR 7F; LADW 6.4.2; Watrous 1.1.3
- Tensor products of spaces: LADR 9D (of inner product spaces: same section); LADW 8.5.2 (through multilinear functions, further from the course's use); Watrous 1.1.1
- Tensor products of operators: Watrous 1.1.2
- Operator–vector correspondence (vectorization): Watrous 1.1.2
- Partial trace and reduced states: Watrous 2.1.3; N-C §2.4.3
- Purification: Watrous 2.1.3; N-C §2.5

## Channels

- Choi, Kraus and Stinespring representations: Watrous 2.2.2
- Characterizations of completely positive maps, of trace-preserving maps and of channels: Watrous 2.2.2
- Examples (isometric and unitary channels, the transpose map, the completely dephasing channel): Watrous 2.2.3

## Analysis and probability

- Convexity: Watrous 1.2.1
- Probability: Watrous 1.2.2; N-C Appendix 1

## Algebra for algorithms and codes

- Division algorithm, Euclidean algorithm, greatest common divisor: Judson 2.2
- Integers mod $n$: Judson 3.1
- Groups and subgroups: Judson 3.2, 3.3
- Cyclic groups, order of an element: Judson 4.1
- Modular exponentiation by repeated squaring: Judson 4.3
- Cosets, Lagrange's theorem: Judson 6.1, 6.2
- Fermat's and Euler's theorems: Judson 6.3
- RSA: Judson 7.2; N-C Appendix 5
- Direct products: Judson 9.2
- Normal subgroups, factor groups: Judson 10.1
- Homomorphisms: Judson 11.1
- Finite abelian groups: Judson 13.1
- Vector spaces over any field, including bits with arithmetic mod 2: Judson Ch 20
- Finite fields: Judson 22.1
- Continued fractions: N-C Appendix 4; not in the four books

## Classical codes and bit strings

- Hamming distance, Hamming weight, minimum distance, error detection and correction: Judson 8.1
- Linear codes: Judson 8.2
- Generator and parity-check matrices: Judson 8.3
- Syndromes and coset decoding: Judson 8.4
- Dual codes, and the classical codes behind CSS codes: N-C §10.4
- Gray codes: N-C §4.5, where they are used to build two-level unitaries from single-qubit and CNOT gates
