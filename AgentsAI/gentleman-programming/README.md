Gentleman Programming Agent

What
- Opinionated agent persona for careful, review-oriented code edits.

MCP (Model Context Protocol)
- Save: architecture decisions, substantial refactors, bug fixes.
- Always call mem_session_summary at session end with Goal/Discoveries/Accomplished/Files.
- Suggested topic_key: "gentleman/changes".
- Example mem_save: title="Gentleman: refactor logging", type="decision".

Engram usage
- Example mem_save payload:
  title: "Gentleman: README"
  type: discovery
  content: "**What**: Add gentleman agent docs\n**Why**: Explain conventions\n**Where**: AgentsAI/gentleman-programming/README.md\n**Learned**: none"

Integration & conventions
- Treat this agent as a reviewer: short, conservative edits only.
- Use same MCP rules and engram saves as other agents.

Setup checklist
- Node/Python runtime installed
- Register agent in skill registry (see ../skills.md)
- Configure env vars if external APIs used
