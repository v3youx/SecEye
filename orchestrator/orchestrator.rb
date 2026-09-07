#!/bin/ruby

require_relative "../prompts/prompt_send.rb"
require_relative "../memory/memory.rb"
require_relative "../analyzer/thinking.rb"
require_relative "../prompts/thinker.rb"
require_relative "../analyzer/promptSend_responseAnalyze.rb"
require_relative "../commandChecker/commandExister.rb"
require_relative "../prompts/prompt_send.rb"
require_relative "../prompts/not_Available_prompt.rb"
require_relative "../prompts/output_prompt.rb"
require_relative "../Validator/command_validate.rb"
require_relative "../Executor/CommandExecutor.rb"
require_relative "../output/output_json.rb"
require_relative "../output/output_analyse.rb"
require_relative "../reporter/reporter.rb"

$pdf_save = ""

def pretty_output(response)

  response.each_line do |line|

    if line.start_with?("STAGE:")
      line = line.split(":", 2).last
      puts "STAGE:".colorize(:cyan) + "#{line}"
      puts
    end

    if line.start_with?("FINDING:")
      line = line.split(":", 2).last
      puts "FINDING: ".colorize(:yellow) + "#{line}"
      puts
    end

    if line.start_with?("SIGNIFICANCE:")
      line = line.split(":", 2).last
      puts "SIGNIFICANCE: ".colorize(:light_red) + "#{line}"
      puts
    end

    if line.start_with?("MAYBE:")
      line = line.split(":", 2).last
      puts "MAYBE: ".colorize(:magenta) + "#{line}"
      puts
    end

    if line.start_with?("NEXT COMMAND:")
      line = line.split(":", 2).last
      puts "NEXT COMMAND: ".colorize(:light_blue) + "#{line}"
      puts
    end

  end

end


def orchestrator(user_input)

  $task = user_input

  $commands = []
  $valid_commands = []
  $tools = []

  puts "[*] Analysing Task.....".colorize(:light_blue)

  out = thinker(user_input)

  if out.include?("Conversation")

    puts "I am an autonomous agent that can perform your tasks in real time.
Tell me what task you want me to perform. If you want me to use a particular tool, specify the tool. If you have a general task, just describe what you want to accomplish, and I will select the appropriate tools and tell you what I can try."

    return
  end

  analyzer(user_input)

  loop do

    commandExister()

    command_validate()

    executor_response = command_executor()

    response = output_json(executor_response)

    pretty_output(response)

    $pdf_save << "USER TASK: #{user_input}\n\n"
    $pdf_save << response.to_s
    $pdf_save << "\n"

    report($pdf_save)

    puts "[*] Report Maked"

    puts "-" * 80
    puts

    output = output_analyze(response, nil)

    if output == "No Path! You can check the finding manually"

      puts "[*] Findings Saved to report.pdf".colorize(:green)

      break
    end

    $commands = [output]
    $valid_commands = []
    $tools = [output.split.first]

  end

end
