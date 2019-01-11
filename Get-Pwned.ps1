function Get-Pwned($emails) {

    $config = Get-Config;
    $allResponses = New-Object System.Collections.ArrayList;

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12    
    foreach ($email in $emails) {
        $responses = New-Object -TypeName psobject;
        $responses | Add-Member -MemberType NoteProperty -Name 'email' -Value $null;
        $responses | Add-Member -MemberType NoteProperty -Name 'response' -Value $null;        
        $url='';
        $url = '{0}{1}' -f $config.pwnedUrl,$email;
        $response = try{ 
            Invoke-WebRequest -Uri $url -Method Get
             
        }catch{
            $null;
        }
        ;
        $responses.email = $email;
        $responses.response = $response;
        [void]$allResponses.Add($responses);
        Start-Sleep -Milliseconds $config.timeout;
    }

    return $allResponses;
}
