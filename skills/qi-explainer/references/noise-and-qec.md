# Noise, hardware and error correction

Material for filling in the eight-step structure in the skill body, for N-C Ch 7, 8 and 10 and Preskill Ch 3, 7 and 8.

## Platforms

Use one running platform per explanation. Choose where the effect is most vivid; switch only to show something it can't.

- Transmons: $T_1$, dephasing, readout, leakage, cosmic rays. $T_1$ about 100 to 300 µs, two-qubit gates of tens to a few hundred ns.
- Trapped ions: laser gates, phonon bus, motional heating. Hyperfine qubits stay coherent for seconds or longer; two-qubit gates take tens to hundreds of µs.
- Neutral atoms: atoms held in optical tweezers, entangled by exciting them to Rydberg states, whose strong interaction blocks a second excitation nearby (Rydberg blockade). Arrays of hundreds of atoms that can be rearranged; two-qubit gates of a few hundred ns at about 99.5% fidelity; atom loss as an error.
- Photons: loss, erasure, measurement-based computation.
- Spin qubits: nuclear-spin bath, quasi-static noise.
- NV centers: sensing.
- Cat qubits: engineered biased noise.

Comparing platforms: N-C §7.2 lists four requirements, a robust representation of the qubit, a universal set of unitary operations, preparation of a known initial state, and measurement of the result. The figure of merit for coherence is the coherence time divided by the gate time, not the coherence time alone: about $10^3$ to $10^4$ for transmons, and more for ions, whose gates are much slower.

## Named mechanisms (step 1)

Name the real cause, not "the environment": dielectric loss in two-level-system defects, flux noise from surface spins, cosmic-ray quasiparticle bursts, laser phase noise.

## Physical reasons for the shape (step 2)

- A cold environment makes energy flow one way.
- An environment that forgets (the photon never returns) gives exponential decay.
- Frequency noise without energy exchange leaves populations untouched.

## Deriving the formalism from the physics (steps 3 and 4)

- **Group by the environment's record.** Write the joint state, group terms by distinguishable environment states, note that distinguishable records cannot interfere. This derives mixtures, Kraus operators and decoherence physically.
- **Overlap = distinguishability.** Coherence survives in proportion to $\langle E_0 \vert E_1 \rangle$. Decoherence is a measurement nobody reads out.
- **Silence is information.** A null result (no click, no photon) still updates the state; this explains no-jump evolution.
- **Continuous physics, discrete bookkeeping.** Continuous drifts become discrete Pauli events through averaging (twirling) or through a syndrome measurement projecting a small rotation $\varepsilon$ onto "nothing" or "full flip" with probability $\sim \varepsilon^2$.

## Real vs bookkeeping (step 6)

- **Ignorance vs entanglement test.** Could an echo or other unitary undo it? Yes: classical ignorance. No: information left into the environment.
- **State the assumption behind the textbook model.** Markovian (environment forgets), independent errors (broken by correlated radiation bursts), qubit subspace (broken by leakage).
- A model can be an equivalent rewrite: the phase-flip channel does not mean nature applies random Z gates.

## Numbers (step 7)

Give realistic values and orders of magnitude: gate times, $T_1$ and $T_2$, error per gate $\approx t_\text{gate}/T$, thresholds. Point out asymmetries visible in real data (e.g. readout errors from 1 to 0).

## Classical counterparts (step 8)

LC ring-down, DRAM leakage, ECC/TMR, oscillator phase noise, clock jitter. Say where the analogy breaks; that break is the quantum part.

## Error correction

- **Redundancy without copying.** $a \lvert 000 \rangle + b \lvert 111 \rangle$ is not three copies of $a \lvert 0 \rangle + b \lvert 1 \rangle$ (copying is impossible); the information sits in the correlations between the qubits, and no single qubit carries it. That is why losing or disturbing one qubit does not reveal or destroy it.
- **Syndrome extraction is a parity measurement.** An ancilla interacts with a few data qubits and is then read out. It reports whether neighbours agree, which is the same for both branches of the encoded superposition, so it locates the error and learns nothing about a and b.
- **Discretization.** A small unwanted rotation leaves the state as "no error" plus a small amplitude of "flip". The parity measurement forces one of the two, so correcting discrete flips is enough to correct continuous errors.
- **Logical operator.** An operation that every check fails to notice but that changes the encoded information. It is both the way to compute on the encoded qubit and the shape of an error the code cannot see.
- **Code distance d.** The smallest number of qubits a logical operator touches, so the smallest undetectable error. The code corrects any $\lfloor (d-1)/2 \rfloor$ errors.
- **Fault tolerance.** The checks are built from the same faulty parts. Repeat the checks over many rounds, because a measurement can be wrong, and build every part so that one fault causes at most one error in each code block. Fault tolerance does not make faults rare; it keeps a single fault correctable.
- **How errors spread.** A CNOT copies an $X$ error from its control to its target and a $Z$ error from its target to its control. An ancilla that collects a parity from several data qubits through CNOTs can therefore carry one fault back onto several of them. Remedies: an ancilla qubit for each data qubit in a verified entangled state (Shor), extra flag qubits that reveal such a fault, or an order of gates that sends the spread errors where the code can still correct them.
- **Transversal gates.** A gate applied qubit by qubit between code blocks cannot spread one fault within a block. In the Steane code $H$, $S$ and CNOT are transversal; no code has a universal set of transversal gates (Eastin–Knill). The missing gate, usually $T$, is applied by consuming a "magic state", prepared noisily and then purified by distillation. Distillation dominates most resource estimates, which is why they count $T$ or Toffoli gates.
- **Concatenation.** Encode each qubit of a code again in the same code. If one level turns an error rate $p$ into about $c p^2$, then $k$ levels give $p_\text{th} (p/p_\text{th})^{2^k}$ with $p_\text{th} = 1/c$: the error falls doubly exponentially in $k$ while the number of qubits grows as $7^k$ for the Steane code. This is the threshold argument of N-C §10.6.
- **Threshold.** If the physical error per operation is below a threshold (around 1% for the surface code), each increase in distance divides the logical error rate by a constant factor; above it, adding qubits makes things worse.
- **Numbers.** Google's 2024 surface-code experiment: distance 7 on 101 qubits, logical error 0.143% per cycle, suppressed by a factor of about 2.1 for each step $d \to d+2$. At a physical error near $10^{-3}$, a logical qubit good enough for long algorithms needs on the order of 1000 physical qubits.
- **Classical counterpart.** Repetition codes, ECC memory, triple modular redundancy with majority voting. The analogy breaks in three places: the data cannot be read to compare copies, there are phase errors as well as bit errors, and errors are continuous.
