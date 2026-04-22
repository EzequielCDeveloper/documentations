Rapid Guide

Commands
- Verify: `opencode doctor`, `npx @anthropic/sdk` test script
- Run agent: `npx opencode run` or agent-specific CLI

Files
- Agents docs: /AgentsAI/*
- Skill registry: .atl/skill-registry.md or AgentsAI/skills.md

Quick MCP steps
1. mem_save after bugfix/decision/config change (include topic_key)
2. At session end call mem_session_summary with Goal/Discoveries/Accomplished/Files
3. Use mem_search before starting to avoid duplicates

One-line mem_save example
```
title: "Add Agent docs" type: discovery content: "**What**: Added /AgentsAI docs\n**Why**: User request\n**Where**: /AgentsAI/*\n**Learned**: none"
```
