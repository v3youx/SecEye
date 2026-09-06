# Reporting

SecEye generates a PDF report containing the findings produced during the assessment.

## Report Content

The reporting stage can include:

- Assessment stage
- Finding
- Significance
- Possible investigation path
- Relevant command information

## Reporting Flow

```text
Tool Output
    ↓
Output Analysis
    ↓
Finding Information
    ↓
PDF Reporter
    ↓
report.pdf
```

The project uses Prawn for PDF generation.
