#!/bin/ruby

THINKER = <<~PROMPT

Analyze the user's input. Decide if it is a "System Task" or "General Conversation".
A "System Task" involves network diagnostics, service status checks, or configuration analysis.
Response Format:
Task
OR
Conversation

PROMPT
