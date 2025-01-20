Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
start-sleep -Seconds 3

Write-Host -ForegroundColor Green "Configurando Resolução do Display 1600"
Set-DisRes 1600
start-sleep -Seconds 2

Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
Import-Module OSD -Force
# Configurar o OSDCloud para usar o arquivo WIM

# Iniciar o Deployment Automático
Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
Start-OSDCloud -OSName 'Windows 11 24H2 x64' -OSLanguage pt-br -OSActivation Retail -OSEdition 'Enterprise N' 
pause

Write-Host -ForegroundColor Green "Reiniciando ..."
start-sleep -Seconds 5
wpeutil reboot
