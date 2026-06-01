# claude-tools

A personal collection of Claude Code skills, subagents, and commands.

## Reference

- [harness](https://www.youtube.com/watch?v=Vj6Iohs-EDs&t=279s)
- [andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills/blob/main/CLAUDE.md)

---

## Plugins

Installed via `/plugin install` — loaded through Claude Code's plugin system, not as files.

| Plugin | Marketplace | Description |
|--------|-------------|-------------|
| `superpowers` | `claude-plugins-official` | Process skills for brainstorming, debugging, TDD, code review, plan writing, git worktrees, and more |
| `vercel` | `claude-plugins-official` | Vercel deployment, environment variables, Next.js, AI SDK, shadcn, and infrastructure skills |
| `skill-creator` | `claude-plugins-official` | Create, improve, and benchmark Claude Code skills |
| `code-review` | `claude-code-plugins` | Code review with inline PR comments and auto-fix |
| `firebase` | `firebase` | Firebase skills — Firestore, Auth, Hosting, App Hosting, Security Rules, Genkit |

---

## Skills

### gstack (Global)

Skills from [`garrytan/gstack`](https://github.com/garrytan/gstack), installed globally at `~/.claude/skills/`. Available across all projects on this machine.

| Skill | Description |
|-------|-------------|
| `autoplan` | Auto-generate a plan before starting work |
| `benchmark` / `benchmark-models` | Benchmark and compare model outputs |
| `browse` / `scrape` | Browse and scrape web content |
| `canary` | Canary deployment workflows |
| `careful` | Extra-cautious mode for risky operations |
| `codex` | Codex integration workflows |
| `connect-chrome` / `open-gstack-browser` | Connect to and control a Chrome browser |
| `context-save` / `context-restore` | Save and restore session context |
| `cso` | CSO-level review and strategy |
| `design-consultation` / `design-html` / `design-review` / `design-shotgun` | Design review and HTML generation workflows |
| `devex-review` | Developer experience review |
| `document-release` | Generate release documentation |
| `freeze` / `unfreeze` | Freeze and unfreeze project state |
| `gstack` / `gstack-upgrade` | Core gstack skill and upgrade workflow |
| `guard` | Guard against unsafe operations |
| `health` | Project health check |
| `investigate` | Deep investigation workflow |
| `land-and-deploy` | Land a PR and trigger deployment |
| `landing-report` | Generate a landing/deployment report |
| `learn` | Learn from the codebase |
| `make-pdf` | Generate PDF documents |
| `office-hours` | Office hours Q&A workflow |
| `pair-agent` | Spawn a paired agent for collaboration |
| `plan-ceo-review` / `plan-design-review` / `plan-devex-review` / `plan-eng-review` / `plan-tune` | Plan review workflows by role |
| `qa` / `qa-only` | QA and testing workflows |
| `retro` | Sprint retrospective workflow |
| `review` | Code review workflow |
| `setup-browser-cookies` / `setup-deploy` / `setup-gbrain` | Setup and configuration workflows |
| `ship` | Ship a feature end-to-end |
| `skillify` | Convert a workflow into a reusable skill |
| `sync-gbrain` | Sync with gbrain knowledge base |

### Vercel

Skills from [vercel.com/docs/agent-resources/skills](https://vercel.com/docs/agent-resources/skills).

| Skill | Source | Description |
|-------|--------|-------------|
| `turborepo` | `vercel/turborepo` | Turborepo monorepo build system — task pipelines, caching, remote cache, `--filter`, CI optimization |
| `next-best-practices` | `vercel-labs/next-skills` | Next.js best practices — file conventions, RSC boundaries, data patterns, async APIs, metadata, error handling, image/font optimization, bundling |
| `vercel-composition-patterns` | `vercel-labs/agent-skills` | React composition patterns — compound components, avoiding boolean prop proliferation, flexible component libraries |
| `vercel-react-best-practices` | `vercel-labs/agent-skills` | React and Next.js performance optimization — 57 rules from Vercel Engineering covering rendering, data fetching, bundle size |

### AWS

Skills from [`aws/agent-toolkit-for-aws`](https://github.com/aws/agent-toolkit-for-aws) — AWS 공식.

#### Core Skills

| Skill | Description |
|-------|-------------|
| `amazon-bedrock` | Amazon Bedrock — foundation models, inference, fine-tuning |
| `aws-amplify` | AWS Amplify — full-stack web and mobile app development |
| `aws-billing-and-cost-management` | Cost Explorer, Budgets, billing alerts |
| `aws-cdk` | AWS CDK — infrastructure as code with TypeScript/Python |
| `aws-cloudformation` | CloudFormation — stack management, templates, change sets |
| `aws-containers` | ECS, EKS, Fargate — container orchestration |
| `aws-iam` | IAM — roles, policies, permissions, least privilege |
| `aws-messaging-and-streaming` | SQS, SNS, EventBridge, Kinesis |
| `aws-observability` | CloudWatch, X-Ray, logging and monitoring |
| `aws-sdk-js-v3-usage` | AWS SDK for JavaScript v3 usage patterns |
| `aws-sdk-python-usage` | AWS SDK for Python (boto3) usage patterns |
| `aws-serverless` | Lambda, API Gateway, SAM — serverless architecture |

#### Bedrock Agents

| Skill | Description |
|-------|-------------|
| `agents-get-started` | Getting started with Amazon Bedrock Agents |
| `agents-build` | Build and configure Bedrock Agents |
| `agents-deploy` | Deploy Bedrock Agents to production |
| `agents-connect` | Connect agents to data sources and APIs |
| `agents-debug` | Debug and troubleshoot Bedrock Agents |
| `agents-harden` | Security hardening for Bedrock Agents |
| `agents-optimize` | Performance optimization for Bedrock Agents |

#### Analytics / Data Lake

| Skill | Description |
|-------|-------------|
| `connecting-to-data-source` | Connect to S3, RDS, Redshift, and other data sources |
| `creating-data-lake-table` | Create and manage data lake tables |
| `exploring-data-catalog` | Explore AWS Glue Data Catalog |
| `finding-data-lake-assets` | Find and discover data lake assets |
| `ingesting-into-data-lake` | Ingest data into S3-based data lakes |
| `querying-data-lake` | Query data with Athena |
| `storing-and-querying-vectors` | Vector storage and similarity search with OpenSearch |

---

### LangChain / LangGraph

Skills from [`langchain-ai/langchain-skills`](https://github.com/langchain-ai/langchain-skills).

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

### Custom

User-created skills for general development workflows.

| Skill | Description |
|-------|-------------|
| `commit-each` | Split git changes into one commit per logical unit of work |
| `worktree` | Create a new git worktree on a fresh branch before starting work |
| `start-branch` | Create a new branch (from current position) with a `feat/fix/chore/…` name and switch to it |
| `start-branch-from-dev` | Pull latest `dev`, then create a new branch from it with an appropriate name |
| `fsd-scaffold` | Scaffold FSD (Feature-Sliced Design) folder structure for Next.js projects |
| `testing-patterns` | Vitest + Testing Library patterns for Next.js/FSD projects |
| `fastapi-best-practices` | FastAPI best practices — 41 rules across 13 categories (security, validation, dependencies, async, testing) with incorrect/correct examples linked to official docs |
| `grill-with-docs` | Stress-test a plan against the project's domain model and update documentation inline |
| `improve-codebase-architecture` | Find architecture improvements and refactoring opportunities informed by `CONTEXT.md` and ADRs |
| `to-prd` | Turn the current conversation context into a PRD and publish to the issue tracker |

---

## Subagents

Custom subagents under `.claude/agents/`.

| Agent | Description |
|-------|-------------|
| `fsd-async-reviewer` | Verify async files (`actions.ts`, `service.ts`, `query.ts`, `model/dto.ts`) in FSD slices follow conventions for Server Actions, TanStack Query, and DTO definitions |
| `senior-code-reviewer` | Senior-level code review for new features, bug fixes, or refactoring — checks architecture compliance and project quality standards |
| `test-writer` | Write test code for existing untested files at a given path, following `testing-patterns` conventions |

---

## Commands

Slash commands under `.claude/commands/`.

| Command | Description |
|---------|-------------|
| `done` | After opening a PR, delete the current feature branch and switch to the base branch |
| `worktree-done` | Remove the current git worktree, switch the main checkout to the base branch, and delete the feature branch |
