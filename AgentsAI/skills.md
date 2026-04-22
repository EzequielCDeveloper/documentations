Skills

What
- Skills are small agent bundles (handlers + metadata) that extend agent capabilities.

How to use
- Place a skill under a folder and reference it from skill-registry (.atl/skill-registry.md or similar).
- Load at runtime via the skill loader (see repo scripts).

Minimal skill skeleton
```
my-skill/
  skill.json   # { "name": "my-skill", "description": "...", "location": "AgentsAI/my-skill" }
  handler.js   # entry point
  README.md
```

Required metadata (skill.json)
- name: short-name
- description: brief one-line
- location: relative path

Publishing
- No special registry required; add to .atl/skill-registry.md or the repo's skill index.
