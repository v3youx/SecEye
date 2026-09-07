#!/bin/ruby

def output_analyze(response, command)

  command = response.split("COMMAND:", 2).last.strip

  if command == "No Path! You can check the finding manually"
    return "No Path! You can check the finding manually"
  end
return command
end