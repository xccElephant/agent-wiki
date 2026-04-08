# llm-wiki-obsidian-template

An Obsidian template for building a persistent, LLM-maintained wiki with Cursor, Claude Code, or Codex-style agents.

## Credit

Inspired by Andrej Karpathy's original **LLM Wiki** idea:

- [Karpathy gist: LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f#file-llm-wiki-md)

This is an independent implementation template, not the original concept note or an official Karpathy repository.

## What You Get

- `raw/` for source snapshots
- `wiki/` for derived knowledge
- `AGENTS.md` for Codex-style agents
- `CLAUDE.md` for Claude Code
- `.cursor/rules/` for Cursor
- starter schema and note templates

## Quick Start

1. Clone or copy the repo into an Obsidian vault:

```bash
git clone https://github.com/xccElephant/llm-wiki-obsidian-template.git
```

2. Open the folder in Obsidian.
3. Open the same folder in Cursor, Claude Code, or Codex.
4. Run the bootstrap script:

```bash
./install.sh
```

5. Put sources in `raw/articles/`.
6. Ask your agent to ingest them into `wiki/source-notes/`.

## Existing Vault

If you already have an Obsidian vault, copy these into it:

- `AGENTS.md`
- `CLAUDE.md`
- `.cursor/rules/`
- `raw/`
- `wiki/`
- `logs/`
- `schemas/`
- `install.sh`

Then run:

```bash
./install.sh
```

## Template Files

This repo tracks reusable template files, not your day-to-day vault state.

- `wiki/index.template.md` is the tracked starter index.
- `logs/log.template.md` is the tracked starter log.
- `wiki/*/_template.md` files are starter note shapes.
- Live files such as `wiki/index.md`, `logs/log.md`, and your real notes are intentionally not tracked in this setup.

Use `./install.sh` for bootstrap. Treat the `_template.md` files as reference shapes for new notes rather than as the primary installation path.

## Agent Compatibility

- **Cursor**: uses `.cursor/rules/` and can also benefit from `AGENTS.md`
- **Claude Code**: reads `CLAUDE.md`
- **Codex-style agents**: read `AGENTS.md`

Keep `AGENTS.md` and `CLAUDE.md` aligned if you change the workflow.

## Example Prompts

- `Read AGENTS.md and ingest raw/articles/article.md into wiki/source-notes/. Update related concept or entity pages and append to logs/log.md.`
- `Read CLAUDE.md and ingest raw/articles/article.md into wiki/source-notes/. Update related concept or entity pages and append to logs/log.md.`
- `Read wiki/index.md and answer: what do we currently know about <topic>? File the answer back into wiki/synthesis/ if it is durable.`
- `Lint this vault for unsupported claims, stale syntheses, missing source-notes, orphan pages, and broken wikilinks.`

## License

MIT.

