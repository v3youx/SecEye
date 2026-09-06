# Command Pipeline

The command pipeline controls how commands move from LLM-generated decisions to execution.

## Pipeline

```text
LLM Command Selection
        ↓
Tool Identification
        ↓
Tool Availability Check
        ↓
Command Validation
        ↓
Validated Command
        ↓
Command Execution
        ↓
Technical Output
```

## Command Requirements

Commands should:

- Match the requested assessment task.
- Use values provided by the user.
- Avoid invented targets or arguments.
- Pass command validation before execution.
- Be directly justified by the assessment context.
