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
Start-OSDCloud -FindImageFile -OSImageIndex 1

Write-Host -ForegroundColor Green "Reiniciando ..."
start-sleep -Seconds 5
wpeutil reboot
