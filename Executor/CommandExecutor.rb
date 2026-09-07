#!/bin/ruby

require "open3"
require "colorize"
require "net/http"
require "uri"
require "json"

def command_executor()

  puts "[+] Using Tools".bold

  output = ""

  $valid_commands.each do |command|

    puts "[*] Executing Command.....".colorize(:green)

    command_output = ""

    stdout, stderr, status = Open3.capture3(command)

    command_output << stdout unless stdout.empty?
    command_output << stderr unless stderr.empty?

    output << command_output

    save_memory($task, command, command_output)

  end

  # Read only relevant recent memory
  old_memory = memory

  relevant_memory = old_memory["sessions"]
    .select { |session| session["task"] == $task }
    .last(5)

  memory_text = JSON.pretty_generate(
    "sessions" => relevant_memory
  )

  puts "[*] Wait For Me...."
  puts ""

  
  # OPENAI

  if $key == "OPENAI"

    uri = URI.parse("https://api.openai.com/v1/responses")

    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = (uri.scheme == "https")

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{OPENAI_API_KEY}"
    }

    req = Net::HTTP::Post.new(uri.path, headers)

    req.body = {
      model: "gpt-5-nano",

      input: [
        {
          role: "developer",
          content: [
            {
              type: "input_text",
              text: OUTPUT_PROMPT
            }
          ]
        },

        {
          role: "user",
          content: [
            {
              type: "input_text",
              text: "Previous Memory:\n#{memory_text}\n\nTool Output:\n#{output}"
            }
          ]
        }
      ],

      store: true

    }.to_json

    begin

      sleep 2

      resp = http.request(req)

      if resp.nil? || resp.body.nil?
        return "[-] No Response From AI".colorize(:red)
      end

      return resp

    rescue Net::ReadTimeout, StandardError => e

      return "[-] AI Error: #{e.message}".colorize(:red)

    end


  # GEMINI

  elsif $key == "GEMINI"

    uri = URI.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent"
    )

    http = Net::HTTP.new(uri.host, uri.port)

    http.use_ssl = (uri.scheme == "https")

    headers = {
      "Content-Type" => "application/json",
      "x-goog-api-key" => GEMINI_API_KEY
    }

    req = Net::HTTP::Post.new(uri.path, headers)

    req.body = {

      systemInstruction: {
        parts: [
          {
            text: OUTPUT_PROMPT
          }
        ]
      },

      contents: [
        {
          role: "user",
          parts: [
            {
              text: "Previous Memory:\n#{memory_text}\n\nTool Output:\n#{output}"
            }
          ]
        }
      ]

    }.to_json

    begin

      sleep 2

      resp = http.request(req)

      if resp.nil? || resp.body.nil?
        return "[-] No Response From AI".colorize(:red)
      end

      return resp

    rescue Net::ReadTimeout, StandardError => e

      return "[-] AI Error: #{e.message}".colorize(:red)

    end

  end

end

