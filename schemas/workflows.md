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

## Batch Ingest

When the user asks to "update the wiki" after adding new raw sources, treat it as a batch ingest operation.

Recommended behavior:

1. Scan `raw/articles/` for recently added or not-yet-ingested sources.
2. Match each raw source against existing notes in `wiki/source-notes/`.
3. Consider a source already ingested if an existing source note clearly references the raw file, ideally through `raw_path` or an equivalent explicit link.
4. Update existing source notes when possible instead of creating duplicates.
5. Create missing source notes for newly discovered sources.
6. Update affected entity, concept, and synthesis pages.
7. Refresh [[wiki/index|LLM Wiki Index]] if new durable pages are added.
8. Append a batch summary to [[logs/log|Log]].
9. Run a light lint pass on touched pages for broken links, duplicate concepts, and unsupported claims.

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
