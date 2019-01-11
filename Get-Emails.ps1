function Get-Emails($_fileName) {
    $ErrorActionPreference = "Stop";    
    $emails = Import-Csv -LiteralPath $_fileName -Delimiter ',';
    return $emails.('E-Mail');    
}
