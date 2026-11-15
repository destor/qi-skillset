# Circuits, algorithms and complexity

Material for filling in the eight-step structure in the skill body, for N-C Ch 3 to 6 and Preskill Ch 5 and 6. Here "physical" means operational: what is done to the qubits, what appears in the measured counts, where the interference happens, and what the best classical method would need.

## Smallest instances (step 3)

Work the smallest case in full before the general one.

- Deutsch's problem: one qubit of input, one use of the function.
- Phase estimation with a single control qubit.
- Grover search over four items: one iteration finds the marked item with certainty.
- Period finding on a small register, then factoring 15.

## Where the effect comes from (steps 1 and 2)

- **An algorithm is an interferometer.** Split (Hadamards), let the paths pick up different phases (the function or the unitary), recombine (Hadamards or a Fourier transform). Amplitudes leading to wrong answers cancel; those leading to the right answer add. A Ramsey experiment (π/2 pulse, wait, π/2 pulse) is this pattern on one qubit, and it is one-qubit phase estimation.
- **Superposition alone gives nothing.** Applying the function to a superposition of all inputs and measuring returns one random input and its value. The gain comes from arranging interference so that a global property of the function (a parity, a period, the marked item) decides the outcome.
- **Phase kickback.** A controlled operation acts on a target that it leaves unchanged apart from a phase (an eigenstate). The target cannot record that phase, so it appears as a relative phase between the |0⟩ and |1⟩ branches of the control. The "control" is the qubit that changes.
- **The oracle is a circuit.** It is the classical circuit for f, compiled into reversible gates (Toffolis), acting on superposed inputs. Scratch results must be uncomputed: any leftover record of intermediate values is a which-path record, and it destroys the interference exactly as an environment would. Query counts are counts of uses of this circuit.
- **Quantum Fourier transform.** A change of basis from "where in the register" to "how the amplitudes repeat". A state whose amplitudes repeat with period r gives outcomes only near multiples of (register size)/r, as a grating with regular slits gives sharp diffraction peaks. The transformed amplitudes cannot be read out; each run yields one sample of the peak positions.
- **Phase estimation.** Kick back the phase of U, U², U⁴, … onto successive control qubits, so each control holds one binary digit's worth of the phase; the inverse Fourier transform turns those phases into a readable bit string.
- **Order finding and factoring.** The function aˣ mod N is periodic in x; its period reveals the factors of N through classical arithmetic. The quantum part only finds the period. The cost sits in the modular exponentiation circuit, and the measured counts are peaks whose spacing gives the period after continued-fraction post-processing.
- **Grover search.** The state stays in the plane spanned by the marked item and the uniform superposition. The oracle reflects about one axis, the diffusion step about another; two reflections make a rotation by a fixed angle 2θ with sin θ = 1/√N. About (π/4)√N iterations reach the marked item; further iterations rotate past it and the success probability falls again.
- **Universality.** Any unitary is a sequence of single-qubit rotations and one entangling gate. Hardware offers exactly this: calibrated pulses for rotations and one native two-qubit interaction; everything else is compiled. A finite set (H, T, CNOT) reaches any gate to accuracy ε with only polylogarithmic overhead in 1/ε (Solovay–Kitaev).

## Real vs bookkeeping (step 6)

- "The computer tries all answers at once" is not what happens; see "Superposition alone gives nothing".
- A circuit diagram is a time-ordered list of operations, not a wiring layout.
- Global phase has no observable consequence; relative phase decides every interference pattern.
- A measurement in mid-circuit followed by classical control is equivalent to a controlled gate followed by a later measurement (deferred measurement): measuring is copying onto a record.

## Cost and consequences (step 7)

- Grover is a quadratic gain only: for 10⁶ items, about 785 iterations against about 5 × 10⁵ classical checks on average. It is proven optimal for unstructured search.
- Factoring a 2048-bit RSA number needs thousands of logical qubits and billions of Toffoli gates. With error correction, published estimates run from about 20 million physical qubits (Gidney and Ekerå, 2019) to under one million (Gidney, 2025).
- Without error correction, circuit size is bounded by roughly 1/(error per gate): about a thousand two-qubit gates at 10⁻³.
- Complexity classes describe scaling of resources (gates, qubits, queries) with input size. BQP is what a quantum computer does with polynomially many gates; it contains P and BPP and sits inside PSPACE. Quantum computers are not known to solve NP-complete problems efficiently; Grover gives them a quadratic gain only.
- Erasing a bit dissipates at least kT ln 2 (Landauer). Reversible computation avoids this, and unitary circuits are reversible by construction, which is why oracles are built reversibly.

## Classical counterparts (step 8)

- Interference: Mach–Zehnder interferometer, diffraction grating, spectrum analyser or FFT for the Fourier transform. The break: classical waves give the whole spectrum; a quantum register gives one sample per run.
- Deutsch–Jozsa: a deterministic classical method needs 2ⁿ⁻¹ + 1 queries, but a randomized one needs only a few. The exponential gap is against deterministic methods only.
- Simon's problem and period finding: the gap holds against randomized classical methods too.
- Factoring: the best known classical method (number field sieve) is sub-exponential; classical hardness is believed, not proven.
