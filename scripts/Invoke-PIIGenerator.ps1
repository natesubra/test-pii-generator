#Requires -Version 5.0
[CmdletBinding()]
param (
    [int] $PIICount = 50,
    [string] $Culture = 'en-US',
    [switch] $GenerateCSV,
    [string] $OutputFile = 'GeneratedTestPII.csv',
    [switch] $v
)

begin {
    # Install/Import NameIt module
    if (-not (Get-Module -Name NameIt)) {
        Install-Module -Name NameIt -Force
    }
    Import-Module -Name NameIt -Force

    Function Get-RandomCreditCardNumber {
        # Define an array of prefixes for different card types
        $cardPrefixes = @(
            "4"  # Visa
            "51", "52", "53", "54", "55"  # Mastercard
            "34", "37"  # American Express
            "6011", "65"  # Discover
        )
    
        # Choose a random prefix from the array
        $prefix = $cardPrefixes | Get-Random
    
        # Generate a random number with the remaining digits
        $remainingDigits = 15 - $prefix.Length
        $suffix = ""
        For ($i = 1; $i -le $remainingDigits; $i++) {
            $suffix += Get-Random -Minimum 0 -Maximum 9
        }
    
        # Concatenate the prefix and suffix to form the full credit card number
        $creditCardNumber = $prefix + $suffix
    
        # Determine the card type based on the prefix
        Switch ($prefix) {
            "4" { $cardType = "Visa" }
            { "51", "52", "53", "54", "55" } { $cardType = "Mastercard" }
            { "34", "37" } { $cardType = "American Express" }
            { "6011", "65" } { $cardType = "Discover" }
        }
    
        # Generate a random CCV (security code)
        $ccv = ""
        For ($i = 1; $i -le 3; $i++) {
            $ccv += Get-Random -Minimum 0 -Maximum 9
        }
    
        # Output the results as an object with properties for the credit card number, card type, and CCV
        [PSCustomObject]@{
            CreditCardNumber = $creditCardNumber
            CardType         = $cardType
            CCV              = $ccv
            ExpirationDate   = Invoke-Generate "[randomdate 1/1/2020 12/31/2026]"
        }
    }

    function Get-RandomSSN {
        $area = Get-Random -Minimum 1 -Maximum 899
        $group = Get-Random -Minimum 1 -Maximum 99
        $serial = Get-Random -Minimum 1 -Maximum 9999
        $ssn = '{0:D3}-{1:D2}-{2:D4}' -f $area, $group, $serial
        return $ssn
    }

    # Create the List to store the PII
    $list = [System.Collections.Generic.List[object]]::new()
    $header = "FirstName,LastName,Email,Phone,Address,City,State,Zip,SSN,Birthday,CreditCard,CreditCardExpiration,CreditCardCVV,CreditCardType,Company,JobTitle"
    $counter = 0

    $TLDs = ".com",".net",".org",".info",".biz",".us",".co.uk",".ca",".eu",".de",".jp",".fr",".au",".ru",".ch",".it",".nl",".se",".no",".es",".co",".mx",".mil"
}

process {
    if ($v) {
        Write-Host "Generating $PIICount PII records"
        $timer = [Diagnostics.Stopwatch]::StartNew()
    }
    While ($counter -lt $PIICount) {
        # Set default culture
        $PSDefaultParameterValues = @{
            'Invoke-Generate:Culture' = $Culture
        }

        $row = Invoke-Generate '[person both first],[person both last],email,[numeric 3]-[numeric 3]-[numeric 4],[address],[city],[state],[postalcode],ssn,[randomdate 1/1/1940 12/31/2020],creditcard,creditcardexpiration,creditcardccv,creditcardtype,[company],[job]'
        $identity = [string[]]($header + [System.Environment]::NewLine + $row) | ConvertFrom-Csv

        # Add some randomnness to email generation
        $random = Get-Random -Maximum 3
        switch ($random) {
            0 {
                $identity.email = $identity.firstname.tolower() + '.' + $identity.lastname.tolower() + '@' + ((Invoke-Generate "[email]") -split '@')[1]
            }
            1 {
                $identity.email = $identity.firstname.tolower() + '.' + $identity.lastname.tolower() + '@' + (Invoke-Generate "[adjective][adjective]").tolower() + ($TLDs | Get-Random -Count 1)
            }
            2 {
                $identity.email = $identity.FirstName.tolower() + (Invoke-Generate "[adjective]").tolower() + '@' + (Invoke-Generate "[adjective][adjective]").tolower() + ($TLDs | Get-Random -Count 1)
            }
        }
        
        $identity.SSN = Get-RandomSSN

        $CCTemp = Get-RandomCreditCardNumber
        $identity.CreditCard = $CCTemp.CreditCardNumber
        $identity.CreditCardExpiration = $CCTemp.ExpirationDate
        $identity.CreditCardCVV = $CCTemp.CCV
        $identity.CreditCardType = $CCTemp.CardType

        $list.Add($identity)
        $counter++
    }
}

end {
    if ($v) {
        $timer.Stop()
        Write-Host "Generated $PIICount PII records in: $($timer.Elapsed.TotalSeconds) seconds"
    }

    if ($GenerateCSV) {
        $list | Export-Csv -Path $OutputFile -NoTypeInformation
    }
    else {
        return $list
    }
}
