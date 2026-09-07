# SecEye - Autonomous Security Assessment Agent

SecEye is an **LLM-Powered Autonomous Security Assessment Agent** designed to automate security assessment workflows through intelligent task analysis, command selection, execution, and output analysis. It uses Large Language Models to reason about assessment results and determine whether further testing is required.

## Features

* **Autonomous Assessment**: Analyzes the given security task and determines appropriate assessment steps.
* **LLM-Driven Decision Making**: Uses OpenAI or Gemini models to analyze tasks, command results, and decide the next assessment action.
* **Tool Selection**: Automatically identifies appropriate Kali Linux security tools for the given task.
* **Command Validation**: Validates generated commands before execution.
* **Automated Execution**: Executes selected security commands and collects their output.
* **Output Analysis**: Analyzes technical tool output to identify findings and determine whether additional assessment is required.
* **Iterative Assessment**: Automatically continues with the next appropriate command when further investigation is necessary.
* **Memory**: Maintains relevant session information to provide context during an assessment.
* **PDF Reporting**: Generates a PDF containing the identified security findings.
* **CLI Interface**: Fully terminal-based and designed for Linux/Kali environments.

## Prerequisites

Before running SecEye, ensure you have the following installed:

* **Ruby**
* **Kali Linux** or a compatible Linux environment
* Required Kali/Linux security tools
* **OpenAI API key** or **Google Gemini API key**

## Supported LLMs

* **OpenAI**
* **Google Gemini**

# Installation
<b>1) Clone </b> 
```text
git clone https://github.com/v3youx/SecEye.git
cd SecEye
````

<b>2) Run the script</b>
```
bash setup.sh
```

<b>3) Edit the config/config.rb File and Add Your Api Keys</b>
```
GEMINI_API_KEY = "YOUR-API-KEY" 
OPENAI_API_KEY = "YOUR-API-KEY" 	
```
<b>4) Run the command</b>
```
ruby youragent
```


## Troubleshooting

### Faraday / JSON Parsing Error

If you encounter:

```text
Faraday::ParsingError
wrong number of arguments (given 2, expected 1)
```

This can occur due to an incompatibility between `Faraday` and `json 3.0.0`.

Check the installed JSON versions:

```bash
gem list json
```

If `json 3.0.0` is installed, remove that version:

```bash
gem uninstall json -v 3.0.0
```

Then verify:

```bash
gem list json
```

After removing `json 3.0.0`, run SecEye again.

## Documentation

- [00 - Overview](./00_overview/)
- [01 - Architecture](./01_architecture/)
- [02 - Execution Model](./02_execution_model/)
- [03 - LLM and AI](./03_llm_and_ai/)
- [04 - Command Pipeline](./04_command_pipeline/)
- [05 - Tool Management](./05_tool_management/)
- [06 - Command Validation](./06_command_validation/)
- [07 - Output Analysis](./07_output_analysis/)
- [08 - Memory](./08_memory/)
- [09 - Reporting](./09_reporting/)
- [10 - Configuration](./10_configuration/)
- [11 - Testing](./11_testing/)
- [12 - Security](./12_security/)
- [13 - Operations](./13_operations/)



