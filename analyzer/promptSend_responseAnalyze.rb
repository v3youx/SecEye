#!/bin/ruby 
 
require "ruby_llm" 
require "colorize" 
require "readline"
 
def analyzer(user_input) 
 
  analyze = "User Task: #{user_input}\n\n#{PROMPT_ANALYZE}" 
 
  RubyLLM.configure do |config| 
 
    if $key == "OPENAI" 
 
      config.openai_api_key = "#{OPENAI_API_KEY}" 
      $chat = RubyLLM.chat(model: "gpt-5-nano") 
 
    elsif $key == "GEMINI" 
 
      config.gemini_api_key = "#{GEMINI_API_KEY}" 
      $chat = RubyLLM.chat(model: "gemini-3-flash-preview") 
 
    end 
  end 
 
  begin 
 
    sleep 2 
 
    response = $chat.ask(analyze) 
 
    if response.nil? || response.content.nil? || response.content.empty? 
      raise "Empty Response" 
    end 
 
    if response.content.include?("Question") 
 
      print "#{response.content}".colorize(:yellow) 
      puts "   \e[36m\e[5m(Answer this I am waiting.....)\e[0m\n" 
 
      print "Answer> " 
 
      answer = Readline.readline("Answer> ", true)
      response = $chat.ask(answer)

      if response.nil? || response.content.nil? || response.content.empty?
        raise "Empty Response"
      end

    end

    if response.content.include?("Commands")

      $commands = response.content.lines.drop(1)

      puts "[*] Searching For Tools".colorize(:green)
      sleep 1

      $tools = response.content.lines.drop(1).map do |line| 
        line.split.first
      end

    end
 
  rescue RubyLLM::RateLimitError 
 
    puts "[-] API credits exhausted.".colorize(:red).bold 
    exit 
 
  rescue => e 
 
    if e.message == "Empty Response" 
      retry 
    end   
 
    puts "[-] Something went wrong #{e.message} Try Again!".colorize(:red) 
    exit 
 
  end 
end

