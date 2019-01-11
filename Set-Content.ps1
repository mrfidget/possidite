function Set-Content($pwnedResponses) {
    foreach ($pwnedResponse in $pwnedResponses) {
        Write-Output $pwnedResponse.email;
        If ($pwnedResponse.response) {
            $cleanResponse = $pwnedResponse.response | ConvertFrom-Json;
            foreach ($item in $cleanResponse) {
                Write-Output $item.name, $item.description;
            }
        }else{
            Write-Output "Nothing detected";
        }        
    }
}