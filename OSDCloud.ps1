$workplace = "C:\OSDCloud_Workplace"

#instalar module OSDCloud
Install-Module OSD -Force

#Set OSDCloud Template
New-OSDCloudTemplate –Language pt-br –SetInputLocale pt-br
Set-OSDCloudTemplate -Name 'OSDCloud-TJDFT'

#Criar um novo OSDCloud Workspace
New-OSDCloudWorkspace -WorkspacePath $workplace

#Limpar Linguas
$KeepTheseDirs = @('boot','efi','pt-br','sources','fonts','resources')
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\Boot" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\EFI\Microsoft\Boot" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force

Edit-OSDCloudWinPE -WorkspacePath $workplace -CloudDriver Dell,IntelNet,USB,WiFi

#Build WinPE to start OSDCloudGUI automatically
Edit-OSDCloudWinPE -UseDefaultWallpaper -StartOSDCloudGUI


Edit-OSDCloudWinPE -WorkspacePath C:\OSDCloudHome -CloudDriver HP -WebPSScript "https://nas.wuibaille.fr/LeblogOSDdownload/Repository/OSDCloud/Win11_PRO_fr.ps1" -Wallpaper "c:\temp\wallpaper.jpg"