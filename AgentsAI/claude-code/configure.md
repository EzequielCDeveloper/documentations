Claude-Code Configuration

Env vars
- CLAUDE_API_KEY or ANTHROPIC_API_KEY
- CLAUDE_BASE_URL (if using proxy)

Client options
- timeout: 60s
- model: claude-2 or configured variant

Example .env
```
CLAUDE_API_KEY=sk_xxx
CLAUDE_BASE_URL=https://api.anthropic.com
MODEL=claude-2
```

Security
- Rotate keys regularly; use secrets manager in CI.
