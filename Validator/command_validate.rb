#!/bin/ruby

require 'shellwords'
require 'colorize'

def command_validate

  unusual_commands = []
  $valid_commands = []

  $commands.each do |command|

    command = command.to_s.strip

    # Check Empty Command
    if command.empty?
      puts "[-] Command is empty".colorize(:red)
      unusual_commands << command
      next
    end

    # Checking Syntax
    begin
      Shellwords.split(command)
    rescue ArgumentError
      puts "[-] Invalid Command Syntax".colorize(:red)
      unusual_commands << command
      next
    end

    # Checking shell injection
    danger = [";", "&&", "||", "|", "`", "$(", ">", "<"]
    safe = true

    danger.each do |operator|

      if command.include?(operator)
        puts "[-] Unexpected operator detected".colorize(:red)
        unusual_commands << command
        safe = false
        break
      end

    end

    $valid_commands << command if safe

  end

  if !unusual_commands.empty?
    puts unusual_commands.to_s
    puts "These Commands are not right"
    return
  end

end
