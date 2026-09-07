#!/bin/ruby

require "colorize"
require "uri"
require "net/http"
require "json"

def thinker(input)

thinker = "#{input}"

puts "[*] Thinking..........".colorize(:grey)

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
  input: "#{THINKER}\n#{thinker}",
  store: true
}.to_json

begin

  out = http.request(req)

  if out.nil? || out.body.nil?
    return "[-] No Response From AI".colorize(:red)
  end

  json = JSON.parse(out.body)

  response = json["output"]&.find { |o| o["type"] == "message" }&.dig("content")&.find { |c| c["type"] == "output_text" }&.dig("text")

  if response
    return response
  else
    return "[-] No usable response from AI".colorize(:red)
  end

rescue Net::ReadTimeout, StandardError => e
  return "[-] AI Error: #{e.message}".colorize(:red)
end

elsif $key == "GEMINI"

uri = URI.parse(
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent"
)

http = Net::HTTP.new(uri.host, uri.port)

http.use_ssl = (uri.scheme == "https")

headers = {
  "Content-Type" => "application/json",
  "x-goog-api-key" => "#{GEMINI_API_KEY}"
}

req = Net::HTTP::Post.new(uri.path, headers)

req.body = {
  contents: [
    {
      parts: [
        {
          text: "#{THINKER}\n#{thinker}"
        }
      ]
    }
  ]
}.to_json

begin

  out = http.request(req)

  if out.nil? || out.body.nil?
    return "[-] No Response From AI".colorize(:red)
  end

  json = JSON.parse(out.body)

  response = json.dig("candidates", 0, "content", "parts", 0, "text")

  if response
    return response
  else
    return "[-] No usable response from AI".colorize(:red)
  end

rescue Net::ReadTimeout, StandardError => e
  return "[-] AI Error: #{e.message}".colorize(:red)
end

end

end
