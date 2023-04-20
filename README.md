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
. .\Invoke-PIIGenerator.ps1 -PIICount 50 -v | Format-Table
Generating 50 PII records
Generated 50 PII records in: 4.4378098 seconds

FirstName LastName Email                                 Phone        Address                    City              State          Zip   SSN         Birthday
--------- -------- -----                                 -----        -------                    ----              -----          ---   ---         --------
Chase     Strong   chaserural@drabfull.au                695-944-3378 32869 Neuw Walks           Ewing             New Jersey     44138 877-92-6380 10/5/2015
Bria      Roach    bria.roach@aspiringknown.biz          206-335-6380 244 Emjeirpoxil Forks      Vredenburgh       New York       30375 487-73-3222 10/11/2019
Ean       Francis  eannatural@dashingfertile.it          19-537-5158  7237 Feujru Pl             Franklin          Maine          96807 813-18-9335 8/21/1993
Ramon     Jacobson ramonwaiting@meekhomeless.info        23-795-6182  7148 Ifudnabes Canyn       East Worcester    Florida        89503 729-17-2763 8/26/1959
Odin      Moses    odin.moses@eminentagreeable.eu        226-119-8830 9412 Miac Clb              Yauco             Colorado       63119 391-31-9023 8/18/1994
Jude      Riggs    judeuninterested@iratecurly.com       287-765-1196 80967 Enpe Trace           Sand Lake         Utah           44162 592-37-9042 10/12/1985
Eva       Wolf     eva.wolf@yahoo.com                    353-38-5033  31329 Hamaqdarumte Trail   Waddington        Kentucky       44162 240-34-3985 10/1/1998
Delilah   Farrell  delilah.farrell@yahoo.com             990-518-9643 18382 Mozcuqohot Shoar     Freeport          Tennessee      33184 528-75-7697 11/21/2001
<snip>
```
