$PSDefaultParameterValues['*:Encoding'] = 'windows1252'


# Menu interativo
Write-Host "Escolha uma opção:" -ForegroundColor Green
Write-Host "1. Formatar c/autopilot img-off" -ForegroundColor Green
Write-Host "2. Formatar c/autopilot img-on" -ForegroundColor Green
Write-Host "3. Enviar dados do Autopilot" -ForegroundColor Green
Write-Host "4. Formatar s/autopilot img-off" -ForegroundColor Green
Write-Host "5. Formatar s/autopilot img-on" -ForegroundColor Green
Write-Host "0. Sair" -ForegroundColor Green

# Obter escolha do usuário
$choice = Read-Host "Digite o número da opção desejada" 

switch ($choice) {
    "1" {
        Write-Host "Opção selecionada: Formatar equipamento" -ForegroundColor Yellow
        X:\OSDCloud\Config\OSDSend.ps1
        Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
        start-sleep -Seconds 3

        Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
        Import-Module OSD -Force
        # Configurar o OSDCloud para usar o arquivo WIM

        # Iniciar o Deployment Automático
        Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
        Start-OSDCloud -FindImageFile

        Write-Host -ForegroundColor Green "Reiniciando ..."
        start-sleep -Seconds 5
        wpeutil reboot
    }
     "2" {
        Write-Host "Opção selecionada: Formatar equipamento" -ForegroundColor Yellow
        X:\OSDCloud\Config\OSDSend.ps1
        Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
        start-sleep -Seconds 3

        Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
        Import-Module OSD -Force
        # Configurar o OSDCloud para usar o arquivo WIM

        # Iniciar o Deployment Automático
        Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
        Start-OSDCloud

        Write-Host -ForegroundColor Green "Reiniciando ..."
        start-sleep -Seconds 5
        wpeutil reboot
    }

    "3" {
        Write-Host "Opção selecionada: Enviar dados para o Autopilot" -ForegroundColor Yellow
        X:\OSDCloud\Config\OSDSend.ps1
        wpeutil reboot
    }
    "4" {
        Write-Host "Opção selecionada: Formatar s/autopilot img-on" -ForegroundColor Yellow
        Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
        start-sleep -Seconds 3

        Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
        Import-Module OSD -Force
        # Configurar o OSDCloud para usar o arquivo WIM

        # Iniciar o Deployment Automático
        Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
        Start-OSDCloud -FindImageFile

        Write-Host -ForegroundColor Green "Reiniciando ..."
        start-sleep -Seconds 5
        wpeutil reboot
    }
     "5" {
        Write-Host "Opção selecionada: Formatar s/autopilot img-off" -ForegroundColor Yellow
        Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
        start-sleep -Seconds 3

        Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
        Import-Module OSD -Force
        # Configurar o OSDCloud para usar o arquivo WIM

        # Iniciar o Deployment Automático
        Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
        Start-OSDCloud

        Write-Host -ForegroundColor Green "Reiniciando ..."
        start-sleep -Seconds 5
        wpeutil reboot
    }
    "0" {
        Write-Host "Saindo..." -ForegroundColor Green
        exit
    }
    default {
        Write-Host "Opção inválida. Tente novamente." -ForegroundColor Red
    }
}
