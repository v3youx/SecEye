require "json"
require "net/http"
require "uri"

def output_json(resp)

  unless resp.respond_to?(:body) 
    return resp
     end

  if $key == "GEMINI"

    error = 0

    begin

     jres = resp.body
      json = JSON.parse(jres)

    rescue JSON::ParserError => e

      error += 1

      if error < 4

        puts "[-] AI with JSON Error. Retrying...".colorize(:red)
        retry

      else
        
        puts "[-] Error. Give the prompt again".colorize(:red)
        return
      end
    end

    response = json.dig("candidates", 0, "content", "parts", 0, "text")

    if response
      return response

    elsif json["error"]

      puts "[-] API Error: #{json["error"]["message"]}".colorize(:red).bold
      exit

    else

      return "No Response From AI"

    end


  elsif $key == "OPENAI"

    error = 0

    begin

      json = JSON.parse(resp.body)

    rescue JSON::ParserError, StandardError => e

      error += 1

      if error < 4

        puts "[-] AI with JSON Error. Retrying...".colorize(:red)
        retry

      else

        puts "[-] Error. Give the prompt again".colorize(:red)
        return
      end
    end

    response = json["output"]&.find { |o| o["type"] == "message" }&.dig("content")&.find { |c| c["type"] == "output_text" }&.dig("text")

    if response
      return response

    elsif json["error"]

      error = json["error"]["message"]

      if error.include?("Incorrect")

        puts "[-] Incorrect Api key".colorize(:red).bold
        exit

      elsif error.include?("quota")

        puts "Free Api quota Exceeded".colorize(:red)
        exit

      else

        puts "[-] API Error: #{error}".colorize(:red)
        return

      end

    else

      return "NO Response from AI"

    end

  end

end
