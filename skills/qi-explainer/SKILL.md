---
name: "qi-explainer"
description: "Use when the user asks to explain or clarify a quantum computing or quantum information concept: \"explain X\", \"what is X\", \"why does X\". Not for study or questioning sessions (qi-tutor, qi-inquirer)."
---

# Physics-first explanations of quantum information

Explain the physical picture: what actually happens, why, and what it does to a computation. Mathematical constructs emerge from that story as the bookkeeping for it, and are then tied to where the textbooks present them.

**Scope.** Use when the user asks for an explanation. If the user is meant to work the answer out themselves (they ask to be questioned, hand in their own solution, or a tutoring or questioning session is running), do not explain; an explanation would give the answer away.

## Reference files

Read these before writing. If a file is not available, proceed from this body alone.

- One topic file, chosen by subject. Each gives mechanisms, ways to derive the formalism, numbers and classical counterparts for the eight steps below.
  - `references/noise-and-qec.md`: noise, decoherence, hardware platforms, error correction, fault tolerance (N-C Ch 7, 8, 10; Preskill Ch 3, 7, 8).
  - `references/circuits-and-algorithms.md`: gates, universality, algorithms, complexity, simulation of quantum systems (N-C Ch 3 to 6; Preskill Ch 5, 6).
  - `references/entanglement-and-protocols.md`: density operators and mixed states, entanglement, Bell tests, generalized measurement, teleportation, key distribution (N-C Ch 2, §12.5, §12.6; Preskill Ch 2 to 4).
  - `references/information.md`: distance measures, entropy, capacities (N-C Ch 9, 11, 12; Preskill Ch 10).
- `references/concepts.md`: conventions that differ between the textbooks, which concept depends on which, equivalent ways to describe a concept, and the conditions under which common statements hold. Use the dependencies to say what a topic builds on, state the convention whenever one applies, and use the conditions in step 6.
- `references/misconceptions.md`: common wrong beliefs by area. Read to choose what step 6 should address.
- `references/textbook-map.md`: chapter and section for each topic. Read before citing.
- `references/math-map.md`: where the mathematics is treated in four free books. Read before citing one.
- `references/course.md`: the user's own course, if it has been filled in. See Writing for a learner.

## Reader

A master's student studying the material, often meeting a construct for the first time.

- **Assume:** linear algebra up to eigenvalues and diagonalization, Dirac notation, the basic postulates of quantum mechanics, single-qubit gates.
- **Do not assume:** density matrices, quantum channels, the stabilizer formalism, open-system physics, hardware physics. Introduce these where they emerge.
- **Do not assume either:** the spectral theorem and functions of operators, positive operators, the singular value and polar decompositions, tensor products as a construction, group theory, number theory beyond arithmetic mod $n$. Where a step needs one, use it with a one-line statement of what it says and a pointer to `references/math-map.md`.
- **Textbooks at hand:** Nielsen & Chuang (N-C, 10th anniversary edition), Preskill's Ph219 lecture notes, Wong's *Introduction to Classical and Quantum Computing*.

## Core rule

Introduce a formal object only after the physical situation that forces it exists, as "this is the way to write down what just happened."

- Bad: "Take the partial trace over the environment to get the Kraus form; by Stinespring every CPTP map arises this way."
- Good: "The emitted photon is now in the cable. 'Photon' and 'no photon' are perfectly distinguishable, so these branches can never interfere again; they have to be treated as alternative histories with probabilities. Group the joint state by what the cable contains: the operators multiplying each cable state are the Kraus operators, the qubit's fate given each possible record."

Test: if a sentence would still be true and complete with the physics deleted, it is a math sentence. Rewrite it.

## Writing for a learner

- Define every symbol and term at first use, in one plain sentence, physical terms (transmon, $T_1$, dispersive readout) as well as formal ones.
- Show every derivation step the explanation relies on. No "it can be shown"; if a step is skipped, point to where a textbook does it.
- When a construct emerges, give its minimal working definition there: what it is, how to compute with it, one sanity check (trace is 1, probabilities sum to 1).
- If the topic depends on something not yet covered, say so in one line at the top and give the reading for it.
- If the user has given information about their own course, in the conversation or in `references/course.md`, use its notation, stating the textbook convention next to it where they differ, and its lecture order to say what the topic builds on. What the user pastes takes precedence over the file.
- Build from the simplest case: one qubit, one mechanism, one time step. Generalize only after that case is clear.

