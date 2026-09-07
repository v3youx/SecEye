#!/bin/ruby

ANOTHER_TOOL_PROMPT = <<~PROMPT

   is unavailable.
  Analyze the USER TASK and provide ONE alternative Kali/Linux command with all required arguments.
  Use only arguments explicitly provided by the user.
  Do not assume or invent missing arguments.
  Command should not start with sudo
   Do not provide multiple commands or explanations.

  Output only the command.

PROMPT
