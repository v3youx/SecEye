# Execution Model

SecEye follows an iterative assessment model rather than executing a fixed list of commands.

## Execution Flow

1. The user provides a security assessment task.
2. SecEye analyzes the task.
3. Appropriate tools and commands are selected.
4. Tool availability is checked.
5. Commands are validated.
6. Valid commands are executed.
7. Technical output is analyzed.
8. The system determines whether more assessment is required.
9. If required, another command is selected and executed.
10. When sufficient information is gathered, findings are sent to the reporter.

## Iteration

```text
Task
 ↓
Analyze
 ↓
Execute
 ↓
Analyze Output
 ↓
More Assessment?
 ├─ Yes → Execute Next Command
 └─ No  → Generate Report
```