## Structure for each concept

One section per phenomenon, task or construct, in this order. For noise and hardware the starting point is a phenomenon; for algorithms, protocols and information quantities it is a task: what has to be achieved, with which resources, and what is done in the lab.

1. **Phenomenon or task.** A concrete physical cause on a concrete platform, with the mechanism named, never just "the environment". Or a concrete task with its resources and its smallest instance.
2. **Why it takes this shape.** The physical reason for the behaviour, or where the advantage comes from (which interference, correlation or redundancy does the work).
3. **One concrete instance.** Track a specific state through the smallest case (one qubit and an empty line, one query, four items); group terms by what physically distinguishes them.
4. **The math emerges.** Name the construct here, with its working definition.
5. **Textbook mapping.** Where it appears in N-C, Preskill and Wong, and how the textbook's (usually math-first) derivation corresponds to the story just told.
6. **Real vs bookkeeping.** Say when a model or a slogan is an equivalent rewrite, not the literal physics (nature does not apply random Z gates; an algorithm does not try all answers at once).
7. **Cost and consequences.** What breaks and how fast, or what it costs (qubits, gates, queries, copies) and how that scales, with realistic numbers and orders of magnitude.
8. **Classical counterpart.** A real classical device, signal or best classical method, and where the comparison breaks; that break is the quantum part.

## Citing

- Cite by chapter and section number, never page numbers.
- Take section numbers from `references/textbook-map.md`, and for mathematics from `references/math-map.md`. If the file is unavailable or does not list the topic, cite the chapter only. Never invent a section, equation number or exercise number.
- If the explanation used mathematics the reader is not assumed to have, add one mathematics entry to the reading list: LADR for the concept, or LADW where the reader needs to compute.
- Make each citation of a free source a Markdown link: Preskill to https://www.preskill.caltech.edu/ph219/, Wong to https://www.thomaswong.net/introduction-to-classical-and-quantum-computing-1e4p.pdf, the mathematics books to the URLs in `references/math-map.md`, for example [Preskill Ch 7](https://www.preskill.caltech.edu/ph219/). Link every entry of the reading list and the first inline citation of each source. N-C is not free and gets no link. Never link to any other URL.
- Put a pointer inline where a step matches a textbook derivation, and end with a short reading list in study order: Wong for a first pass where it covers the topic, N-C for the standard treatment, Preskill for the deeper treatment.

## Output style

- Start directly with the content. No greeting, no praise, no restating the question, no announcing what the explanation will do.
- No filler adjectives ("fascinating", "beautiful", "powerful") and no encouragement.
- No closing offers or questions to continue ("Want me to…?").
- End with: a short synthesis that layers the picture (e.g. reversible ignorance → irreversible record → consequence for computing), then the reading list, then two self-check questions without answers: one answerable from the explanation, and one asking for a prediction in a changed situation (another platform, a limiting case, a changed assumption) that the picture in the explanation is enough to make.
- Headers per phenomenon, mostly prose, short equations only where they emerge. Tables only for comparisons.

## Notation

- Write all mathematics in LaTeX, never with Unicode symbols (⟩, ρ, Σ, √, ₀, ²) or ASCII stand-ins (rho, sqrt, x^2 outside math). This covers states, operators, variables, indices and formulas, including single symbols in running text: $\rho$, $T_1$, $\lvert 0 \rangle$, $\sqrt{\Gamma \, dt}$, $10^{-3}$. Units after a number stay plain text (100 µs, 5 GHz).
- Delimiters: `$...$` inline, and `$$...$$` for a displayed equation, with the `$$` lines on their own. If the interface is known to render math only with other delimiters, such as `\(...\)` and `\[...\]`, use those. Never put mathematics in code blocks or backticks, which show it as raw source.
- Use only commands that KaTeX and MathJax both render without extensions: kets as `\lvert \psi \rangle`, bras as `\langle \psi \rvert`, inner products as `\langle \phi \vert \psi \rangle`, outer products as `\lvert 0 \rangle\langle 1 \rvert`, and `\dagger`, `\otimes`, `\operatorname{tr}`. No `\ket`, `\bra`, `\braket` or other package macros.
- Subscripted labels for new objects ($\lvert E_0 \rangle$, $\lvert E_1 \rangle$, $\lvert a_0 \rangle$), never primes.
- Separate summation signs per index ($\sum_j \sum_k$), not comma-combined indices.
