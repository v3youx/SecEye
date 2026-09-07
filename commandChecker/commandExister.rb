#!/bin/ruby

require "colorize"

def commandExister()

  $tools.uniq.each do |tool|

    found = `which #{tool}`

    if !found.empty?

      puts "             • #{tool} Found".colorize(:yellow)

    else

      puts "[-] #{tool} Not Found".colorize(:red)
      puts "[+] Checking for Tool Availability".colorize(:green)

      available = system("apt-cache show #{tool} > /dev/null 2>&1")

      if available

        puts "[+] Tool is available in apt.".bold
        puts "[+] Installing Tool".colorize(:green)

        installed = false

        begin
        installed = system("apt install -y #{tool} > /dev/null 2>&1")

        rescue Errno::ENOENT => e
          puts "[-] Tool Not Install".colorize(:red)
          puts "[-] Error: #{e}".colorize(:red)
        end

        if !installed

          puts "[-] Tool installation failed".colorize(:red)
          puts "[+] I am trying again".colorize(:red)

          begin
            system("apt update > /dev/null 2>&1")
            installed = system("apt install -y #{tool} --fix-missing > /dev/null 2>&1")

          rescue Errno::ENOENT => e
            puts "[-] #{tool} is not able to install. Check the error #{e}".colorize(:red)
            puts "[+] Looking for another tool".colorize(:green)  
          end
        end

        if installed && system("which #{tool} > /dev/null 2>&1")

          puts "[+] #{tool} installed successfully".colorize(:green)

        else

          puts "[-] Failed to install #{tool}".colorize(:red)
          puts "[+] Looking for another tool".colorize(:green)

          $tools.delete(tool)

          another = " #{tool} #{ANOTHER_TOOL_PROMPT}"

          begin
            res = $chat.ask(another)

          rescue RubyLLM::RateLimitError
            puts "[-] API credits exhausted".colorize(:red).bold
            exit
          end

          replacement = res.content.strip
          command_indexes = []

          $commands.each_with_index do |command, index|
            if command.to_s.strip.split.first == tool
              command_indexes << index
            end
          end

          if !command_indexes.empty?

            command_indexes.each do |index|
              $commands[index] = replacement
            end

          else
            puts "[-] Original command for #{tool} was not found".colorize(:red)
          end
        end

      else

        puts "[-] #{tool} is not available in kali".colorize(:red)

        $tools.delete(tool)

        puts "[+] Searching For Another Tool".colorize(:cyan)

        another = " #{tool} #{ANOTHER_TOOL_PROMPT}"

        begin
          res = $chat.ask(another)

        rescue RubyLLM::RateLimitError
          puts "[-] API credits exhausted".colorize(:red).bold
          exit
        end

        replacement = res.content.strip
        command_indexes = []

        $commands.each_with_index do |command, index|
          if command.to_s.strip.split.first == tool
            command_indexes << index
          end
        end

        if !command_indexes.empty?

          command_indexes.each do |index|
            $commands[index] = replacement
          end

        else
          puts "[-] Original command for #{tool} was not found".colorize(:red)
        end

      end
    end
  end

  $commands.uniq!

end
