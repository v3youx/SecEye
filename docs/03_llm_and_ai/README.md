# LLM and AI

SecEye uses Large Language Models for task analysis, command selection, and technical output analysis.

## Supported Models

- OpenAI
- Google Gemini

## LLM Responsibilities

### Task Analysis

The LLM receives the user's task and determines appropriate Kali/Linux commands.

### Output Analysis

The LLM receives technical command output and determines:

- What was discovered.
- Why the discovery matters.
- Whether additional assessment is genuinely required.
- The next appropriate command when further assessment is necessary.

## Design Principle

The LLM is used for reasoning and decision making, while command execution remains a separate stage of the system.
