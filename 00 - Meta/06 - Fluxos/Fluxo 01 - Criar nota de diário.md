---
created: 2026-01-06T22:06:03-03:00
updated: 2026-01-06T22:06:03-03:00
title: Fluxo 01 - Criar nota de diário
tags: [fluxo/timeline]
type: fluxo
---

# Fluxo 01 - Criar nota de diário

**Comando:** `criar nota de diário` ou `nova nota timeline`

**Execute automaticamente:**

1. **Perguntar ao usuário:**
   - Título/tema principal do dia (opcional)
   - Data (padrão: hoje)

2. **Verificar existência:**
   - Buscar em `10 - Pessoal/15 - Timeline/` notas com a data especificada
   - Se já existem notas para aquela data:
     * Uma nota: "Já existe nota de diário para DD/MM/YYYY: [nome]"
     * Múltiplas: "Já existem N notas de diário para DD/MM/YYYY: [lista]"
     * Perguntar: "Deseja abrir uma existente ou criar nova com título diferente?"
   - Se não existe, prosseguir

3. **Criar nota em `10 - Pessoal/15 - Timeline/YYYYMMDDHHММ - Título.md`**
   - Nome: formato `202601061425 - Título.md`
   - Frontmatter:
     * `created:` timestamp atual ISO 8601 com timezone
     * `updated:` timestamp atual ISO 8601 com timezone
     * `tags:` [tipo/diário, timeline/YYYY]

4. **Estrutura do corpo:**
   - H1: Dia da semana abreviado, data pt-BR (ex: `# Ter, 06/01/2026`)
   - Seções vazias prontas:
     * `## Pessoal`
     * `## Trabalho`
     * `## Notas`
     * `## Compromissos`

5. **Sincronizar CreationTime com frontmatter created:**
   ```powershell
   (Get-Item 'caminho/arquivo.md').CreationTime = 'YYYY-MM-DD HH:mm:ss'
   ```

6. **Informar usuário:** "Nota de diário criada em Timeline"
