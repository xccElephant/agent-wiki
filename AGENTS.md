# LLM Wiki Agent Guide

This repository is a template for a persistent, LLM-maintained wiki built on top of raw sources.

This file is intended for Codex-style agents and other tools that read `AGENTS.md`. Keep it aligned with `CLAUDE.md` when changing the workflow.

## Directory Roles

- `raw/` is the immutable source layer.
- `raw/articles/` stores original article notes, clips, and imported markdown sources.
- `raw/assets/` stores local images and attachments.
- `wiki/source-notes/` stores one derived note per source.
- `wiki/entities/` stores concrete entities such as people, orgs, products, tools, papers, and datasets.
- `wiki/concepts/` stores methods, definitions, and recurring ideas.
- `wiki/synthesis/` stores comparisons, theses, timelines, and multi-source analyses.
- `wiki/index.md` is the main navigation page.
- `logs/log.md` is the append-only operational record.
- `schemas/` stores structural guidance and workflow docs.

## Core Rules

- Treat files in `raw/` as source snapshots. Do not silently rewrite them to fix conclusions.
- Put interpretation, corrections, and synthesis in `wiki/`.
- Read `wiki/index.md`, `logs/log.md`, and relevant wiki pages before diving into raw sources.
- Use `[[wikilinks]]` for internal vault references and Markdown links only for external URLs.
- For important claims, point to the relevant `wiki/source-notes/` page and, when useful, the underlying raw source.

## Claim Types

Separate these categories whenever possible:

- `Fact`: directly supported by a source.
- `Inference`: synthesis or interpretation drawn from sources.
- `Dispute`: conflicting claims or unresolved contradictions.
- `Open Question`: gaps, next steps, or hypotheses that still need validation.

## Ingest Workflow

1. Identify the source file in `raw/articles/` or `raw/assets/`.
2. Create or update a matching note in `wiki/source-notes/`.
3. Extract summary, key claims, notable evidence, related entities, related concepts, disputes, and open questions.
4. Update affected pages in `wiki/entities/`, `wiki/concepts/`, and `wiki/synthesis/`.
5. Refresh `wiki/index.md`.
6. Append an entry to `logs/log.md`.

## Default "Update Wiki" Behavior

When the user gives a broad instruction such as:

- "I added some articles, please update the wiki."
- "Process the new sources."
- "Update the wiki with the latest raw files."

interpret it as a batch ingest request unless the user says otherwise.

In that case:

1. Scan `raw/articles/` for candidate sources.
2. Determine which sources are not yet ingested.
3. For each new source, create or update a matching note in `wiki/source-notes/`.
4. Update affected pages in `wiki/entities/`, `wiki/concepts/`, and `wiki/synthesis/`.
5. Refresh `wiki/index.md` when new durable pages are added.
6. Append a batch entry to `logs/log.md`.
7. Run a light lint pass on the touched wiki pages.

Treat a source as already ingested when a corresponding source note already exists and clearly points back to the raw file. Use `raw_path` or an equivalent explicit reference when available. If the state is ambiguous, prefer updating the existing source note instead of creating a duplicate.

## Query Workflow

1. Start from `wiki/index.md` and the most relevant wiki pages.
2. Synthesize from existing wiki content first.
3. Return to `raw/` only when the wiki lacks support or detail.
4. If the answer creates durable knowledge, store it back into `wiki/`.

## Lint Workflow

Look for:

- claims without support
- stale syntheses
- orphan pages
- broken wikilinks
- repeated concepts lacking dedicated pages
- disputes that were flattened away instead of documented