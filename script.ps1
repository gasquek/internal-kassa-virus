$filePath = "C:\temp\img.jpg"      
 
function Get-CurrentUser() { 
 
    try {  
 
        $currentUser = (Get-Process -IncludeUserName -Name explorer | Select-Object -First 1 | Select-Object -ExpandProperty UserName).Split("\")[1]  
 
        if (-NOT[string]::IsNullOrEmpty($currentUser)) { 
 
        Write-Output $currentUser 
 
        } 
 
    }  
 
    catch {  
 
        Write-Output "Failed to get current user."  
 
    Write-Host "Error occured while running script -> ",$_.Exception.Message 
 
    } 
 
} 
 
function Get-UserSID([string]$fCurrentUser) { 
 
    try { 
 
        $user = New-Object System.Security.Principal.NTAccount($fcurrentUser)  
 
        $sid = $user.Translate([System.Security.Principal.SecurityIdentifier])  
 
        if (-NOT[string]::IsNullOrEmpty($sid)) { 
 
        Write-Output $sid.Value 
 
        } 
 
    } 
 
    catch {  
 
        Write-Output "Failed to get current user SID."  
 
    Write-Host "Error occured while running script -> ",$_.Exception.Message 
 
    } 
 
} 
 
Write-Host "--------------starting script execution--------------" 
 
$currentUser = Get-CurrentUser 
 
$currentUserSID = Get-UserSID $currentUser 
 
$userRegistryPath = "Registry::HKEY_USERS\$($currentUserSID)\Control Panel\Desktop"  
 
Set-ItemProperty -Path $userRegistryPath -Name wallpaper -Value $filePath            
 
Write-Host "--------------script execution completed successfully--------------" 
 
Write-Host "Apply Restart device action to reflect the changes immediately" 
