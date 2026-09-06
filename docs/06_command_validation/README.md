# Command Validation

SecEye validates commands before they reach the execution stage.

## Validation Areas

- Empty command detection.
- Shell syntax validation.
- Detection of unexpected shell operators.
- Separation of command validation from command execution.

## Shell Parsing

SecEye uses Ruby's `Shellwords` functionality to check whether a command can be parsed as shell-style arguments.

## Purpose

The validator provides an additional control layer between LLM-generated commands and command execution.
