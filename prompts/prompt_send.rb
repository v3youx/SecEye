#!/bin/ruby

PROMPT_ANALYZE = <<~PROMPT
Analyze the USER TASK.

Select exactly 3 relevant Kali/Linux commands.

Rules:

- Use only user-provided values.
- Never assume or invent arguments.
- If a tool is specified, use only that tool.
- If required information is missing, ask one Question.
- If the user already provided the required value, do not ask for it again.
- For a follow-up request, use the previous conversation context and the latest user input together.
- Commands must not start with sudo.
- Dont us unusual command like ping which never ends. Only use pentest command 

Question Format:
Question: <question>

OR

Commands Format:
Commands
<command>
<command>
<command>
PROMPT
