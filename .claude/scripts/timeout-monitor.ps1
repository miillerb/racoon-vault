# Timeout Monitor - Raccoon Vault
# Monitora inatividade da sessão Claude Code
# 15min inativo → aviso | +90s sem resposta → commit e encerra

param(
    [string]$TimestampFile,
    [string]$SessionId,
    [int]$InactiveMinutes = 15,
    [int]$WarningSeconds = 90
)

$ErrorActionPreference = "SilentlyContinue"

# Função para registrar logs
function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path "$PSScriptRoot\..\logs\timeout-monitor.log" -Value "[$timestamp] $Message"
}

Write-Log "Monitor iniciado - Session: $SessionId | Timeout: ${InactiveMinutes}min | Warning: ${WarningSeconds}s"

$warningShown = $false
$warningTime = $null

while ($true) {
    Start-Sleep -Seconds 30  # Verifica a cada 30 segundos

    # Verifica se arquivo de timestamp existe
    if (-not (Test-Path $TimestampFile)) {
        Write-Log "Arquivo de timestamp não encontrado, criando..."
        Get-Date | Out-File -FilePath $TimestampFile -Encoding UTF8
        continue
    }

    # Lê último timestamp
    $lastActivity = Get-Content $TimestampFile -Raw | Get-Date
    $now = Get-Date
    $inactiveTime = ($now - $lastActivity).TotalMinutes

    # Se ainda não mostrou aviso e passou do timeout
    if (-not $warningShown -and $inactiveTime -ge $InactiveMinutes) {
        Write-Host "`n`n⚠️  AVISO: Sessão inativa há $([math]::Round($inactiveTime, 1)) minutos" -ForegroundColor Yellow
        Write-Host "Você tem $WarningSeconds segundos para responder ou a sessão será encerrada automaticamente." -ForegroundColor Yellow
        Write-Host "Digite qualquer coisa para continuar...`n" -ForegroundColor Cyan

        Write-Log "Aviso exibido - Inativo há $([math]::Round($inactiveTime, 1)) minutos"

        $warningShown = $true
        $warningTime = Get-Date

        # Atualiza timestamp para evitar múltiplos avisos
        Get-Date | Out-File -FilePath $TimestampFile -Encoding UTF8
        continue
    }

    # Se aviso foi mostrado, verifica se passou o tempo de resposta
    if ($warningShown -and $warningTime) {
        $timeSinceWarning = ($now - $warningTime).TotalSeconds

        if ($timeSinceWarning -ge $WarningSeconds) {
            Write-Host "`n`n🔴 TIMEOUT: Encerrando sessão automaticamente..." -ForegroundColor Red
            Write-Log "Timeout atingido - Encerrando sessão"

            # Commita mudanças se houver
            Push-Location (Split-Path $TimestampFile -Parent | Split-Path -Parent)

            $hasChanges = git status --porcelain
            if ($hasChanges) {
                Write-Host "Commitando alterações..." -ForegroundColor Yellow
                Write-Log "Commitando alterações pendentes"

                git add -A
                $commitMsg = @"
Encerramento automático por inatividade

- Sessão inativa por mais de $InactiveMinutes minutos
- Commit automático em $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
"@
                git commit -m $commitMsg
                Write-Log "Commit realizado com sucesso"
            } else {
                Write-Log "Nenhuma alteração para commitar"
            }

            Pop-Location

            # Encerra o processo do Claude Code
            Write-Host "Encerrando Claude Code..." -ForegroundColor Red
            Write-Log "Encerrando processo Claude Code"

            # Para o próprio monitor
            exit 0
        }
    }

    # Se recebeu atividade após o aviso, reseta o estado
    $lastActivityCheck = Get-Content $TimestampFile -Raw | Get-Date
    if ($warningShown -and $lastActivityCheck -gt $warningTime) {
        Write-Log "Atividade detectada após aviso - Resetando estado"
        $warningShown = $false
        $warningTime = $null
    }
}
