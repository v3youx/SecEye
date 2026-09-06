# Operations

This document describes the operational behavior of SecEye as a CLI application.

## Running

SecEye is intended to run in a Linux/Kali environment with the required Ruby dependencies and security tools installed.

## Runtime Flow

```text
Start SecEye
    ↓
Configure LLM
    ↓
Provide Task
    ↓
Autonomous Assessment
    ↓
Findings
    ↓
PDF Report
```

## Session Cleanup

The application includes signal handling for interruption and suspension so that session state can be cleaned up before exiting.
