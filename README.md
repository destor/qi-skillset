# qi-skillset

Three AI assistant skills for a quantum computing and quantum information course at the level of Nielsen & Chuang and Preskill's Ph219 lecture notes. Each one is a different way of working on the same material. They use the common `SKILL.md` format, so they work in Claude, ChatGPT and Gemini.

| Skill | Use it when you want to | What the assistant does |
| --- | --- | --- |
| [qi-explainer](skills/qi-explainer/) | have a concept explained ("what is X", "why does X") | Gives a physics-first explanation: what happens physically, then the mathematics as bookkeeping for it, tied to where the textbooks cover it. |
| [qi-tutor](skills/qi-tutor/) | learn a topic step by step, or have your own solution checked | Guides you with scenarios, questions and graded hints instead of answers. If you stay stuck it works a similar problem, and it confirms your result once you have explained it yourself. |
| [qi-inquirer](skills/qi-inquirer/) | be examined on a topic you already know | You explain, the assistant asks ever deeper questions and corrects only if you are far off. |

The assistant picks the skill from how you phrase the request, so "explain decoherence", "let's study decoherence" and "question me on decoherence" start three different kinds of session. Study and questioning sessions end with a summary; paste it at the start of a later session to continue from where you stopped.

## Sources

The skills point to chapters and sections in three textbooks. Two of them are free online:

- Preskill, [Ph219 lecture notes](https://www.preskill.caltech.edu/ph219/) (Caltech course page, with problem sets).
- Wong, [*Introduction to Classical and Quantum Computing*](https://www.thomaswong.net/introduction-to-classical-and-quantum-computing-1e4p.pdf) (PDF from the [author's site](https://www.thomaswong.net/)).
- Nielsen & Chuang, *Quantum Computation and Quantum Information*, 10th anniversary edition (not freely available).

## Importing the skills

First download the zip of each skill you want (`qi-explainer.zip`, `qi-tutor.zip`, `qi-inquirer.zip`) from the [latest release](https://github.com/destor/qi-skillset/releases/latest). Upload the zips as they are: each has the skill folder at its root, which is the layout all three assistants expect. Menu names change between app versions, so look for the nearest match if a label differs.

### Claude

1. Open **Settings → Capabilities** and make sure **Code execution and file creation** is on. Skills need it.
2. Open **Customize → Skills**, click **+**, then **Create skill → Upload a skill**, and select a zip. Repeat for each skill.
3. Check that the skill is switched on in the list, then start a new chat.

### ChatGPT

1. Click your profile icon and choose **Skills** (or go to [chatgpt.com/skills](https://chatgpt.com/skills)).
2. Click **New skill → Upload from your computer** and select a zip. Repeat for each skill.
3. Check that the skill is enabled, then start a new chat.

### Gemini

1. Open [gemini.google.com](https://gemini.google.com) in a browser or the Mac app. Uploading is not available in the mobile app.
2. Go to **Settings → Skills**, choose **Create → Upload** and select a zip. Repeat for each skill.
3. Start a new chat. To update a skill later, upload its whole zip again.

### Local agents (Claude Code in a terminal or VS Code)

Unzip each skill into `~/.claude/skills/` to have it in every project, or into `.claude/skills/` in one project. From a clone of this repository, build and copy instead:

```bash
./scripts/build.sh
cp -R dist/qi-explainer dist/qi-tutor dist/qi-inquirer ~/.claude/skills/
```

## Without skill support: copy-paste prompts

If your plan or app cannot import skills, use a prompt instead. Each release has two prompt files per skill, generated from the skill itself:

| File | Contents | Size |
| --- | --- | --- |
| `<skill>-prompt.md` | The skill's instructions without its reference files. | About 1,500 words |
| `<skill>-prompt-full.md` | The instructions followed by all reference files. | About 6,000 words (tutor, inquirer) or 11,000 words (explainer) |

1. Download the file from the [latest release](https://github.com/destor/qi-skillset/releases/latest) and open it in a text editor.
2. Copy the whole text into the first message of a new chat. The assistant will ask for a topic; reply with just its name, such as "phase kick-back". No extra command is needed. You can also append your topic, question, problem or previous-session summary after the prompt to start directly.
3. Use one prompt per chat. The assistant cannot pick a mode by itself here: the prompt you paste decides whether the chat explains, tutors or questions.

Start with the condensed prompt. Free chats have a limited memory for the conversation, and a long prompt leaves less of it for the session. Without the reference files the assistant cites chapters only and has less detail on each topic. Use the full prompt where the chat accepts it and you want section-level citations. In a long session the assistant may drift from the rules; paste the prompt again if it does.

## Repository layout and building

- `skills/<name>/` holds each skill's own files.
- `shared/` holds files that every skill gets, such as the textbook map. They are merged into each skill when it is built, so the folders in `skills/` are not complete on their own. Import the release zips, not those folders.

To build the zips locally, run `./scripts/build.sh`; they appear in `dist/`. The same run calls `scripts/build-prompts.sh`, which writes the copy-paste prompts to `dist/prompts/`. The prompts contain the skill's own text with nothing rewritten, so they need no separate upkeep.
