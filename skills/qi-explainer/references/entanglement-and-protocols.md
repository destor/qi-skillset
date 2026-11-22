# Entanglement, measurement and protocols

Material for filling in the eight-step structure in the skill body, for N-C §1.3, §2.2 to §2.6 and §12.5 to §12.6, and Preskill Ch 2 to 4.

## Platforms and mechanisms (step 1)

- Photon pairs from parametric down-conversion: one pump photon splits into two whose polarizations are linked by conservation laws. Vivid for Bell tests, teleportation and key distribution.
- Trapped ions entangled through their shared motion; transmons through a controlled-phase interaction. Vivid for entanglement made on demand by a gate.
- NV centres in separate labs entangled by interfering their emitted photons (the 2015 Delft Bell test, 1.3 km apart).

Entanglement is made by an interaction whose effect on one system depends on the state of the other, or by a common source.

## Building the picture (steps 2 to 4)

- **Density operator.** Two situations that no measurement on the qubit can tell apart: someone prepares $\lvert 0 \rangle$ or $\lvert 1 \rangle$ at random and does not say which, or the qubit is one half of a Bell pair. Both give random results in every basis, and no state vector describes either. What remains of the predictions is $\rho = \sum_i p_i \lvert \psi_i \rangle\langle \psi_i \rvert$: in the first case an average over the ensemble, in the second the reduced state. Working definition: Hermitian, positive, trace 1; outcome $\lvert m \rangle$ has probability $\langle m \rvert \rho \lvert m \rangle$; the state is pure exactly when $\operatorname{tr} \rho^2 = 1$.
- **Bloch ball.** $\rho = \tfrac{1}{2} (I + \vec{r} \cdot \vec{\sigma})$ with $\lvert \vec{r} \rvert \le 1$: pure states on the surface, mixed states inside, $I/2$ at the centre. Noise moves the point inward.
- **Ensembles are not unique.** $I/2$ is an equal mixture of $\lvert 0 \rangle$ and $\lvert 1 \rangle$, and equally of $\lvert + \rangle$ and $\lvert - \rangle$; nothing measured on the qubit tells which was prepared. Two ensembles give the same $\rho$ exactly when they are related by a unitary mixing (N-C §2.4).
- **Mixed-state entanglement.** The Werner state $p \lvert \Phi^+ \rangle\langle \Phi^+ \rvert + (1 - p) I/4$ is entangled for $p > 1/3$ but violates CHSH only for $p > 1/\sqrt{2}$, since its largest $S$ is $2\sqrt{2}\, p$. Between the two values it is entangled and shows no CHSH violation.

- **Correlation in more than one basis.** Measure both halves of a Bell pair along Z: the results always agree. A source emitting 00 or 11 at random does that too. Measure both along X: the Bell pair still agrees, the random source does not. Entanglement shows only when more than one measurement setting is compared.
- **Nothing in the parts.** Each half alone gives completely random results in every basis (reduced state I/2). The information is in the correlations. This is the mechanism of decoherence seen from the other side: a qubit entangled with anything else looks mixed on its own.
- **Schmidt decomposition.** For a pure state of two parties there is one pair of local bases in which outcomes are perfectly matched one to one. More than one term means entangled; the weights say how much.
- **Purification.** Any mixed state can be treated as one half of a pure entangled state of a larger system: the "record held elsewhere" picture run backwards.
- **Bell and CHSH.** Two parties each choose one of two settings per run and record $\pm 1$. Combine the four measured correlations into $S$. Any account in which outcomes are fixed in advance and local gives $\lvert S \rvert \le 2$; a Bell pair with the right settings gives $2\sqrt{2} \approx 2.83$. In the lab: four setting combinations, coincidence counts, one number.
- **No signalling.** One party's statistics do not depend on the other's choice of setting. The correlations appear only when the two records are brought together over an ordinary channel.
- **No cloning.** A copying interaction (a CNOT onto a blank qubit) copies $\lvert 0 \rangle$ and $\lvert 1 \rangle$, and applied to a superposition it produces entanglement, not two copies. Copying is what measurement does: it works for one basis only.
- **Generalized measurement (POVM).** Let the system interact with an auxiliary system and read that one out. This gives measurements with more outcomes than the system has levels, such as telling two non-orthogonal states apart with a third outcome "cannot tell", and it describes real detectors with loss and noise.
- **Teleportation.** One shared Bell pair and two classical bits move one qubit state. The sender's joint measurement gives two uniformly random bits that say nothing about the state; the receiver's qubit is completely random until those bits arrive and select one of four corrections. The original is destroyed.
- **Superdense coding.** The reverse trade: one shared Bell pair and one transmitted qubit carry two classical bits.
- **Key distribution.** Learning about a state disturbs it. In BB84, an eavesdropper who measures and resends causes 25% errors in the sifted key. In entanglement-based schemes a Bell violation certifies that nobody else is correlated with the key (monogamy: a maximally entangled pair cannot be correlated with a third system).

## Real vs bookkeeping (step 6)

- Collapse of the distant half is an update of what can be predicted given a local result; no experiment at the distant side detects it.
- In teleportation nothing travels faster than the classical bits, and the state is not contained in those bits.
- The Bell pair is a resource that is used up: one pair per teleported qubit.

## Cost and consequences (step 7)

- Loophole-free Bell test (Hensen et al., 2015): $S = 2.42 \pm 0.20$ against the bound of 2.
- Two-qubit gate fidelities: about 99.9% in trapped ions, 99.5 to 99.9% in transmons; this limits the quality of entanglement made on demand.
- Distance records: teleportation over 143 km of free space (2012); entangled photons delivered from a satellite to stations 1200 km apart (2017). Photon loss, not decoherence, is the limit, which is why repeaters and entanglement distillation exist.
- Entanglement cannot be increased by local operations and classical communication; it has to be distributed physically.

## Classical counterparts (step 8)

- A pair of gloves in two boxes, or shared random bits: explains agreement in one basis, fails the CHSH bound.
- One-time pad: the Bell pair plays the role of the shared key and the two classical bits the role of the ciphertext, which is uniformly random on its own. The break: key plus ciphertext give a message that can be copied; teleportation delivers a state that cannot.
