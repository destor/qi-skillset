# Question moves by stage

One move per turn. Vary them; do not use the same move twice in a row. Every question follows the shape in the skill body: a short frame, then one open question that takes a few sentences to answer.

Moves marked (test) put a wrong or opposing view to the user and must be closed afterwards with "That was a test; your statement stands", or with a correction if the user gave way and could not recover.

## Warm-up

Easy, but still answered in sentences.

- **What is it and what is it for?** "Let's start with the basics of the three-qubit code. Suppose I have never heard of a syndrome. In two or three sentences: what is it, and what is it used for once you have it?"
- **Where does it show up?** "People quote a $T_2$ for every qubit. Describe one experiment in which it is measured: what is done to the qubit, and what is plotted at the end?"
- **Describe an example.** "Noise comes in different kinds. Pick one process that disturbs a qubit without changing its energy, and describe what physically causes it."
- **Before and after.** "Take a qubit that starts in an equal superposition and then sits idle for a long time. Describe its state at the start and at the end, and what changed in between."

## Second-year student

- **Unknown word.** "You said the qubit ends up in a 'mixed state'. I haven't met that term. Explain what it means for the qubit, using things I would know from a first course on waves and probability."
- **Without the word.** "You have used 'entangled' three times and I am not sure I could explain it to someone else. Describe the same situation again without that word: what is true of the two particles?"
- **Example.** "I follow the general statement but I can't picture it. Walk me through one concrete case, with a definite starting state, and tell me what happens to it step by step."
- **In the lab.** "Imagine I am standing next to the experiment while this happens, and I repeat it a thousand times. Describe what I would record, and how that record shows the effect you just explained."
- **Why, one level further.** "You said the excited qubit decays into the cable. I accept that it can, but explain why it goes that way round: why does the energy leave the qubit instead of coming back into it?" Continue until the answer is an experimental fact or a postulate, then stop.
- **Simpler.** "I lost you when the second qubit came in. Go back to a single qubit and take me through the same argument, and tell me at which point the second qubit becomes necessary."
- **Analogy, then its limit.** "Is this like anything I already know from classical physics? Describe the comparison and what corresponds to what." Then: "Take that comparison seriously for a moment. Describe a situation where it would predict the wrong thing."
- **Rough size.** "I have no feeling for the scales here. Roughly how long does this take in a real device, what are you comparing that time with, and why does the comparison matter?"
- **Wrong restatement (test).** "Let me say it back to check I have it. The qubit is really 0 or 1 all along, we just don't know which, and the experiment finds out. If that is not right, explain what my version would get wrong."
- **Naive objection (test).** "Earlier you told me a quantum state cannot be copied. Now you put the same information on three qubits. To me that looks like copying. Explain how both statements hold."

## Sceptical colleague

- **Opposing position (test).** "I'm not convinced dephasing is anything quantum. The qubit's frequency wanders, we don't know by how much, so we average. That is ordinary classical uncertainty. Make the case that there is more to it, and say what observation would settle it."
- **Edge case.** "Your account assumed the cable is cold. Now warm it up so that it sometimes hands energy back. Describe what changes in your picture and what stays."
- **Hidden assumption.** "You got an exponential decay. That does not come for free. Explain what you assumed about the environment to get it, and what the decay would look like if that assumption failed."
- **Consistency.** "Earlier you said the syndrome reveals nothing about the encoded data. Just now you said it tells you which qubit flipped. Those sound contradictory. Explain how both hold."
- **Reverse.** "Suppose your statement were false. Describe what would look different in the measured data, so that someone could tell."
- **Connect two subjects.** "We talked about the record the environment keeps, and separately about syndrome measurements. Explain how the two are related: what plays the role of the record in error correction, and why does it not do the damage the environment does?"
- **Model versus physics.** "You described the noise as a random Z gate. Is that what happens in the device, or a way of writing it down? Explain what you would say to someone who took it literally."
- **Cost.** "Suppose I want to do this at a useful scale. Describe what it costs in qubits, gates or queries, how that grows with the size of the problem, and which of those costs hurts first."

## When the answer is one or two words

Do not move on. Take the short answer as given and ask for what is behind it: "You say it goes to zero. Take me through why: what is happening to the qubit while it does?"

## Signs of a shaky answer

- A term is defined by another term of the field, or by itself.
- A formula is recited with no statement of what it describes.
- The answer would fit several different questions.
- No example can be produced when asked.
- The user changes a correct statement at the first sign of doubt.
- Heavy hedging ("sort of", "basically", "in some sense") around the key step.

## Signs of a solid answer

- It uses only words the current listener has, or defines the others on the way.
- It contains a reason, an example or an observable consequence.
- It survives the next "why?".
- The user says where their own explanation stops ("beyond this I only know the formula").
