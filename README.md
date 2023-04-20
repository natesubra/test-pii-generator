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



FirstName               LastName                Email                   Phone                   Address                 City                   State                  Zip                    SSN                    Birthday
---------               --------                -----                   -----                   -------                 ----                   -----                  ---                    ---                    --------
Litzy                   White                   litzybusy@giantobnoxioΓÇª 501-900-5350            144 Dealaclaul Path     Sardinia               South Carolina         74105                  229-34-8083            4/8/1967
Julio                   Bowers                  juliointernal@successfΓÇª 417-63-5488             501 Guwifif Riv         Lovettsville           Arkansas               10046                  788-40-5000            2/26/1992
Reece                   Vance                   reeceancient@thoughtfuΓÇª 611-837-6413            77108 Jolyobjeg Anex    Stantonville           Missouri               44124                  263-47-7764            10/21/2016
Julie                   Howe                    julie.howe@crazymarkedΓÇª 560-958-8340            93373 Vekasdac Jct      West Palm Beach        Indiana                33184                  687-08-0337            3/29/1956
Amari                   Diaz                    amariutopian@rainyneedΓÇª 728-918-9224            157 Sobaplawkid Track   Kendallville           West Virginia          50303                  222-54-3082            3/11/1974
Elliana                 Stevenson               elliana.stevenson@enthΓÇª 277-876-5540            12952 Nipukulinol CrosΓÇª Point Pleasant         Oregon                 44119                  217-03-0888            4/14/1982
Kelton                  Miller                  keltonenergetic@madlydΓÇª 329-86-2092             465 Jixuscexozfa HighwΓÇª Laurel                 New Hampshire          10008                  269-31-2900            6/8/1963
Waylon                  Huber                   waylon.huber@awarecowaΓÇª 288-275-4435            6059 Kowi Loop          Milton                 Colorado               74106                  366-52-7186            11/26/1996
<snip>
```
