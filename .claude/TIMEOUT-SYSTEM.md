# Sistema de Timeout por Inatividade - Raccoon

## Resumo

Sistema automático que detecta inatividade na sessão Claude Code e encerra automaticamente após período sem atividade.

## Configuração

- **Timeout de inatividade:** 15 minutos
- **Tempo de aviso:** 90 segundos
- **Ação automática:** Commit + encerramento de sessão

## Como Funciona

### 1. Início da Sessão (SessionStart)
- Hook inicia script `timeout-monitor.ps1` em background
- Script roda escondido (sem janela visível)
- Cria arquivo `.claude/.timeout-state` com timestamp inicial

### 2. Durante a Sessão (PostToolUse)
- A cada comando executado, hook atualiza `.timeout-state`
- Monitor verifica timestamp a cada 30 segundos

### 3. Detecção de Inatividade
**Após 15 minutos sem atividade:**
```
⚠️  AVISO: Sessão inativa há 15.0 minutos
Você tem 90 segundos para responder ou a sessão será encerrada automaticamente.
Digite qualquer coisa para continuar...
```

**Se você responder:**
- Timestamp é atualizado
- Monitor reseta contador
- Sessão continua normalmente

**Se NÃO responder em 90 segundos:**
```
🔴 TIMEOUT: Encerrando sessão automaticamente...
Commitando alterações...
Encerrando Claude Code...
```

### 4. Fim da Sessão (SessionEnd)
- Hook para processo do monitor
- Remove arquivo `.timeout-state`
- Limpa estado

## Arquivos do Sistema

```
.claude/
├── hooks.json                      # Configuração dos hooks
├── scripts/
│   └── timeout-monitor.ps1         # Monitor de inatividade
├── logs/
│   └── timeout-monitor.log         # Log de atividades
└── .timeout-state                  # Timestamp (gerado automaticamente)
```

## Logs

Localização: `.claude/logs/timeout-monitor.log`

Exemplos de entradas:
```
[2025-11-19 14:30:00] Monitor iniciado - Session: abc123 | Timeout: 15min | Warning: 90s
[2025-11-19 14:45:30] Aviso exibido - Inativo há 15.2 minutos
[2025-11-19 14:47:00] Timeout atingido - Encerrando sessão
[2025-11-19 14:47:01] Commitando alterações pendentes
[2025-11-19 14:47:02] Commit realizado com sucesso
```

## Personalização

### Alterar tempo de inatividade

Edite `.claude/hooks.json`, linha do SessionStart:
```json
"-InactiveMinutes 15"  // Altere para valor desejado
```

### Alterar tempo de aviso

Edite `.claude/hooks.json`, linha do SessionStart:
```json
"-WarningSeconds 90"  // Altere para valor desejado
```

### Desabilitar sistema

Renomeie ou remova `.claude/hooks.json`

## Troubleshooting

### Monitor não inicia
- Verifique permissões de execução do PowerShell
- Veja logs em `.claude/logs/timeout-monitor.log`

### Múltiplos processos do monitor
Execute manualmente:
```powershell
Get-Process | Where-Object {$_.CommandLine -like '*timeout-monitor.ps1*'} | Stop-Process -Force
```

### Arquivo .timeout-state não atualiza
- Hook PostToolUse pode estar bloqueado
- Verifique permissões do diretório `.claude/`

## Formato do Commit Automático

```
Encerramento automático por inatividade

- Sessão inativa por mais de 15 minutos
- Commit automático em 2025-11-19 14:47:00

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Notas Técnicas

- Monitor roda em processo separado (não bloqueia Claude)
- Usa `Get-Date` para timestamps precisos
- PowerShell executado com `-NoProfile` para velocidade
- Processo oculto com `-WindowStyle Hidden`
- Limpeza automática no SessionEnd
