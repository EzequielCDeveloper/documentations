How-to: Use Agents in this Repo

Launching
- Run agents via their CLI or `npx` wrappers (see each README).

Where docs live
- Agents docs: /AgentsAI/*
- Skill registry: .atl/skill-registry.md or AgentsAI/skills.md

Naming conventions
- Agent folders: kebab-case (e.g. claude-code)
- topic_key: use `<agent>/<area>` (e.g. opencode/changes)

FAQ
1. Q: Where to save session summaries? A: Always call mem_session_summary at session end.
2. Q: How to register a new skill? A: Add folder + skill.json and list it in skill-registry.
3. Q: Who rotates API keys? A: CI/secrets manager; document in configure.md.
