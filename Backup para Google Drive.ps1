# Backup do Raccoon para Google Drive

Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Backup do Raccoon para Google Drive" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$ORIGEM = $PSScriptRoot
$DESTINO = "G:\Meu Drive\40-49 - Anotações\42 - Cofres Obsidian\Sync\Raccoon"

Write-Host "Origem: $ORIGEM" -ForegroundColor Yellow
Write-Host "Destino: $DESTINO" -ForegroundColor Yellow
Write-Host ""
Write-Host "Iniciando backup..." -ForegroundColor Green
Write-Host ""

robocopy "$ORIGEM" "$DESTINO" /E /PURGE /R:3 /W:5

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host " Backup concluído!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Read-Host "Pressione Enter para sair"
