# claude-tools

A personal collection of Claude Code skills and reference documentation.

## Reference

- [harness](https://www.youtube.com/watch?v=Vj6Iohs-EDs&t=279s)
- [andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills/blob/main/CLAUDE.md)

---

## Skills

### Vercel

Skills from [vercel.com/docs/agent-resources/skills](https://vercel.com/docs/agent-resources/skills).

Install: `npx skills add vercel/<repo> --skill <name>`

| Skill | Source | Description |
|-------|--------|-------------|
| `turborepo` | `vercel/turborepo` | Turborepo monorepo build system — task pipelines, caching, remote cache, `--filter`, CI optimization |
| `next-best-practices` | `vercel-labs/next-skills` | Next.js best practices — file conventions, RSC boundaries, data patterns, async APIs, metadata, error handling, image/font optimization, bundling |
| `vercel-composition-patterns` | `vercel-labs/agent-skills` | React composition patterns — compound components, avoiding boolean prop proliferation, flexible component libraries |
| `vercel-react-best-practices` | `vercel-labs/agent-skills` | React and Next.js performance optimization — 57 rules from Vercel Engineering covering rendering, data fetching, bundle size |

---

### LangChain / LangGraph

Skills from [`langchain-ai/langchain-skills`](https://github.com/langchain-ai/langchain-skills).

Install: `npx skills add langchain-ai/langchain-skills --skill '*'`

#### LangChain

| Skill | Description |
|-------|-------------|
| `langchain-fundamentals` | Create LangChain agents with `create_agent`, define tools, use middleware for human-in-the-loop and error handling |
| `langchain-dependencies` | Package setup for LangChain, LangGraph, LangSmith — required packages, minimum versions, environment requirements (Python & TypeScript) |
| `langchain-middleware` | Human-in-the-loop approval, custom middleware hooks, structured output with Pydantic/Zod |
| `langchain-rag` | Retrieval-augmented generation — document loaders, text splitters, embeddings, vector stores (Chroma, FAISS, Pinecone) |

#### LangGraph

| Skill | Description |
|-------|-------------|
| `langgraph-fundamentals` | StateGraph, state schemas, nodes, edges, `Command`, `Send`, invoke, streaming, error handling |
| `langgraph-cli` | `langgraph` CLI — `new`, `dev`, `build`, `up`, `deploy`, and `langgraph.json` configuration |
| `langgraph-human-in-the-loop` | `interrupt()`, `Command(resume=...)`, approval/validation workflows, 4-tier error handling strategy |
| `langgraph-persistence` | Checkpointers, `thread_id`, time travel, `Store`, subgraph persistence |

#### Deep Agents

| Skill | Description |
|-------|-------------|
| `framework-selection` | Choose the right framework layer (LangChain / LangGraph / Deep Agents) before writing agent code |
| `deep-agents-core` | `create_deep_agent()`, harness architecture, `SKILL.md` format, configuration options |
| `deep-agents-memory` | `StateBackend` (ephemeral), `StoreBackend` (persistent), `FilesystemMiddleware`, `CompositeBackend` |
| `deep-agents-orchestration` | `SubAgentMiddleware`, `TodoList` for planning, human-in-the-loop interrupts |
| `managed-deep-agents` | LangSmith `/v1/deepagents` REST API — agent → MCP server → thread → streamed run flow |
| `swarm` | Dispatch many independent items in parallel — fan out to subagents, aggregate results |

---

### Custom

User-created skills for this project and general development workflows.

| Skill | Description |
|-------|-------------|
| `commit-each` | Split git changes into one commit per logical unit of work |
| `worktree` | Create a new git worktree on a fresh branch before starting work |
| `fsd-scaffold` | Scaffold FSD (Feature-Sliced Design) folder structure for Next.js projects |
| `testing-patterns` | Vitest + Testing Library patterns for Next.js/FSD projects |
| `grill-with-docs` | Stress-test a plan against the project's domain model and update documentation inline |
| `improve-codebase-architecture` | Find architecture improvements and refactoring opportunities informed by `CONTEXT.md` and ADRs |
| `to-prd` | Turn the current conversation context into a PRD and publish to the issue tracker |
