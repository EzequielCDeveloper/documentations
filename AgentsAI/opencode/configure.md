Opencode Configuration

Minimal settings
- opencode.yaml (root or .opencode/opencode.yaml)
  - apiKey: ${OPENCODE_API_KEY}
  - defaultAgent: opencode

Example snippet
```
apiKey: "${OPENCODE_API_KEY}"
defaultAgent: "opencode"
```

Where to edit
- Project-level: ./opencode.yaml
- User-level: ~/.opencode/config

Tip
- Keep secrets in env vars; avoid committing keys into repo.
