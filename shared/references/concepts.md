# Concepts: conventions, dependencies, framings and caveats

Facts about the subject that hold whatever kind of session is running. This file is for checking, not a required answer: it does not prescribe one way to describe a concept, and any correct account is acceptable.

## Conventions that differ between sources

State the convention in use whenever one of these appears.

- **Fidelity.** N-C: $F(\rho, \sigma) = \operatorname{tr} \sqrt{\rho^{1/2} \sigma \rho^{1/2}}$, which is $\lvert \langle \psi \vert \phi \rangle \rvert$ for pure states. Preskill and most papers use the square of this. Gate and state fidelities quoted from experiments are the squared kind.
- **Trace distance.** N-C: $D(\rho, \sigma) = \tfrac{1}{2} \operatorname{tr} \lvert \rho - \sigma \rvert$, between 0 and 1. Other sources quote the trace norm without the factor $\tfrac{1}{2}$.
- **Channels.** N-C: "quantum operation" $\mathcal{E}$, written in the "operator-sum representation" with "operation elements" $E_k$. Preskill: "quantum channel" with "Kraus operators" $M_a$. These are the same objects.
- **Depolarizing channel.** N-C: $\rho \to p I/2 + (1 - p)\rho$. The Pauli form applies $X$, $Y$ and $Z$ with probability $q/3$ each. The two parameters are related by $q = 3p/4$.
- **Coherence times.** $T_2^*$ is measured with a Ramsey sequence and includes slow frequency drifts. $T_2$ is measured with an echo, which removes them. In both cases $1/T_2 = 1/(2T_1) + 1/T_\phi$, with $T_\phi$ the pure dephasing time.
- **Damping parameter.** The probability $\gamma$ in the amplitude-damping channel is the decay probability for one use of the channel: $\gamma = 1 - e^{-t/T_1}$.
- **Gate names.** N-C calls $T = \operatorname{diag}(1, e^{i\pi/4})$ the "$\pi/8$ gate" and $S = \operatorname{diag}(1, i)$ the "phase gate".
- **Quantum Fourier transform.** N-C uses the exponent $+2\pi i jk/N$ and takes the first qubit as the most significant. Some sources use the opposite sign, or call this the inverse transform.
- **Grover angle.** N-C: $\sin(\theta/2) = \sqrt{M/N}$ for $M$ solutions among $N$ items, and one iteration rotates by $\theta$. Other treatments write $\sin\theta = \sqrt{M/N}$ and a rotation by $2\theta$. The physics is the same.
- **Codes.** [n, k, d] is a classical code, [[n, k, d]] a quantum code: n physical (qu)bits, k encoded, distance d.
- **Entropy.** Logarithms are base 2, so entropies are in bits or qubits. H is Shannon entropy and the binary entropy function; S is von Neumann entropy.

## What depends on what

Read each line from left to right: a concept needs the ones before it. Lines further down also draw on the lines marked in brackets.

