---
title: Workflows
tags:
  - workflow
  - schema
---

# Workflows

## Ingest

1. Add a source file to `raw/articles/`.
2. Create or update a matching source note in `wiki/source-notes/`.
3. Capture summary, key facts, evidence, related entities, related concepts, disputes, and open questions.
4. Update relevant pages in `wiki/entities/`, `wiki/concepts/`, and `wiki/synthesis/`.
5. Refresh [[wiki/index|LLM Wiki Index]].
6. Append a short record to [[logs/log|Log]].

## Query

1. Read `wiki/index.md` and the most relevant wiki pages.
2. Synthesize from existing wiki content first.
3. Return to raw sources only when the wiki lacks support or detail.
4. If the answer is durable, save it back into the wiki.

## Lint

Regularly check for:

- unsupported claims
- stale syntheses
- broken links
- orphan pages
- repeated concepts without dedicated pages
- disputes that need to stay explicit
