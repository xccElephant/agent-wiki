---
title: Workflows
tags:
  - workflow
  - schema
---

# Workflows

## Ingest

1. Determine which sources to ingest.
2. If the user explicitly names source files, use those files only.
3. Otherwise, discover candidate sources in `raw/articles/` or `raw/assets/` and decide which ones are new or need updating.
4. Match each selected source against existing notes in `wiki/source-notes/`.
5. Consider a source already ingested if an existing source note clearly references the raw file, ideally through `raw_path` or an equivalent explicit link.
6. Update existing source notes when possible instead of creating duplicates.
7. Create or update the matching source note in `wiki/source-notes/`.
8. Capture summary, key facts, evidence, related entities, related concepts, disputes, and open questions.
9. Update relevant pages in `wiki/entities/`, `wiki/concepts/`, and `wiki/synthesis/`.
10. Refresh [[wiki/index|LLM Wiki Index]] if new durable pages are added.
11. Append a short record to [[logs/log|Log]].
12. When multiple or auto-discovered sources were processed, append a concise batch summary and run a light lint pass on touched pages for broken links, duplicate concepts, and unsupported claims.

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