- **Linear algebra** (assumed up to eigenvalues and diagonalization): inner products and adjoints → self-adjoint and normal operators → spectral theorem → functions of operators → positive operators and square roots → isometries → singular value and polar decompositions → tensor products → partial trace → Schmidt decomposition and purification → Choi representation → Kraus representation → Stinespring representation.
- **Algebra:** modular arithmetic and Euclid's algorithm → groups and subgroups → cyclic groups and the order of an element → cosets and Lagrange's theorem → Fermat's and Euler's theorems. Order finding and factoring draw on all of it, the hidden subgroup problem and stabilizer codes on groups and cosets.
- **Classical codes:** bit strings and Hamming distance → minimum distance and the errors a code corrects → linear codes over bits mod 2 → generator and parity-check matrices → syndromes. Error correction draws on all of it.
- **States:** superposition and relative phase → Bloch sphere → measurement in a chosen basis → composite systems → entanglement → reduced state (partial trace) → density operator and mixed states → Schmidt decomposition and purification → generalized measurement (POVM).
- **Noise** (needs States): unitary on system plus environment → channel and Kraus operators → bit flip, phase flip, depolarizing, amplitude damping, phase damping → $T_1$ and $T_2$ → master equation → trace distance and fidelity.
- **Circuits:** single-qubit gates → controlled gates → universal gate sets → reversible computation and the oracle → phase kickback → Deutsch–Jozsa, Bernstein–Vazirani, Simon → quantum Fourier transform → phase estimation → order finding → factoring.
- **Complexity** (needs Circuits up to reversible computation): classical circuits → complexity classes (P, NP, BQP) → black-box query limits.
- **Simulation** (needs universal gate sets): Hamiltonian as a sum of local terms → product (Trotter) formula → simulation of local Hamiltonians.
- **Search** (needs Circuits up to the oracle): reflections → Grover iteration → optimality → quantum counting (also needs phase estimation).
- **Protocols** (needs States up to entanglement): Bell states → dense coding and teleportation; Bell and CHSH inequalities; no-cloning → key distribution.
- **Error correction** (needs no-cloning, entanglement, the Noise channels): parity measurement → three-qubit bit-flip code → phase-flip code → Shor code → discretization of errors and the conditions for correction → classical linear codes → CSS codes → stabilizer codes → logical operators and distance → fault tolerance → threshold.
- **Information** (needs density operator, POVM, channels): Shannon entropy → von Neumann entropy → conditional entropy and mutual information → Holevo bound → Schumacher compression → channel capacities → entanglement as a resource.

## Equivalent framings

Each line lists descriptions that give the same predictions. None is preferred.

- **Density operator:** the average over an ensemble of prepared states; the state of one part of a larger entangled system; everything an observer can predict from what they hold. The same $\rho$ can arise in any of these ways, and no measurement on the system alone tells them apart.
- **Entanglement:** a pure state that is not a product; more than one term in the Schmidt decomposition; a state that cannot be prepared by local operations and classical communication; correlations across several bases that shared randomness cannot reproduce.
- **Measurement:** the postulate (projection with the Born rule); an interaction that copies information into an apparatus, followed by reading the apparatus; a generalized measurement realised with an auxiliary system.
- **Quantum channel:** a unitary on system and environment, with the environment then discarded; a set of Kraus operators; a linear map that is completely positive and trace preserving.
- **Dephasing:** entanglement with an environment that learns the qubit's state; an average over a classical fluctuation of the qubit's frequency. For one qubit both give the same channel; an echo undoes the second kind when the fluctuation is slow.
- **Single-qubit gate:** a unitary matrix; a rotation of the Bloch sphere; a control pulse applied for a set time.
- **Grover iteration:** two reflections in a plane; "flip the sign of the marked amplitude, then invert every amplitude about the mean".
- **Quantum Fourier transform:** a change of basis; the recombining step of an interferometer.
- **Syndrome measurement:** a parity check on a few qubits; a measurement of a stabilizer generator; a measurement of the error that leaves the encoded data untouched.
- **Von Neumann entropy:** qubits per signal needed to store the output of a source; the uncertainty about a system given only that system; for a pure state of two parties, the amount of entanglement between them.
- **Trace distance:** the best advantage in guessing which of two states was given; the largest difference in the probability of any measurement outcome.
- **Teleportation:** a trade of one Bell pair and two classical bits for one transmitted qubit state; a circuit identity in which measurement and correction replace a two-qubit gate.

## Conditions on common statements

Each statement is usually true as far as it goes. The condition is what it leaves out.

**States and measurement**

