# Output Analysis

The output analysis stage interprets technical results produced by security tools.

## Analysis

The output analyzer determines:

- Current assessment stage.
- Security-relevant findings.
- Significance of the finding.
- Possible next investigation.
- Whether another command is required.

## Decision

If further assessment is justified, the analyzer provides one next command.

If the available information is sufficient, the assessment stops and the findings can be reported.

## Output Structure

```text
STAGE
FINDING
SIGNIFICANCE
MAYBE
COMMAND
```
