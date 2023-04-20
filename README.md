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

## Sample output

```PowerShell
# Create 100 records, enable verbose output
PS > $sample = . .\Invoke-PIIGenerator.ps1 -PIICount 50 -v
Generating 50 PII records
Generated 50 PII records in: 4.4378098 seconds

PS > $sample[0]

FirstName            : Bria
LastName             : Farrell
Email                : briameek@roundsoft.au
Phone                : (812) 617-5120
Address              : 135 Docxiguy Coves
City                 : Greensboro
State                : Maine
Zip                  : 46208
SSN                  : 555-07-2259
Birthday             : 10/1/1944
CreditCard           : 375370188073435
CreditCardExpiration : 4/17/2024
CreditCardCVV        : 031
CreditCardType       : Discover
Company              : Escobar and Sons
JobTitle             : Pharmacy assistant
```
