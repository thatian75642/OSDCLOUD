#Install Dependencies

Add-AppPackage -path "$PSScriptRoot\Microsoft.NET.Native.Framework.2.2_2.2.29512.0_x64__8wekyb3d8bbwe.appx"
Add-AppPackage -path "$PSScriptRoot\Microsoft.UI.Xaml.2.7.appx"
Add-AppPackage -path "$PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop.appx"

#Detect if Dependencies are installed
$UIXaml = Get-AppxPackage -Name "Microsoft.UI.Xaml.2.7" | Select-Object Name
$VCLibs = Get-AppxPackage -Name "Microsoft.VCLibs.140.00.UWPDesktop" | Select-Object Name
#Get-AppxPackage | Select-Object Name
if ($UIXaml -match "Microsoft.UI.Xaml"){
$UIGood = "It's"
}

if ($VCLibs -match "Microsoft.VCLibs."){
$VCGood = "Detected"
}

$Detected = $UIGood + " " + $VCGood 

#Install App installer if everything needed is there
if ($Detected -match "It's Detected"){
Write-host "Dependencies are installed installing AppInstaller"
Add-AppxPackage -path "$PSScriptRoot\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -ForceUpdateFromAnyVersion 
		
$releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$releases = Invoke-RestMethod -uri "$($releases_url)"
$latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith("msixbundle") } | Select -First 1

Add-AppxPackage -Path $latestRelease.browser_download_url -ForceUpdateFromAnyVersion
sleep-timer 10
Add-AppxPackage -path "$PSScriptRoot\Microsoft.WindowsStore_22205.1401.10.0_neutral___8wekyb3d8bbwe.msixbundle"

wsreset.exe

}
#Shit
elseif ($Detected -notmatch "It's Detected"){
Write-host "Not detected"}


#Setup Winget temp
$path = Test-Path -Path "C:\Program Files\Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe\"

if ($path -match "false"){

Move-Item -path "$PSScriptRoot\Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe" -Destination "C:\Program Files\"

}

ECHO y | & "C:\Program Files\Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe\winget.exe" search notepad++

