# Função para reiniciar o sistema
function Restart-System {
    Write-Host -ForegroundColor Green "Reiniciando sistema..."
    Start-Sleep -Seconds 2
    Restart-Computer -force
}

# Função para desligar o sistema
function Shutdown-System {
    Write-Host -ForegroundColor Green "Desligando sistema..."
    Start-Sleep -Seconds 2
    Stop-Computer
}

# Função para acionar o osdcloud-on
function osdcloud-on {
    Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
    start-sleep -Seconds 3
   
    Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
    Import-Module OSD -Force
    # Configurar o OSDCloud para usar o arquivo WIM
   
    # Iniciar o Deployment Automático
    Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
    Start-OSDCloud -Firmware -Restart
    Restart-System
}

# Função para acionar o osdcloud-off
function osdcloud-off {
    Write-Host -ForegroundColor Green "Iniciando OSDCloud  ..."
    start-sleep -Seconds 3
   
    Write-Host -ForegroundColor Green "Importando OSD Modulo Powershell"
    Import-Module OSD -Force
    # Configurar o OSDCloud para usar o arquivo WIM
   
    # Iniciar o Deployment Automático
    Write-Host -ForegroundColor Green "Iniciando OSD Cloud"
    Start-OSDCloud -FindImageFile -Firmware -Restart -ZTI
    Restart-System
}

function swich_loop{
    cls
    Write-Host "Escolha uma Opcao:" -ForegroundColor Green
    Write-Host "1. Enviar dados do Autopilot e reiniciar" -ForegroundColor Green
    Write-Host "2. Formatar c/autopilot img-off" -ForegroundColor Green
    Write-Host "3. Formatar c/autopilot img-on" -ForegroundColor Green
    Write-Host "4. Formatar s/autopilot img-off" -ForegroundColor Green
    Write-Host "5. Formatar s/autopilot img-on" -ForegroundColor Green
    Write-Host "6. Iniciar OSDCloudGUI" -ForegroundColor Green
    Write-Host "0. Sair" -ForegroundColor Green
    Write-Host "9. Desligar" -ForegroundColor Green

    # Obter escolha do usuário
    $choice = Read-Host "Digite o numero da Opcao desejada"

    # Chamar a função com a escolha do usuário
    Run-Escolha -choice $choice
    cls
    # Verificar se a escolha foi inválida (ou se foi pressionado apenas Enter)
    if ([string]::IsNullOrWhiteSpace($choice)) {
        cls
        Write-Host "1. Tentar novamente." -ForegroundColor Green
        Write-Host "2. Desligar." -ForegroundColor Red
        Write-Host "2. dentro do loop swich_loop " -ForegroundColor Red

        # Obter escolha do usuário
        $stdchoic = Read-Host "Digite o numero da Opcao desejada"
        cls
        if($stdchoic -eq 1 ){swich_loop}
        if($stdchoic -eq 2 ){Shutdown-System}
        if([string]::IsNullOrWhiteSpace($stdchoic)){Shutdown-System}
        if(($stdchoic -notlike 1) -or ($stdchoic -notlike 2)){loop_tentarnovamente}
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
        "6" {
            Write-Host "Opcao selecionada: Iniciar OSDCloudGUI" -ForegroundColor Yellow
            & X:\OSDCloud\Config\OSDSend.ps1
            Start-OSDCloudGUI
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
            cls
            Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red
            Write-Host "1. Tentar novamente." -ForegroundColor Green
            Write-Host "2. Desligar." -ForegroundColor Red
            # Obter escolha do usuário
            $stdchoic = Read-Host "Digite o numero da Opcao desejada"
            cls
            switch ($stdchoic) {
            "1" {swich_loop}
            "2" {Shutdown-System}
            default {
            if([string]::IsNullOrWhiteSpace($stdchoic)){Shutdown-System}
            loop_tentarnovamente}
            }

        }
    }
}

function loop_tentarnovamente{
            cls
            Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red
            Write-Host "1. Tentar novamente." -ForegroundColor Green
            Write-Host "2. Desligar." -ForegroundColor Red
            # Obter escolha do usuário
            $stdchoic = Read-Host "Digite o numero da Opcao desejada"
            cls
            switch ($stdchoic) {
            "1" {swich_loop}
            "2" {Shutdown-System}
            default {loop_tentarnovamente}
            }
}

    # Menu interativo
    Write-Host "Escolha uma Opcao:" -ForegroundColor Green
    Write-Host "1. Enviar dados do Autopilot e reiniciar" -ForegroundColor Green
    Write-Host "2. Formatar c/autopilot img-off" -ForegroundColor Green
    Write-Host "3. Formatar c/autopilot img-on" -ForegroundColor Green
    Write-Host "4. Formatar s/autopilot img-off" -ForegroundColor Green
    Write-Host "5. Formatar s/autopilot img-on" -ForegroundColor Green
    Write-Host "6. Iniciar OSDCloudGUI" -ForegroundColor Green
    Write-Host "0. Sair" -ForegroundColor Green
    Write-Host "9. Desligar" -ForegroundColor Green

    # Obter escolha do usuário
    $choice = Read-Host "Digite o numero da Opcao desejada"
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"C:\OSDCloud\Config\SystemInfo.ps1`""
    # Chamar a função com a escolha do usuário
    $validChoices = @(1, 2, 3, 4, 5, 6, 0, 9)
    if (-not [int]::TryParse($choice, [ref]$null)) {
    cls
    & X:\OSDCloud\Config\OSDSend.ps1
    } elseif ($validChoices -notcontains [int]$choice) {
    cls
    & X:\OSDCloud\Config\OSDSend.ps1
    }
    cls
    Run-Escolha -choice $choice

   
