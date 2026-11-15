# Distance measures, entropy and quantum information theory

Material for filling in the eight-step structure in the skill body, for N-C Ch 9, 11 and 12 and Preskill Ch 10.

## The task comes first (steps 1 and 2)

Every quantity in these chapters is the answer to a question about a task: how well can something be done, or how much of a resource does it take, usually for many copies with vanishing error. State the task, the resources and the smallest instance before the formula.

## Quantities as answers to tasks (steps 3 and 4)

- **Trace distance.** Task: one copy of one of two states, guess which. The best possible measurement succeeds with probability ½(1 + D) for equal prior odds. D is the largest difference in outcome probability that any measurement can show between the two states.
- **Fidelity.** Task: test whether a state is the intended one. For pure states the probability of passing is |⟨ψ|φ⟩|². N-C defines fidelity without the square; many papers use the square, so state the convention. In the lab it comes from tomography or, for gates, from randomized benchmarking.
- **Noise cannot help tell states apart.** Any channel brings two states closer in trace distance or leaves it unchanged.
- **Average vs worst case.** Benchmarking reports an average gate fidelity; threshold theorems are stated for worst-case error, which can be much larger for coherent errors.
- **Shannon entropy.** Task: store a long message from a source in as few bits as possible. H bits per symbol are enough and necessary. A coin with p = 0.11 needs about half a bit per toss.
- **Von Neumann entropy.** Task: store a long sequence of states from a quantum source in as few qubits as possible (Schumacher compression). S(ρ) qubits per signal. It equals the Shannon entropy of the probabilities in the basis where ρ is diagonal.
  - It is not the entropy of the list of prepared states. A source emitting |0⟩ or |+⟩ with equal odds has S ≈ 0.60, not 1: non-orthogonal states overlap and cannot be fully told apart.
  - For one half of a pure entangled state, S counts the entanglement in Bell pairs: how much the other half "knows".
- **Holevo bound.** Task: send classical bits by preparing quantum states. n qubits deliver at most n bits, although writing down their state takes 2ⁿ amplitudes. This is the information-theoretic form of "the superposition cannot be read out".
- **Conditional entropy and mutual information.** How uncertain one part is given the other, and how much the parts share. The quantum conditional entropy can be negative (−1 for a Bell pair): the whole is in a definite state while each part alone is completely random.
- **Strong subadditivity.** Discarding part of a system never increases its correlation with another system.
- **Channel capacity.** Task: use a noisy channel many times and send as much as possible with vanishing error. There are several capacities because there are several things to send: classical bits, qubits, or either with shared entanglement as help.
  - Erasure channel (the qubit is lost with probability p, and the loss is flagged): classical capacity 1 − p, quantum capacity 1 − 2p. The quantum capacity reaches zero at p = ½, because then the environment receives as good a copy as the receiver, and both recovering the state would be cloning.
  - Dephasing channel with phase-flip probability p: quantum capacity 1 − H(p).
- **Entanglement as a resource.** Bell pairs are a currency: noisy pairs can be distilled into fewer good ones, and good pairs can be spent on teleportation.

## Real vs bookkeeping (step 6)

- Entropy describes what an observer can predict or extract, given what they hold. The same qubit has entropy 1 for someone holding only it and 0 for someone holding it together with its entangled partner.
- Capacities and compression rates are limits for many uses. They say nothing about a single use.
- A decomposition of ρ into an ensemble is not unique; the entropy depends on ρ alone.

## Cost and consequences (step 7)

- 300 qubits: about 10⁹⁰ amplitudes to describe, at most 300 bits to extract.
- Gate fidelity 99.9% corresponds to roughly a thousand gates before an error is likely.
- Photon loss above 50% in a link gives zero quantum capacity in one direction without help; this is why long-distance links need repeaters or two-way classical communication.

## Classical counterparts (step 8)

- File compression for Shannon and Schumacher compression; parity bits and Shannon's noisy-channel theorem for capacity.
- The analogy breaks at: no copying, so a signal cannot be duplicated to compare routes; signal states that overlap; negative conditional entropy; several distinct capacities for one channel.
