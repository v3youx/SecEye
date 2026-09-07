#!/bin/ruby

require "json"

MEMORY_FILE = "memory/memory.json"


def memory()

  default_memory = {
    "sessions" => []
  }

  unless File.exist?(MEMORY_FILE)

    file = File.new(MEMORY_FILE, "w")

    file.write(
      JSON.pretty_generate(default_memory)
    )

    file.close

    return default_memory
  end


  file_read = File.read(MEMORY_FILE)

  if file_read.empty?
    return default_memory
  end


  begin

    return JSON.parse(file_read)

  rescue JSON::ParserError

    return default_memory
  end

end


def save_memory(task, command, output)

  memory_data = memory()

  memory_data["sessions"] << {
    "task" => task,
    "command" => command,
    "output" => output
  }

  file = File.new(MEMORY_FILE, "w")

  file.write(
    JSON.pretty_generate(memory_data)
  )

  file.close

end
