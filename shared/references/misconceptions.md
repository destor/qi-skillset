# Common misconceptions by area

Each misconception is given as the wrong belief followed by what holds. The "holds" line is the short correct statement, for recognising the misconception and judging an answer. When it may be said to the user depends on the kind of session and is set in the skill body.

## States and measurement (N-C Ch 1, 2; Preskill Ch 2, 3)

- Wrong: a qubit in superposition is secretly 0 or 1 and we do not know which. Holds: a superposition shows interference that ignorance cannot; a Hadamard on $\lvert + \rangle$ always gives 0, on a 50/50 mixture it gives random results.
- Wrong: a mixed state is a kind of superposition. Holds: a mixed state has lost the definite phase relation that a superposition has.
- Wrong: a qubit stores unlimited information because its amplitudes are continuous. Holds: one measurement yields one bit, and the state is gone.
- Wrong: phase never matters, or global phase matters. Holds: only relative phase has observable consequences.
- Wrong: measurement reveals a value that was already there. Holds: results in different bases cannot all be pre-assigned (Bell).

## Noise and open systems (N-C Ch 8; Preskill Ch 3)

- Wrong: decoherence means the qubit loses energy. Holds: dephasing destroys phase relations with no energy exchange.
- Wrong: decoherence needs an observer. Holds: a record left in the environment is enough, read or not.
- Wrong: the phase-flip channel means nature applies Z gates at random. Holds: it is an equivalent description of the qubit's state, not the mechanism.
- Wrong: $T_2$ equals $T_1$, or can be much longer than $T_1$. Holds: energy relaxation also destroys phase, so $T_2$ is at most $2T_1$.
- Wrong: all noise is irreversible. Holds: slow, classical frequency uncertainty can be undone by an echo; information that reached the environment cannot.
- Wrong: the qubit with the longest coherence time is the best one. Holds: what counts is the coherence time divided by the gate time; trapped ions have long coherence and slow gates, transmons short coherence and fast gates.

## Circuits and algorithms (N-C Ch 3 to 6; Preskill Ch 5, 6)

- Wrong: the computer tries all answers at once and reads off the right one. Holds: measuring gives one random branch; interference has to make the right outcome likely.
- Wrong: Grover gives an exponential speed-up, or quantum computers solve NP-complete problems efficiently. Holds: the gain for unstructured search is quadratic and provably no better.
- Wrong: the oracle knows the answer, so the problem is trivial. Holds: it checks a candidate; recognising a solution is not finding one.
- Wrong: a controlled gate never changes its control. Holds: the control picks up a phase when the target cannot record it.
- Wrong: the quantum Fourier transform outputs the spectrum. Holds: each run gives one sample from it.
- Wrong: more Grover iterations are always better. Holds: the state rotates past the target and the success probability falls.
- Wrong: factoring is NP-complete, so Shor's algorithm solves every problem in NP. Holds: factoring is in NP but is not believed to be NP-complete.
- Wrong: a quantum computer can efficiently simulate any quantum system. Holds: efficient simulation is known for Hamiltonians built from local terms; most unitaries on $n$ qubits need a number of gates exponential in $n$.

## Entanglement and protocols (N-C §1.3, §2.3, §2.6, §12.6; Preskill Ch 4)

- Wrong: measuring one half changes the other and can send a message. Holds: the other side's statistics do not depend on what is done here.
- Wrong: entanglement is just correlation. Holds: the correlation persists across different measurement bases, which shared randomness cannot do.
- Wrong: teleportation moves the particle, copies the state or is instantaneous. Holds: the original is destroyed and the receiver has nothing usable until two classical bits arrive.
- Wrong: no-cloning forbids preparing the same known state many times. Holds: it forbids copying an unknown state.

## Error correction (N-C Ch 10; Preskill Ch 7)

- Wrong: the encoded state is three copies of the qubit. Holds: it is one entangled state; no single qubit carries the information.
- Wrong: the syndrome measurement measures the data and collapses it. Holds: it measures parities that are the same for both branches.
- Wrong: continuous errors cannot be corrected by a discrete set of fixes. Holds: the syndrome measurement turns a small rotation into "no error" or "full flip".
- Wrong: a distance-$d$ code corrects $d$ errors. Holds: $\lfloor (d-1)/2 \rfloor$.
- Wrong: more qubits always help. Holds: only below the threshold error rate.

## Fault tolerance (N-C §10.6; Preskill Ch 8)

- Wrong: a fault-tolerant circuit makes no errors. Holds: one fault causes at most one error in each code block, which the code can then correct.
- Wrong: measuring a stabilizer through an ancilla cannot disturb the data. Holds: a fault on the ancilla can spread back through the controlled gates to several data qubits; fault-tolerant measurement is built to prevent that.
- Wrong: below the threshold the logical error rate is zero. Holds: it falls with each increase in code distance, by a factor that grows the further below threshold the device is.

## Distance, entropy and information (N-C Ch 9, 11, 12; Preskill Ch 10)

- Wrong: $n$ qubits hold $2^n$ bits that can be retrieved. Holds: at most $n$ bits can be extracted ($2n$ with shared entanglement).
- Wrong: the entropy of a source is the entropy of the list of states it prepares. Holds: overlapping states cannot be told apart, so the entropy is lower.
- Wrong: entropy belongs to the system alone. Holds: it depends on what the observer holds; half of a Bell pair has one bit, the pair has none.
- Wrong: 99% gate fidelity is good enough for long circuits. Holds: errors accumulate; about a hundred such gates and an error is likely.
