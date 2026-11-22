# Session guide: examples and tools for each phase

Detail for the session flow in the skill body. The hard rules there apply to everything here: one tool or question per turn, and no answer outside hint level 4 and the consolidation. Pick the examples that match the user's topic; do not steer every session toward noise.

## Phase 1: orientation reading

For a user who has read nothing on the topic. The reading sets out the problem, so that the prediction in phase 2 is made from a picture and not guessed; it stops before the result.

- **Noise:** "Read the opening of Wong §4.7, up to the bit-flip code. Find what the text says happens to a qubit that interacts with its surroundings."
- **Algorithms:** "Read the statement of the Deutsch–Jozsa problem in Wong Ch 7, and stop before the circuit. Find what the device computes and what you are promised about it."
- **Entanglement:** "Read Wong §4.3 up to its definition of an entangled state. Find what, according to the text, makes a two-qubit state entangled."
- **Information:** Wong does not cover it. "Read the opening of N-C §11.1, before the properties of the entropy. Find the question about a source of messages that the Shannon entropy answers."

## Phase 2: phenomenon and prediction

Prefer predictions that can be sketched or counted: curves, Bloch-sphere paths, energy-level arrows, tables of amplitudes, expected counts, before/after pictures.

- **Noise:** "An excited transmon sits next to a long cold cable. Sketch the probability that it is still excited as a function of time. What shape, and what physical fact sets that shape?"
- **Algorithms:** "A sealed device computes f(x) for a one-bit input x. You are promised f is either constant or balanced. With ordinary inputs, how many uses does it take to tell which? What single fact about f would settle it, and is that fact the value of f at any one input?"
- **Search:** "Four boxes, one holds a marker. A register is prepared in an equal superposition of the four labels, the checking circuit is applied once, and the register is measured immediately. What is the probability of reading the marked label?"
- **Entanglement:** "A source emits photon pairs. Measured in the horizontal/vertical basis, the two photons always agree. Is that enough to call the pairs entangled? Name a different source that would produce the same data."
- **Error correction:** "Three transmons hold $a \lvert 000 \rangle + b \lvert 111 \rangle$. One of them, you do not know which, has had its bit flipped. What could you measure to find out which one, and what must that measurement not reveal?"
- **Information:** "A source sends $\lvert 0 \rangle$ or $\lvert + \rangle$ with equal odds. How many bits per signal can a receiver extract at best: one, more, or less? Why?"
- **Fault tolerance:** "One ancilla measures the parity of four data qubits, through four controlled gates in turn. A single fault hits the ancilla halfway through. Can that one fault end up as errors on more than one data qubit? Describe how, and what it would mean for a code that corrects any single error."
- **Simulation:** "A chain of 50 spins, each coupled only to its neighbours, evolves for a time $t$. An ordinary computer stores the full state. How much memory does that take, and how does it grow with the length of the chain? What would a quantum computer need instead?"
- **Other platforms:** "A trapped ion stores a qubit in two levels of its outer electron. In one choice the upper level decays in about a second; in another, the two levels are hyperfine levels of the ground state, which do not decay. Predict, for each choice, what limits how long a superposition survives, and what physical effect sets it."

## Phase 3: tools for building the picture

- **Visualization prompts:** ask the user to draw or imagine something specific (the Bloch vector during the process, the joint qubit–environment state as branches, a conveyor belt of fresh environment slices, a timeline of clicks, the two interfering paths of an algorithm).
- **Smallest instance:** have the user write out every amplitude, with its sign, for the smallest case (one query, two qubits, four items) after each step, and say which terms will cancel.
- **Resource counting:** ask what was used up (queries, Bell pairs, classical bits, physical qubits) and what was obtained.
- **Assumption surfacing:** ask what they are assuming ("What did you assume about the cable to get that shape?"), then probe one assumption ("What if the end of the cable were a mirror?").
- **Limiting and extreme cases:** zero temperature vs hot environment, very short vs very long times, one qubit vs n qubits, perfect vs useless environment record, one iteration vs far too many.
- **Thought experiments:** "Put a photodetector at the end of the cable. What does one run look like?" "Give the eavesdropper a perfect copier. What could she then do?"
- **Sanity checks the user performs:** probabilities summing to one, units, symmetry, what a classical device or the best classical method would do.
- **Predict, then observe:** after the user commits to a prediction, give them a way to compare it with the behaviour. Build an interactive visual if the platform can render one; otherwise name what to set up in a simulator they already use, or which published measurement to look up (a $T_1$ decay curve, a Ramsey fringe, a histogram of counts). Never before the prediction; that gives the answer away. Show behaviour, not the formulas the user is meant to find.

## Phase 4: focused reading

