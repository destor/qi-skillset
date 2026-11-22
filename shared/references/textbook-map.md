# Textbook map

Where each topic is treated in the three course textbooks. Use it to cite by chapter and section. Anything not listed here: cite the chapter only, or give no reference.

- **N-C:** Nielsen & Chuang, *Quantum Computation and Quantum Information*, 10th anniversary edition.
- **Preskill:** Ph219 lecture notes.
- **Wong:** *Introduction to Classical and Quantum Computing* (2022).

Notes:

- Wong has no density matrices or noise channels; do not cite it for those.
- N-C Ch 7 predates superconducting qubits. For transmon-specific physics, supplement with Krantz et al., "A quantum engineer's guide to superconducting qubits", Appl. Phys. Rev. 6, 021318 (2019).
- N-C Ch 7 also predates neutral-atom arrays. No textbook here covers them; give no section citation for them.
- Preskill: cite it wherever it covers the topic, not only when N-C falls short. Cite by chapter only; the chapters have been revised at different times and section numbering differs between versions.

## Nielsen & Chuang (10th anniversary edition)

- Overview (qubits, Bell states, teleportation, Deutsch and Deutsch–Jozsa): Ch 1 (§1.3, §1.4)
- Introduction to quantum mechanics: Ch 2
  - Linear algebra: §2.1
  - Postulates, measurement, POVMs: §2.2
  - Superdense coding: §2.3
  - Density operator: §2.4; reduced density operator and partial trace: §2.4.3
  - Schmidt decomposition, purification: §2.5
  - EPR and the Bell inequality: §2.6
- Introduction to computer science: Ch 3
  - Models of computation (Turing machines, circuits): §3.1
  - Complexity classes, energy and reversible computation: §3.2
- Quantum circuits: Ch 4
  - Single-qubit operations: §4.2
  - Controlled operations: §4.3
  - Measurement in circuits: §4.4
  - Universal quantum gates: §4.5
  - Simulation of quantum systems: §4.7
  - Solovay–Kitaev theorem: Appendix 3
- Quantum Fourier transform and its applications: Ch 5
  - Quantum Fourier transform: §5.1
  - Phase estimation: §5.2
  - Order finding and factoring: §5.3
  - Period finding, discrete logarithm, hidden subgroup problem: §5.4
- Quantum search algorithms: Ch 6
  - The search algorithm: §6.1
  - Quantum counting: §6.3
  - Optimality of the search algorithm: §6.6
  - Black-box algorithm limits: §6.7
- Physical realizations: Ch 7
  - Conditions for quantum computation: §7.2
  - Harmonic oscillator: §7.3; optical photons: §7.4; cavity QED: §7.5; ion traps: §7.6; NMR: §7.7
- Quantum noise and quantum operations: Ch 8
  - Classical noise and Markov processes: §8.1
  - Environment model, operator-sum representation, axiomatic approach: §8.2
  - Bit flip, phase flip, depolarizing, amplitude damping, phase damping: §8.3
  - Master equations, process tomography: §8.4
- Distance measures: Ch 9
  - Distance measures for classical information: §9.1
  - Trace distance and fidelity: §9.2
  - How well a channel preserves information (gate fidelity): §9.3
- Quantum error correction: Ch 10
  - Three-qubit bit-flip and phase-flip codes: §10.1
  - Shor code: §10.2
  - Theory of QEC, discretization of errors: §10.3
  - Classical linear codes, CSS codes: §10.4
  - Stabilizer codes: §10.5
  - Fault tolerance: §10.6
- Entropy and information: Ch 11
  - Shannon entropy: §11.1
  - Relative, conditional and mutual entropy: §11.2
  - Von Neumann entropy: §11.3
  - Strong subadditivity: §11.4
- Quantum information theory: Ch 12
  - Holevo bound, accessible information: §12.1
  - Data compression (Shannon, Schumacher): §12.2
  - Classical information over noisy quantum channels: §12.3
  - Quantum information over noisy quantum channels: §12.4
  - Entanglement as a physical resource: §12.5
  - Quantum cryptography: §12.6
- Appendices
  - Basic probability theory: Appendix 1
  - Group theory: Appendix 2
  - Number theory, including continued fractions: Appendix 4
  - Public key cryptography and RSA: Appendix 5

## Preskill, Ph219 lecture notes

Available at https://www.preskill.caltech.edu/ph219/ together with the problem sets for each year.

- Ch 1: introduction and overview
- Ch 2: states and ensembles
  - Qubit, spin-1/2 and photon polarization as physical examples
  - Density operator, Bloch sphere for mixed states
  - Schmidt decomposition, purification, ambiguity of the ensemble interpretation
- Ch 3: measurement and evolution
  - Orthogonal and generalized measurements (POVMs)
  - Quantum channels, Kraus operators, dilation to a unitary on a larger system
  - Depolarizing, dephasing and amplitude-damping channels; decoherence
  - Master equation (Lindblad form)
- Ch 4: entanglement
  - EPR pairs, Bell and CHSH inequalities, maximal quantum violation
  - Dense coding, teleportation
  - No-cloning, quantum key distribution
  - Mixed-state and multipartite entanglement
- Ch 5: classical and quantum circuits
  - Classical circuits, complexity classes, reversible computation
  - Quantum circuits, BQP, universal gate sets, Solovay–Kitaev theorem
- Ch 6: quantum algorithms
  - Deutsch–Jozsa, Bernstein–Vazirani, Simon
  - Period finding, quantum Fourier transform, factoring, phase estimation
  - Search (Grover) and its optimality
  - Simulation of quantum systems
- Ch 7: quantum error correction (revised 2026)
  - Shor code, conditions for error correction
  - Classical linear codes, CSS codes, stabilizer codes
- Ch 8: fault-tolerant quantum computation
- Ch 9: topological quantum computation
- Ch 10: quantum Shannon theory
  - Shannon and von Neumann entropy, data compression (Schumacher)
  - Accessible information, Holevo bound
  - Channel capacities, entanglement concentration and dilution

## Wong, Introduction to Classical and Quantum Computing (2022)

- Classical error correction, errors in physical devices: §1.6
- Bloch sphere: §2.4; physical qubits: §2.5
- Entanglement: §4.3; universal gates: §4.6
- Quantum error correction (decoherence, bit-flip code, phase-flip code, Shor code): §4.7
- Bell inequalities, teleportation, superdense coding, QKD: Ch 6
- Algorithms (Deutsch–Jozsa, Bernstein–Vazirani, Simon, Grover, QFT, phase estimation, Shor): Ch 7
