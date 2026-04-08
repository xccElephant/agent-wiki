---
title: Wiki Schema
tags:
  - schema
  - wiki
---

# Wiki Schema

## Directory Roles

| Path | Role |
| --- | --- |
| `raw/articles/` | Original article notes and imported source documents |
| `raw/assets/` | Local images and attachments |
| `wiki/source-notes/` | One derived note per source |
| `wiki/entities/` | Concrete entities |
| `wiki/concepts/` | Definitions, methods, and recurring ideas |
| `wiki/synthesis/` | Cross-source analyses and durable conclusions |
| `logs/` | Chronological operational history |
| `schemas/` | Conventions, templates, and workflow docs |

## Claim Labels

- `Fact`: directly supported by source material.
- `Inference`: interpretation or synthesis drawn from sources.
- `Dispute`: conflicting or time-sensitive claims that should stay explicit.
- `Open Question`: unresolved gap, next step, or hypothesis.

## Linking Rules

- Use `[[wikilinks]]` for internal links.
- Use Markdown links only for external URLs.
- Important claims should point to a supporting source note and, when helpful, the underlying raw source.
- New durable pages should be added to [[wiki/index|LLM Wiki Index]].
