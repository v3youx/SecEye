# SecEye Architecture

SecEye is organized as a pipeline of components responsible for reasoning, validation, execution, analysis, memory, and reporting.

## Main Components

- **Orchestrator** — coordinates the complete assessment workflow.
- **Analyzer** — analyzes the user's task and selects commands.
- **Tool Management** — checks whether required tools are available.
- **Validator** — validates generated commands before execution.
- **Executor** — executes validated commands and collects output.
- **Output Analyzer** — interprets technical results and determines the next step.
- **Memory** — stores relevant session information.
- **Reporter** — generates the final PDF findings report.

## High-Level Flow

```text
User
  ↓
Orchestrator
  ↓
Task Analyzer
  ↓
Tool Management
  ↓
Command Validator
  ↓
Command Executor
  ↓
Output Analyzer
  ↓
Further Assessment?
  ├── Yes → Next Command
  └── No  → Reporter
```
