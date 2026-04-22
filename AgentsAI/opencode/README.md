Opencode Agent

What

- Lightweight agent bundle for repository automation and SDD workflows.

MCP (Model Context Protocol)

- Always call mem_save after: bug fixes, config changes, architecture decisions.
- Before ending a session call mem_session_summary with Goal/Discoveries/Accomplished/Files.
- Suggested topic_key: "opencode/changes".
- Example mem_save fields: title="Fix opencode CLI", type="bugfix".

Engram usage

- Example mem_save payload:
  title: "Opencode: initial docs"
  type: discovery
  content: "**What**: Added README for Opencode\n**Why**: Provide quickstart\n**Where**: AgentsAI/opencode/README.md\n**Learned**: none"

Install & configure

- Requirements: Node >=16, npm, git
- Install: `npm install -g @opencode/cli` (or repo-specific package)
- Env: OPENCODE_API_KEY (if using remote features)

Common commands

- `opencode init` # create workspace
- `opencode run` # run agent task
- `opencode doctor` # validate config

Configuration

- See **setup.md** and **configure.md** in this folder for minimal options.
