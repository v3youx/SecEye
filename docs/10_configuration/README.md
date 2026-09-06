# Configuration

SecEye requires API configuration for the supported LLM providers.

## Configuration File

```text
config/config.rb
```

Example:

```ruby
GEMINI_API_KEY = ""
OPENAI_API_KEY = ""
```

## Provider Selection

SecEye selects the configured LLM provider according to the available API key configuration.

## Security

API keys and sensitive configuration files should not be committed to the repository.
