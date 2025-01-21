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

# Função principal para processar a escolha
function Run-Escolha {
    param (
        [string]$choice
    )

    switch ($choice) {
        "1" {
            Write-Host "Opção selecionada: Enviar dados para o Autopilot e reiniciar" -ForegroundColor Yellow
            & X:\OSDCloud\Config\OSDSend.ps1
            Restart-System
        }

        "2" {
            Write-Host "Opção selecionada: Formatar c/autopilot img-off" -ForegroundColor Yellow
            & X:\OSDCloud\Config\OSDSend.ps1
            Write-Host -ForegroundColor Green "Iniciando OSDCloud..."
            Start-Sleep -Seconds 3
            Start-OSDCloud -FindImageFile
            Restart-System
        }

        "3" {
            Write-Host "Opção selecionada: Formatar c/autopilot img-on" -ForegroundColor Yellow
            & X:\OSDCloud\Config\OSDSend.ps1
            Write-Host -ForegroundColor Green "Iniciando OSDCloud..."
            Start-Sleep -Seconds 3
            Start-OSDCloud
            Restart-System
        }

        "4" {
            Write-Host "Opção selecionada: Formatar s/autopilot img-off" -ForegroundColor Yellow
            Write-Host -ForegroundColor Green "Iniciando OSDCloud..."
            Start-Sleep -Seconds 3
            Start-OSDCloud -FindImageFile
            Restart-System
        }

        "5" {
            Write-Host "Opção selecionada: Formatar s/autopilot img-on" -ForegroundColor Yellow
            Write-Host -ForegroundColor Green "Iniciando OSDCloud..."
            Start-Sleep -Seconds 3
            Start-OSDCloud
            Restart-System
        }

        "0" {
            Write-Host "reiniciar..." -ForegroundColor Green
            exit
        }

        default {
            Write-Host "Opção inválida. Tente novamente." -ForegroundColor Red
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
            Write-Host "Opção inválida. Saindo..." -ForegroundColor Red
            Shutdown-System
        }
    }
}

# Loop para exibir o menu até que uma opção válida seja escolhida
do {
    # Menu interativo
    Write-Host "Escolha uma opção:" -ForegroundColor Green
    Write-Host "1. Enviar dados do Autopilot e reiniciar" -ForegroundColor Green
    Write-Host "2. Formatar c/autopilot img-off" -ForegroundColor Green
    Write-Host "3. Formatar c/autopilot img-on" -ForegroundColor Green
    Write-Host "4. Formatar s/autopilot img-off" -ForegroundColor Green
    Write-Host "5. Formatar s/autopilot img-on" -ForegroundColor Green
    Write-Host "0. Sair" -ForegroundColor Green

    # Obter escolha do usuário
    $choice = Read-Host "Digite o número da opção desejada"

    # Chamar a função com a escolha do usuário
    Run-Escolha -choice $choice

    # Verificar se a escolha foi inválida (ou se foi pressionado apenas Enter)
    if ([string]::IsNullOrWhiteSpace($choice)) {
        Write-Host "1. Tentar novamente." -ForegroundColor Green
        Write-Host "2. Desligar." -ForegroundColor Red
        # Obter escolha do usuário
        $stdchoic = Read-Host "Digite o número da opção desejada"

        # Chamar a função com a escolha do usuário
        Run-STDEscolha -stdchoic $stdchoic
    }
} while ($choice -ne "0")