- One section or a few pages at a time, never a whole chapter.
- Order: Wong for a first pass where it covers the topic, N-C for the standard treatment, Preskill for the deeper treatment.
- Ask the user to map the textbook's derivation onto their own picture: which line of the textbook corresponds to which physical event or step of the task.
- Examples:
  - "Read N-C §8.3 on amplitude damping. Find the operator that corresponds to 'no photon was emitted'. How does it act on $\lvert 1 \rangle$, and how does that match your picture from phase 3?"
  - "Read N-C §5.2 on phase estimation. Find the step where the phase moves from the lower register to a control qubit. What property of the lower register's state makes that possible?"
  - "Read N-C §10.1 on the bit-flip code. Find the two quantities that are measured. What do they have in common for $\lvert 000 \rangle$ and $\lvert 111 \rangle$?"
  - "Read the part of Preskill Ch 4 on the CHSH inequality. Find the step where the classical bound is derived. Which assumption about the measurement outcomes does it use, and where does your experiment from phase 3 break it?"

## Phase 8: hands-on handoff

Sources of existing exercises: end-of-chapter problems in the relevant N-C chapter, Preskill's Ph219 problem sets (on the course pages for each year), Wong's exercises. Give a specific exercise number only when certain; otherwise name the chapter and topic and let the user find it.

## Hint level 4: choosing the worked example

The example needs the same move as the step the user is stuck on, on a different problem, so that carrying it over is still the user's work.

- Stuck on the coherence rate under amplitude damping: work pure dephasing by a scattered photon (joint state, terms grouped by the photon's record, coherence factor read off).
- Stuck on why one query settles Deutsch's problem: work a single CNOT acting on $\lvert + \rangle \lvert - \rangle$, showing where the phase ends up.
- Stuck on the syndrome of the three-qubit code: work the two-qubit code $a \lvert 00 \rangle + b \lvert 11 \rangle$ with its one parity check, which detects a flip and cannot locate it.
- Stuck on the amplitudes in a four-item search: work two reflections of a vector in a plane for a general angle, with no reference to search.
- Stuck on why Alice's measurement on a Bell pair cannot send Bob a message: work the state $\cos\theta \lvert 00 \rangle + \sin\theta \lvert 11 \rangle$, with Alice either measuring in the $X$ basis or doing nothing, and compute Bob's outcome probabilities in the $Z$ basis in both cases, averaged over Alice's results.
- Stuck on the corrections in teleportation: work one-bit teleportation, in which $a \lvert 0 \rangle + b \lvert 1 \rangle$ is moved onto a fresh $\lvert 0 \rangle$ by a CNOT, the first qubit is measured in the $X$ basis, and a $Z$ correction depends on the result.
- Stuck on the entropy of a source of $\lvert 0 \rangle$ and $\lvert + \rangle$: work a source of $\lvert 0 \rangle$ and $\lvert 1 \rangle$ with probabilities $\tfrac{3}{4}$ and $\tfrac{1}{4}$, then the same probabilities on $\lvert 0 \rangle$ and $\cos\theta \lvert 0 \rangle + \sin\theta \lvert 1 \rangle$ for one chosen $\theta$, both in full.

After the example, ask one question that sends the user back: "Which step of this example corresponds to the step you were stuck on, and what plays the role of the photon there?"

## Further calibration examples

**Algorithms.** User: "Grover's algorithm evaluates all N items at once, so after the oracle the answer can be read out."

- Wrong response: "No, a measurement would give a random item; the amplitude has to be amplified first." (gives the answer)
- Right response: "Check: the readout. Take four items. Write the four amplitudes just before the oracle and just after it. What is the probability of each outcome in the two cases?"

**Error correction.** User: "The syndrome measurement finds the flipped qubit, so it measures the qubits and the superposition collapses."

- Wrong response: "It only measures parities, which are the same for both branches, so a and b are untouched." (gives the answer)
- Right response: "Check: what is measured. Take $a \lvert 000 \rangle + b \lvert 111 \rangle$ with the second qubit flipped. For the question 'do qubits 1 and 2 agree?', work out the answer on each of the two branches separately. What do you notice, and what does that say about what the result can depend on?"

**Entanglement.** User: "When Alice measures her half of the Bell pair, Bob's half collapses, so she can use that to send him a bit."

- Wrong response: "No, Bob's reduced state is $I/2$ whatever Alice does." (gives the answer)
- Right response: "Check: what Bob can see. Say Alice measures in the $Z$ basis to send 1 and does nothing to send 0. Bob measures his half in the $Z$ basis. In each of Alice's two cases, what is the probability that Bob reads 0? What would he need in order to tell the cases apart?"

**Information.** User: "The source sends $\lvert 0 \rangle$ or $\lvert + \rangle$ at random, so its entropy is one bit per signal."

- Wrong response: "The overlap lowers it; the von Neumann entropy is about 0.6 bits." (gives the answer)
- Right response: "Check: the entropy. Could any measurement on one signal tell without error which of the two states was sent? Write the density operator of the source, find its eigenvalues, and compare them with the probabilities of the list."
