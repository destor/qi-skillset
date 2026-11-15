# Noise, hardware and error correction

Material for filling in the eight-step structure in the skill body, for N-C Ch 7, 8 and 10 and Preskill Ch 3, 7 and 8.

## Platforms

Use one running platform per explanation. Choose where the effect is most vivid; switch only to show something it can't.

- Transmons: T1, dephasing, readout, leakage, cosmic rays.
- Trapped ions: laser gates, phonon bus, motional heating.
- Photons: loss, erasure, measurement-based computation.
- Spin qubits: nuclear-spin bath, quasi-static noise.
- NV centers: sensing.
- Cat qubits: engineered biased noise.

## Named mechanisms (step 1)

Name the real cause, not "the environment": dielectric loss in two-level-system defects, flux noise from surface spins, cosmic-ray quasiparticle bursts, laser phase noise.

## Physical reasons for the shape (step 2)

- A cold environment makes energy flow one way.
- An environment that forgets (the photon never returns) gives exponential decay.
- Frequency noise without energy exchange leaves populations untouched.

## Deriving the formalism from the physics (steps 3 and 4)

- **Group by the environment's record.** Write the joint state, group terms by distinguishable environment states, note that distinguishable records cannot interfere. This derives mixtures, Kraus operators and decoherence physically.
- **Overlap = distinguishability.** Coherence survives in proportion to ⟨E₀|E₁⟩. Decoherence is a measurement nobody reads out.
- **Silence is information.** A null result (no click, no photon) still updates the state; this explains no-jump evolution.
- **Continuous physics, discrete bookkeeping.** Continuous drifts become discrete Pauli events through averaging (twirling) or through a syndrome measurement projecting a small rotation ε onto "nothing" or "full flip" with probability ~ε².

## Real vs bookkeeping (step 6)

- **Ignorance vs entanglement test.** Could an echo or other unitary undo it? Yes: classical ignorance. No: information left into the environment.
- **State the assumption behind the textbook model.** Markovian (environment forgets), independent errors (broken by correlated radiation bursts), qubit subspace (broken by leakage).
- A model can be an equivalent rewrite: the phase-flip channel does not mean nature applies random Z gates.

## Numbers (step 7)

Give realistic values and orders of magnitude: gate times, T1/T2, error per gate ≈ t_gate/T, thresholds. Point out asymmetries visible in real data (e.g. readout 1→0 errors).

## Classical counterparts (step 8)

LC ring-down, DRAM leakage, ECC/TMR, oscillator phase noise, clock jitter. Say where the analogy breaks; that break is the quantum part.

## Error correction

- **Redundancy without copying.** a|000⟩ + b|111⟩ is not three copies of a|0⟩ + b|1⟩ (copying is impossible); the information sits in the correlations between the qubits, and no single qubit carries it. That is why losing or disturbing one qubit does not reveal or destroy it.
- **Syndrome extraction is a parity measurement.** An ancilla interacts with a few data qubits and is then read out. It reports whether neighbours agree, which is the same for both branches of the encoded superposition, so it locates the error and learns nothing about a and b.
- **Discretization.** A small unwanted rotation leaves the state as "no error" plus a small amplitude of "flip". The parity measurement forces one of the two, so correcting discrete flips is enough to correct continuous errors.
- **Logical operator.** An operation that every check fails to notice but that changes the encoded information. It is both the way to compute on the encoded qubit and the shape of an error the code cannot see.
- **Code distance d.** The smallest number of qubits a logical operator touches, so the smallest undetectable error. The code corrects any ⌊(d−1)/2⌋ errors.
- **Fault tolerance.** The checks are built from the same faulty parts. Repeat the checks over many rounds, and build gates so that one fault cannot spread into many errors inside a code block.
- **Threshold.** If the physical error per operation is below a threshold (around 1% for the surface code), each increase in distance divides the logical error rate by a constant factor; above it, adding qubits makes things worse.
- **Numbers.** Google's 2024 surface-code experiment: distance 7 on 101 qubits, logical error 0.143% per cycle, suppressed by a factor of about 2.1 for each step d → d+2. At a physical error near 10⁻³, a logical qubit good enough for long algorithms needs on the order of 1000 physical qubits.
- **Classical counterpart.** Repetition codes, ECC memory, triple modular redundancy with majority voting. The analogy breaks in three places: the data cannot be read to compare copies, there are phase errors as well as bit errors, and errors are continuous.
