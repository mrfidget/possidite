function Get-Config(){
    $config = New-Object -TypeName psobject;
    $config | Add-Member -MemberType NoteProperty -Name 'timeout' -Value 3000;
    $config | Add-Member -MemberType NoteProperty -Name 'pwnedUrl' -Value 'https://haveibeenpwned.com/api/v2/breachedaccount/';
    $config | Add-Member -MemberType NoteProperty -Name 'emailField' -Value 'email';
    return $config;
}

