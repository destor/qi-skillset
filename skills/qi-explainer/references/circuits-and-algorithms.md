# Circuits, algorithms and complexity

Material for filling in the eight-step structure in the skill body, for N-C Ch 3 to 6 and Preskill Ch 5 and 6. Here "physical" means operational: what is done to the qubits, what appears in the measured counts, where the interference happens, and what the best classical method would need.

## Smallest instances (step 3)

Work the smallest case in full before the general one.

- Deutsch's problem: one qubit of input, one use of the function.
- Phase estimation with a single control qubit.
- Grover search over four items: one iteration finds the marked item with certainty.
- Period finding on a small register, then factoring 15.
- Simulation: two spins with $H = J Z_1 Z_2 + h (X_1 + X_2)$, one product-formula step.

## Where the effect comes from (steps 1 and 2)

- **An algorithm is an interferometer.** Split (Hadamards), let the paths pick up different phases (the function or the unitary), recombine (Hadamards or a Fourier transform). Amplitudes leading to wrong answers cancel; those leading to the right answer add. A Ramsey experiment ($\pi/2$ pulse, wait, $\pi/2$ pulse) is this pattern on one qubit, and it is one-qubit phase estimation.
- **Superposition alone gives nothing.** Applying the function to a superposition of all inputs and measuring returns one random input and its value. The gain comes from arranging interference so that a global property of the function (a parity, a period, the marked item) decides the outcome.
- **Phase kickback.** A controlled operation acts on a target that it leaves unchanged apart from a phase (an eigenstate). The target cannot record that phase, so it appears as a relative phase between the $\lvert 0 \rangle$ and $\lvert 1 \rangle$ branches of the control. The "control" is the qubit that changes.
- **The oracle is a circuit.** It is the classical circuit for $f$, compiled into reversible gates (Toffolis), acting on superposed inputs. Scratch results must be uncomputed: any leftover record of intermediate values is a which-path record, and it destroys the interference exactly as an environment would. Query counts are counts of uses of this circuit.
- **Quantum Fourier transform.** A change of basis from "where in the register" to "how the amplitudes repeat". A state whose amplitudes repeat with period $r$ gives outcomes only near multiples of (register size)$/r$, as a grating with regular slits gives sharp diffraction peaks. The transformed amplitudes cannot be read out; each run yields one sample of the peak positions.
- **Phase estimation.** Kick back the phase of $U, U^2, U^4, \ldots$ onto successive control qubits, so each control holds one binary digit's worth of the phase; the inverse Fourier transform turns those phases into a readable bit string.
- **Order finding and factoring.** The function $a^x \bmod N$ is periodic in $x$; its period reveals the factors of $N$ through classical arithmetic. The quantum part only finds the period. The cost sits in the modular exponentiation circuit, and the measured counts are peaks whose spacing gives the period after continued-fraction post-processing.
- **Grover search.** The state stays in the plane spanned by the marked item and the uniform superposition. The oracle reflects about one axis, the diffusion step about another; two reflections make a rotation by a fixed angle $2\theta$ with $\sin\theta = 1/\sqrt{N}$. About $(\pi/4)\sqrt{N}$ iterations reach the marked item; further iterations rotate past it and the success probability falls again. This is not N-C's convention for the angle, which writes $\sin(\theta/2) = \sqrt{M/N}$ and a rotation by $\theta$; state which one is in use (see `concepts.md`).
- **Simulation of quantum systems.** Task: predict how $n$ interacting spins evolve. Writing their state takes $2^n$ complex amplitudes, so 50 spins need about $10^{15}$, some 18 petabytes at double precision; a quantum computer holds the same state in 50 qubits. When the Hamiltonian is a sum of local terms $H = \sum_k H_k$, each $e^{-i H_k \Delta t}$ is a gate on a few qubits, and applying them in turn over short steps approximates the whole evolution (product or Trotter formula): $e^{-iHt} \approx \bigl( \prod_k e^{-i H_k t/r} \bigr)^r$. The terms do not commute, and the error comes from their commutators; for the first-order formula it is of order $t^2/r$. What can be read out is an expectation value estimated from repeated runs, not the state.
- **Universality.** Any unitary is a sequence of single-qubit rotations and one entangling gate. Hardware offers exactly this: calibrated pulses for rotations and one native two-qubit interaction; everything else is compiled. A finite set (H, T, CNOT) reaches any gate to accuracy $\varepsilon$ with only polylogarithmic overhead in $1/\varepsilon$ (Solovay–Kitaev).

## Real vs bookkeeping (step 6)

- "The computer tries all answers at once" is not what happens; see "Superposition alone gives nothing".
- A circuit diagram is a time-ordered list of operations, not a wiring layout.
- Global phase has no observable consequence; relative phase decides every interference pattern.
- A measurement in mid-circuit followed by classical control is equivalent to a controlled gate followed by a later measurement (deferred measurement): measuring is copying onto a record.
- A product-formula circuit is not the system: it reproduces the system's evolution to a stated accuracy. Preparing the initial state of interest, such as a ground state, can be the hard part.

## Cost and consequences (step 7)

- Grover is a quadratic gain only: for $10^6$ items, about 785 iterations against about $5 \times 10^5$ classical checks on average. It is proven optimal for unstructured search.
- Factoring a 2048-bit RSA number needs thousands of logical qubits and billions of Toffoli gates. With error correction, published estimates run from about 20 million physical qubits (Gidney and Ekerå, 2019) to under one million (Gidney, 2025).
- Without error correction, and with errors that add as probabilities, circuit size is bounded by roughly $1/(\text{error per gate})$: about a thousand two-qubit gates at $10^{-3}$. Coherent errors add as amplitudes and allow fewer.
- Simulation: for the first-order product formula the number of steps for accuracy $\varepsilon$ grows as $t^2/\varepsilon$; higher-order formulas need fewer. For the FeMoco molecule, the active site of nitrogen fixation, an estimate is about 2,000 logical and 4 million physical qubits (Lee et al., 2021).
- Complexity classes describe scaling of resources (gates, qubits, queries) with input size. BQP is what a quantum computer does with polynomially many gates; it contains P and BPP and sits inside PSPACE. Quantum computers are not known to solve NP-complete problems efficiently; Grover gives them a quadratic gain only.
- Erasing a bit dissipates at least $kT \ln 2$ (Landauer). Reversible computation avoids this, and unitary circuits are reversible by construction, which is why oracles are built reversibly.

## Classical counterparts (step 8)

- Interference: Mach–Zehnder interferometer, diffraction grating, spectrum analyser or FFT for the Fourier transform. The break: classical waves give the whole spectrum; a quantum register gives one sample per run.
- Deutsch–Jozsa: a deterministic classical method needs $2^{n-1} + 1$ queries, but a randomized one needs only a few. The exponential gap is against deterministic methods only.
- Simon's problem and period finding: the gap holds against randomized classical methods too.
- Factoring: the best known classical method (number field sieve) is sub-exponential; classical hardness is believed, not proven.
- Simulation: exact state-vector simulation reaches about 50 qubits; tensor networks (matrix product states) handle states with little entanglement, such as many one-dimensional ground states; quantum Monte Carlo works where there is no sign problem. The break: entanglement that grows with time, as after a sudden change of the Hamiltonian, defeats tensor networks, and fermions and frustrated magnets bring the sign problem.
