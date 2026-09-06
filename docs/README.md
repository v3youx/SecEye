# SecEye Documentation

SecEye is an **LLM-Powered Autonomous Security Assessment Agent** designed to automate security assessment workflows through intelligent task analysis, tool selection, command execution, output analysis, and iterative assessment.

* [00 - Overview](https://github.com/v3youx/SecEye/blob/main/docs/00_overview) — Overview of SecEye, its purpose, objectives, and scope.
* [01 - Architecture](https://github.com/v3youx/SecEye/blob/main/docs/01_architecture) — Explains SecEye's architecture and core components.
* [02 - Execution Model](https://github.com/v3youx/SecEye/blob/main/docs/02_execution_model) — Describes the autonomous assessment execution workflow.
* [03 - LLM and AI](https://github.com/v3youx/SecEye/blob/main/docs/03_llm_and_ai) — Covers LLM integration, prompts, and AI-driven decision making.
* [04 - Command Pipeline](https://github.com/v3youx/SecEye/blob/main/docs/04_command_pipeline) — Explains the command selection, validation, and execution pipeline.
* [05 - Tool Management](https://github.com/v3youx/SecEye/blob/main/docs/05_tool_management) — Describes security tool detection, availability checks, and management.
* [06 - Command Validation](https://github.com/v3youx/SecEye/blob/main/docs/06_command_validation) — Explains command parsing and validation before execution.
* [07 - Output Analysis](https://github.com/v3youx/SecEye/blob/main/docs/07_output_analysis) — Describes how tool output is analyzed and further actions are determined.
* [08 - Memory](https://github.com/v3youx/SecEye/blob/main/docs/08_memory) — Documents session memory and contextual information handling.
* [09 - Reporting](https://github.com/v3youx/SecEye/blob/main/docs/09_reporting) — Explains the generation of security findings and PDF reports.
* [10 - Configuration](https://github.com/v3youx/SecEye/blob/main/docs/10_configuration) — Covers API keys, configuration files, and environment setup.
* [11 - Testing](https://github.com/v3youx/SecEye/blob/main/docs/11_testing) — Describes testing areas and validation of SecEye components.
* [12 - Security](https://github.com/v3youx/SecEye/blob/main/docs/12_security) — Covers security considerations and execution safety.
* [13 - Operations](https://github.com/v3youx/SecEye/blob/main/docs/13_operations) — Describes running, operating, and managing SecEye sessions.
* [14 - Limitations](https://github.com/v3youx/SecEye/blob/main/docs/14_limitations) — Documents current limitations and known constraints.
* [15 - Future Work](https://github.com/v3youx/SecEye/blob/main/docs/15_future_work) — Lists potential improvements and future development directions.


## Assessment Flow

```text
User Task
    ↓
Task Analysis
    ↓
Tool Selection
    ↓
Tool Availability Check
    ↓
Command Validation
    ↓
Command Execution
    ↓
Output Analysis
    ↓
Further Assessment?
    ├── Yes → Next Command
    └── No  → Findings
                  ↓
              PDF Report
```
