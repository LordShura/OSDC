# Função para reiniciar o sistema
function Restart-System {
    Write-Host -ForegroundColor Green "Reiniciando sistema..."
    Start-Sleep -Seconds 2
    wpeutil reboot
}

# Função para desligar o sistema
function Shutdown-System {
    Write-Host -ForegroundColor Green "Desligando sistema..."
    Start-Sleep -Seconds 2
    wpeutil shutdown
}
# Função para acionar o osdcloud-on
function osdcloud-on {
    $down -= 1
    Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
    start-sleep -Seconds 3
   
    Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
    Import-Module OSD -Force
    # Configurar o OSDCloud para usar o arquivo WIM
   
    # Iniciar o Deployment Automático
    Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
    Start-OSDCloud
    wpeutil restart
}
# Função para acionar o osdcloud-off
function osdcloud-off {
    $down -= 1
    Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
    start-sleep -Seconds 3
   
    Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
    Import-Module OSD -Force
    # Configurar o OSDCloud para usar o arquivo WIM
   
    # Iniciar o Deployment Automático
    Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
    Start-OSDCloud -FindImageFile
    wpeutil restart
}

function swich_loop{
    Write-Host "$down" -ForegroundColor Green
    Write-Host "Escolha uma Opcao:" -ForegroundColor Green
    Write-Host "1. Enviar dados do Autopilot e reiniciar" -ForegroundColor Green
    Write-Host "2. Formatar c/autopilot img-off" -ForegroundColor Green
    Write-Host "3. Formatar c/autopilot img-on" -ForegroundColor Green
    Write-Host "4. Formatar s/autopilot img-off" -ForegroundColor Green
    Write-Host "5. Formatar s/autopilot img-on" -ForegroundColor Green
    Write-Host "0. Sair" -ForegroundColor Green
    Write-Host "9. Desligar" -ForegroundColor Green

    # Obter escolha do usuário
    $choice = Read-Host "Digite o numero da Opcao desejada"

    # Chamar a função com a escolha do usuário
    Run-Escolha -choice $choice
    cls
    # Verificar se a escolha foi inválida (ou se foi pressionado apenas Enter)
    if ([string]::IsNullOrWhiteSpace($choice)) {
        X:\OSDCloud\Config\OSDSend.ps1
        cls
        Write-Host "1. Tentar novamente." -ForegroundColor Green
        Write-Host "2. Desligar." -ForegroundColor Red
        # Obter escolha do usuário
        $stdchoic = Read-Host "Digite o numero da Opcao desejada"
        if($stdchoic -eq 1 ){swich_loop}
        if($stdchoic -eq 2 ){Shutdown-System}
        if([string]::IsNullOrWhiteSpace($stdchoic)){Shutdown-System}
    }


}

# Função principal para processar a escolha
function Run-Escolha {
    param (
        [string]$choice
    )

    switch ($choice) {
        "1" {
            Write-Host "Opcao selecionada: Enviar dados para o Autopilot e reiniciar" -ForegroundColor Yellow
            & X:\OSDCloud\Config\OSDSend.ps1
            Restart-System
        }

        "2" {
            Write-Host "Opcao selecionada: Formatar c/autopilot img-off" -ForegroundColor Yellow
            & X:\OSDCloud\Config\OSDSend.ps1
            osdcloud-off
            Restart-System
        }

        "3" {
            Write-Host "Opcao selecionada: Formatar c/autopilot img-on" -ForegroundColor Yellow
            & X:\OSDCloud\Config\OSDSend.ps1
            osdcloud-on
            Restart-System
        }

        "4" {
            Write-Host "Opcao selecionada: Formatar s/autopilot img-off" -ForegroundColor Yellow
            osdcloud-off
            Restart-System
        }

        "5" {
            Write-Host "Opcao selecionada: Formatar s/autopilot img-on" -ForegroundColor Yellow
            osdcloud-on
            Restart-System
        }

        "0" {
            Write-Host "reiniciar..." -ForegroundColor Green
            Restart-System
        }
        "9" {
            Shutdown-System
        }

        default {
            X:\OSDCloud\Config\OSDSend.ps1
            Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red
            Start-Sleep -Seconds 2
            cls
        }
    }
}

# Função para processar a escolha após uma entrada inválida
function Run-STDEscolha {
    param (
        [string]$stdchoic
    )
    switch ($stdchoic) {
        "1" {
            # Reexibir o menu após a escolha de tentar novamente
            return
        }

        "2" {
            Shutdown-System
        }

        default {
            Write-Host "Opcao invalida. Saindo..." -ForegroundColor Red
            Shutdown-System
        }
    }
}
    # Menu interativo
    Write-Host "$down" -ForegroundColor Green
    Write-Host "Escolha uma Opcao:" -ForegroundColor Green
    Write-Host "1. Enviar dados do Autopilot e reiniciar" -ForegroundColor Green
    Write-Host "2. Formatar c/autopilot img-off" -ForegroundColor Green
    Write-Host "3. Formatar c/autopilot img-on" -ForegroundColor Green
    Write-Host "4. Formatar s/autopilot img-off" -ForegroundColor Green
    Write-Host "5. Formatar s/autopilot img-on" -ForegroundColor Green
    Write-Host "0. Sair" -ForegroundColor Green
    Write-Host "9. Desligar" -ForegroundColor Green

    # Obter escolha do usuário
    $choice = Read-Host "Digite o numero da Opcao desejada"

    # Chamar a função com a escolha do usuário
    Run-Escolha -choice $choice
    cls
    # Verificar se a escolha foi inválida (ou se foi pressionado apenas Enter)
    if ([string]::IsNullOrWhiteSpace($choice)) {
        X:\OSDCloud\Config\OSDSend.ps1
        cls
        Write-Host "1. Tentar novamente." -ForegroundColor Green
        Write-Host "2. Desligar." -ForegroundColor Red
        # Obter escolha do usuário
        $stdchoic = Read-Host "Digite o numero da Opcao desejada"
        if($stdchoic -eq 1 ){swich_loop}
        if($stdchoic -eq 2 ){Shutdown-System}
        if([string]::IsNullOrWhiteSpace($stdchoic)){Shutdown-System}

    }
