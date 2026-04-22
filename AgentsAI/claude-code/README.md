Claude-Code Agent

What
- Integration wrapper for Anthropic Claude-style coding agents.

MCP (Model Context Protocol)
- Save important changes with mem_save: bugfix, decision, config changes.
- Call mem_session_summary at session end with Goal/Discoveries/Accomplished/Files.
- Suggested topic_key: "claude-code/sessions".
- Example mem_save fields: title="Claude: add codegen helper", type="decision".

Engram usage
- Example mem_save payload:
  title: "Claude-code: initial README"
  type: discovery
  content: "**What**: Add claude-code docs\n**Why**: Document integration\n**Where**: AgentsAI/claude-code/README.md\n**Learned**: none"

Install & configure
- Requirements: Node >=16 or Python 3.10 depending on client
- Set environment variables: CLAUDE_API_KEY or ANTHROPIC_API_KEY
- Install client: `npm i @anthropic/sdk` or pip package

Common commands
- npx claude-code --help
- node scripts/run-claude.js

See setup.md and configure.md for minimal wiring.
