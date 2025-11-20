# Restart Claude Code
# Encerra a sessão atual e reinicia o Claude Code

Write-Host "Encerrando Claude Code..." -ForegroundColor Yellow

# Encontra e encerra processo do Claude Code
$claudeProcess = Get-Process | Where-Object { $_.ProcessName -like "*claude*" -or $_.CommandLine -like "*claude*" }

if ($claudeProcess) {
    $claudeProcess | Stop-Process -Force
    Write-Host "Processo encerrado." -ForegroundColor Green
    Start-Sleep -Seconds 2
} else {
    Write-Host "Processo Claude Code não encontrado." -ForegroundColor Red
}

# Reinicia Claude Code
Write-Host "Reiniciando Claude Code..." -ForegroundColor Cyan

# Tenta reiniciar usando o comando 'claude' se estiver no PATH
try {
    Start-Process "claude" -WorkingDirectory $PWD
    Write-Host "Claude Code reiniciado com sucesso!" -ForegroundColor Green
} catch {
    Write-Host "Erro ao reiniciar. Inicie manualmente o Claude Code." -ForegroundColor Red
}
