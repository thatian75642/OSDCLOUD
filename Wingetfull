#Install Winget folder
Invoke-WebRequest -Uri https://github.com/thatian75642/OSDCLOUD/raw/main/Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe.zip -OutFile $PSScriptRoot\Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe.zip

#Install Dependencies
Invoke-WebRequest -Uri https://github.com/thatian75642/OSDCLOUD/raw/main/Microsoft.VCLibs.x64.14.00.Desktop.zip -OutFile $PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop.zip
Invoke-WebRequest -Uri https://github.com/thatian75642/OSDCLOUD/raw/main/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.zip -OutFile $PSScriptRoot\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.zip

#Unpack Dependencies
Expand-Archive -Path "$PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop.zip" -DestinationPath "$PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop"
Expand-Archive -Path "$PSScriptRoot\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.zip" -DestinationPath "$PSScriptRoot\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe"
Remove-Item -path "$PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop.zip"
Remove-Item -path "$PSScriptRoot\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.zip"

#Install Dependencies
Add-AppPackage -path $PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop\Microsoft.NET.Native.Framework.2.2_2.2.29512.0_x64__8wekyb3d8bbwe.appx
Add-AppPackage -path $PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop\Microsoft.UI.Xaml.2.7.appx
Add-AppPackage -path $PSScriptRoot\Microsoft.VCLibs.x64.14.00.Desktop\Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage -path $PSScriptRoot\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle


#Unzip Desktop Installer
Expand-Archive -Path "$PSScriptRoot\Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe.zip" -DestinationPath "$PSScriptRoot\Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe"
Remove-Item -path "$PSScriptRoot\Microsoft.DesktopAppInstaller_1.17.11601.0_x64__8wekyb3d8bbwe.zip"
############################################################################################################################################################################
#Install apps with winget
Invoke-WebRequest -Uri https://raw.githubusercontent.com/thatian75642/OSDCLOUD/main/Winget%20test -OutFile $PSScriptRoot\Winget-install.ps1
.\Winget-install.ps1 -AppIDs notepad++.notepad++
