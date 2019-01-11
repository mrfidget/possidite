<#
.SYNOPSIS
  A Powershell tool to query for breaches on email accounts using https://haveibeenpwned.com/API/v2
.DESCRIPTION
  A Powershell tool to query for breaches on email accounts using https://haveibeenpwned.com/API/v2
.PARAMETER filename
    path to the csv file
.PARAMETER emailField
    name of the email column
.OUTPUTS
  HTML report
.NOTES  
  
.EXAMPLE
  
#>


param (
    [Parameter(Mandatory=$true)][string]$filename,
    [Parameter(Mandatory=$true)][string]$emailField
 )

. .\includes.ps1;

#get the email addresses from a file
$emails = Get-Emails($filename);

#send the email to the API
$pwnedResponses = Get-Pwned($emails);

#process the json
$content = Set-Content($pwnedResponses); 
Write-Output $content;
