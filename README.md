# test-pii-generator

Just a quick script that generates realistic looking but fake PII data, for use w/ DLP testing

Slow, terrible. But it works.

## Usage

```PowerShell
# Create 1000 records, export to a CSV (using the default output name)
. .\Invoke-PIIGenerator.ps1 -PIICount 1000 -GenerateCSV

# Create 500 records, export to a CSV using a custom output name
. .\Invoke-PIIGenerator.ps1 -PIICount 500 -GenerateCSV -OutputFile "test-PII-500.csv"

# Create 1000 records, export to a CSV using a custom output name, enable verbose output
. .\Invoke-PIIGenerator.ps1 -PIICount 1000 -GenerateCSV -OutputFile "test-PII-1000.csv" -v
```
