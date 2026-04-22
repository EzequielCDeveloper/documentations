Opencode Setup

Steps
 - Ensure Node >=16 and npm present
 - Clone repo and cd to project root
 - Install local tools: `npm ci` (if package.json present)
 - Optional global CLI: `npm install -g @opencode/cli`

Quick verify
 - `opencode --version` or `npx @opencode/cli --version`
 - Run `opencode doctor` to surface environment issues

Notes
 - If using remote services set OPENCODE_API_KEY
