---
title: Wiki Workflow
tags:
  - wiki
  - workflow
---

# Wiki Workflow

This template uses a two-layer knowledge workflow:

- `raw/` holds source snapshots.
- `wiki/` holds derived knowledge maintained over time.

## Start Here

- Read [[wiki/index|LLM Wiki Index]].
- Read [[schemas/wiki-schema|Wiki Schema]] for page roles.
- Read [[schemas/workflows|Workflows]] for ingest, query, and lint guidance.
- Read [[logs/log|Log]] for the history of changes.

## Core Operations

### Ingest

1. Add a source to `raw/articles/`.
2. Create or update a note in `wiki/source-notes/`.
3. Update related entity, concept, or synthesis pages.
4. Refresh [[wiki/index|LLM Wiki Index]] and append to [[logs/log|Log]].

### Query

1. Search `wiki/` first.
2. Return to `raw/` only when support or detail is missing.
3. Save durable answers back into the wiki.

### Lint

Check for unsupported claims, stale syntheses, orphan pages, broken links, and unresolved disputes.