- "A qubit is 0 and 1 at once." Shorthand. The content is that some other measurement basis gives a definite result, which no assignment of 0 or 1 can explain.
- "Measurement collapses the state." A rule for updating predictions after a result. Interaction with an apparatus or environment explains why interference disappears; it does not explain why a single outcome occurs. The course does not depend on settling this.
- "A mixed state means we do not know which pure state it is." One valid reading. The decomposition of $\rho$ into an ensemble is not unique, and half of an entangled pair is mixed with nothing left to be ignorant of.
- "The Schmidt decomposition picks out the bases." Only when the coefficients are distinct. For a Bell state every basis works.
- "A purification of $\rho$." Unique only up to a unitary on the added system.

**Noise**

- "Decoherence is entanglement with the environment." For dephasing, classical frequency noise gives the same single-qubit channel.
- "Noise applies random Pauli gates." An exact rewrite for Pauli channels. For amplitude damping and coherent errors it holds only after averaging (twirling) or as an approximation.
- "Coherence decays exponentially." Assumes an environment without memory. Slow (1/f) noise gives a Gaussian decay.
- "$T_2 \le 2T_1$." Always true; equality needs zero pure dephasing, which is rare.
- "Fidelity 99.9% allows about a thousand gates." Assumes errors that add as probabilities. Coherent errors add as amplitudes and can grow faster.
- "Longer coherence makes a better qubit." Coherence counts relative to gate time; the error per gate is roughly the gate time divided by the coherence time.

**Circuits and algorithms**

- "$n$ qubits hold $2^n$ numbers." That many are needed to describe the state; at most $n$ bits can be extracted.
- "Quantum computers are exponentially faster." Known only for specific structured problems. Unstructured search gains quadratically. The exponential gap for Deutsch–Jozsa is against deterministic classical methods only.
- "The hardware's native gates are a universal set." Universality is a mathematical property: a finite set that approximates any unitary. Native gates are one such choice. H, S and CNOT alone are not universal and can be simulated classically.
- "A quantum computer simulates quantum systems efficiently." For Hamiltonians that are sums of local terms, and for quantities that a few measurements of the final state can estimate. Preparing a ground state can be hard even then.
- "Shor's algorithm breaks public-key cryptography." It breaks schemes based on factoring and discrete logarithms (RSA, elliptic curves); lattice-based schemes are not known to be affected.
- "The algorithm needs $\sqrt{N}$ steps." Query counts measure uses of the oracle, not running time; the oracle's own circuit has a cost.

**Entanglement and protocols**

- "Entangled means correlated in more than one basis." A good test for pure states. Mixed separable states can show weaker correlations in several bases, and some entangled mixed states violate no Bell inequality.
- "Bell violations rule out hidden variables." They rule out local ones.
- "Quantum states cannot be copied." Unknown states cannot. A known state can be prepared again, states from a known orthogonal set can be copied, and approximate copies are possible.
- "Teleportation transfers the state instantly." Nothing usable arrives before the two classical bits.
- "n qubits carry at most n classical bits (Holevo)." Without shared entanglement. With it, dense coding carries 2n.

**Error correction**

- "A distance-$d$ code corrects $\lfloor (d-1)/2 \rfloor$ errors." Arbitrary errors on that many qubits. It detects $d - 1$, and corrects $d - 1$ losses whose positions are known.
- "The syndrome reveals nothing about the data." For errors the code can correct. A heavier error gives a syndrome that leads to the wrong fix.
- "The threshold is about 1%." For the surface code under a particular noise model and decoder. Thresholds assume errors that are local and not strongly correlated.
- "Below threshold, more qubits always help." The gain per step in distance depends on how far below threshold the device is.
- "A fault-tolerant circuit stops errors from spreading." It keeps one fault from causing more than one error in any code block. Two faults can still defeat a code that corrects one error.

**Information**

- "The entropy of the system is S." Entropy depends on what the observer holds: one bit for half of a Bell pair, zero for the pair.
- "Von Neumann entropy measures entanglement." For a pure state of two parties only.
- "The capacity of the channel is C." A rate for many uses with vanishing error, and a channel has several capacities depending on what is sent and what help is allowed.
