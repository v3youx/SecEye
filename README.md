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
git clone https://github.com/Y0Ux01/SecureCode-Analyzer.git
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



