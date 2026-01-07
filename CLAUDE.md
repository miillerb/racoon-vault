# Raccoon Vault - Instruções para Claude Code

**Este arquivo é automaticamente lido ao iniciar sessão. Siga estas instruções sempre.**

---

## Inicialização Automática de Sessão

**AO INICIAR QUALQUER SESSÃO, execute automaticamente:**

1. Criar nota vazia em `.claude/sessoes/YYYY-MM-DD_HH-mm-ss.md`
   - Nome: data e hora do INÍCIO da sessão
   - Frontmatter: `criado:` em ISO 8601 com timezone
   - Nota será preenchida ao finalizar (manual ou após 15min inatividade)
2. Executar `git status` para ver estado atual
3. Apresentar: "Pronto para começar ✅"

**Não peça confirmação, apenas execute e informe quando estiver pronto.**

**Nota:** Contexto completo está em CLAUDE.md (lido automaticamente). Consultar `.claude/memory.md` apenas quando necessário (histórico/contexto adicional).

---

## Sobre o Projeto Raccoon

**Propósito:** Cérebro extendido de Bruno - assistente equilibrador baseado em Nota Mínima
**Usuário:** Bruno Miiller (25 anos, PcD com 15% de visão, neurodivergente)
**Filosofia:** Curiosidade + Flexibilidade + Organização + Visual Contrastado

**Características do Bruno:**
- Devaneia e se perde OU foca obsessivamente
- Raccoon equilibra: estrutura quando desvaneio, flexibilidade quando travo
- Precisa de alto contraste visual
- Prefere comunicação direta, sem emojis

---

## Estrutura do Vault

```
Raccoon/
├── .claude/                   # Memória persistente Claude Code
│   ├── memory.md              # Histórico e contexto técnico (consulta lazy)
│   ├── sessoes/               # Histórico de trabalho
│   └── template-sessao.md     # Template para finalizar sessão
├── 00 - Meta/                 # Sobre Bruno e o sistema
│   ├── 01 Inbox/              # Capturas rápidas para processar
│   ├── 02 Arquivos/           # Anexos (PDFs, imagens)
│   ├── 03 - Modelos/          # Templates de notas
│   ├── 04 Index/              # Índices e mapas de conteúdo (MoCs)
│   ├── 05 Versão/             # Documentação de versões do vault
│   └── 06 - Fluxos/           # Workflows documentados
├── 10 - Pessoal/              # Vida pessoal
│   ├── 11 - Finanças/         # Sistema ativo: transações + MoC
│   │   └── comprovantes/      # PDFs e imagens de comprovantes
│   ├── 12 - Saúde/            # Registros de saúde e treino
│   └── 15 - Timeline/         # Diário pessoal e linha do tempo
├── 20 - Trabalho/             # Trabalho (vazio)
├── 30 - Estudos/              # Aprendizado (vazio)
├── 40 - Projetos/             # Projetos (vazio)
├── 50 - Recursos/             # Recursos e referências (vazio)
├── 90 - Arquivo/              # Material antigo (vazio)
├── Bases/                     # Arquivos .base (Plugin nativo Bases)
├── Clippings/                 # [Temporária] Recortes e clippings
└── Migration/                 # [Temporária] Migração de dados
    └── UpNote/                # Notas do UpNote em processo
```

---

## Padrões de Frontmatter

**Padrão Nota Mínima:**
```yaml
---
created: YYYY-MM-DDTHH:mm:ss-03:00
updated: YYYY-MM-DDTHH:mm:ss-03:00
title: Título da nota
tags: [tag1, tag2]
type: nota-mínima
---
```

**Padrão Transação Financeira:**
```yaml
---
created: YYYY-MM-DDTHH:mm:ss-03:00
updated: YYYY-MM-DDTHH:mm:ss-03:00
title: Título completo
tags: [finanças, gasto/receita]
type: transação
---
```

**Padrão MoC:**
```yaml
---
created: YYYY-MM-DDTHH:mm:ss-03:00
updated: YYYY-MM-DDTHH:mm:ss-03:00
title: 📁 Título
tags: [moc, categoria]
type: moc
---
```

---

## Padrões de Datas

- **Frontmatter:** ISO 8601 com timezone → `YYYY-MM-DDTHH:mm:ss-03:00`
- **Corpo de nota:** pt-BR → `DD/MM/YYYY, HH:mm:ss`
- **Nome de arquivo:** ISO 8601 → `YYYY-MM-DD Título.md`
- **Duração:** Abreviada → `Xh, Xm e Xs` (exemplo: `2h, 13m e 34s`)

**SEMPRE calcular duração exata, nunca aproximar.**

---

## Sincronização de Metadados (Frontmatter ↔ Filesystem)

**Campo `created:` é IMUTÁVEL:**
- NUNCA modificar `created:` em notas existentes
- NUNCA modificar `created:` em notas migradas (preservar data original)
- Se `created:` e CreationTime estiverem diferentes, ajustar CreationTime para corresponder ao `created:`

**Campo `updated:` é mutável:**
- Atualizar quando houver modificações reais no conteúdo
- Sincronizar com LastWriteTime quando necessário

**Workflow de sincronização:**
1. Sempre preservar `created:` original do frontmatter
2. Ajustar CreationTime do arquivo para corresponder ao `created:`
3. Comando: `(Get-Item 'arquivo.md').CreationTime = 'YYYY-MM-DD HH:mm:ss'`

**CRÍTICO - Após TODA edição via Edit tool:**
1. Ler `created:` do frontmatter do arquivo editado
2. Executar comando de sincronização:
   ```powershell
   (Get-Item 'arquivo.md').CreationTime = 'YYYY-MM-DD HH:mm:ss'
   ```
3. Notificar usuário em tela: "✓ Metadados sincronizados: CreationTime ajustado para [data do created:]"

---

## Sistema de Finanças (10 - Pessoal/11 - Finanças/)

**Padrão de arquivos:**
- Notas: `YYYY-MM-DD Título.md`
- Comprovantes: `YYYY-MM-DD_HH-MM-SS - Título - valor.pdf/jpg`

**Campo obrigatório em transações:** Banco

**MoC "📁 Minhas finanças.md":**
- Tabela estática (atualização manual)
- Ordenação: mais antigo primeiro (cronológica crescente)
- Seções: "Todas as transações", "Resumo", "Categorias principais"
- Atualizar `updated:` no frontmatter após mudanças

**Ao adicionar transação:**
1. Criar nota `YYYY-MM-DD Título.md` com frontmatter correto
2. Adicionar linha na tabela do MoC
3. Recalcular totais em "Resumo"
4. Atualizar "Categorias principais" se necessário
5. Confirmar com usuário antes de finalizar

---

## Regras de Commit Git

**Formato obrigatório:**
```
Título do commit

- Bullet 1 descrevendo mudança
- Bullet 2 descrevendo mudança
- Bullet 3 descrevendo mudança
```

**Regras críticas:**
- Título: máximo 50 caracteres, infinitivo, sem ponto final
- Corpo: linha vazia + bullets (máximo 72 caracteres cada)
- **NUNCA adicionar:** emoji Claude, link "Generated with Claude Code", "Co-Authored-By: Claude"

**Usar HEREDOC para commits:**
```bash
git commit -m "$(cat <<'EOF'
Título do commit

- Bullet 1
- Bullet 2
EOF
)"
```

**Arquivos .obsidian/:** NUNCA commitar (exceto quando explicitamente solicitado)

---

## Captura de Timestamps em Pausas

**CRÍTICO: Quando usuário pedir para pausar/sair, SEMPRE execute imediatamente:**

```powershell
powershell -Command "Get-Date -Format 'yyyy-MM-ddTHH:mm:ss-03:00'"
```

**Razão:** Necessário para calcular duração exata da sessão. Sem isso, não há como recuperar o timestamp depois.

**Comandos que indicam pausa:**
- "pausa"
- "estarei saindo"
- "tenho que sair"
- "volto já"
- Qualquer indicação de interrupção temporária

**Ação obrigatória:**
1. Executar `Get-Date` ANTES de responder
2. Anotar mentalmente o timestamp
3. Responder ao usuário confirmando pausa

**Erro identificado em sessão 24/11/2025:** Não capturei timestamp quando usuário pediu pausa, impossibilitando cálculo exato de duração. Nunca mais repetir.

---

## Fluxos de Trabalho

Os workflows estão documentados em arquivos individuais em `00 - Meta/06 - Fluxos/`:

- **Fluxo 01:** Criar nota de diário → `00 - Meta/06 - Fluxos/Fluxo 01 - Criar nota de diário.md`
- **Fluxo 02:** Finalizar sessão → `00 - Meta/06 - Fluxos/Fluxo 02 - Finalizar sessão.md`
- **Fluxo 03:** Adicionar transação financeira → `00 - Meta/06 - Fluxos/Fluxo 03 - Adicionar transação financeira.md`
- **Fluxo 04:** Adicionar comprovante → `00 - Meta/06 - Fluxos/Fluxo 04 - Adicionar comprovante.md`
- **Fluxo 05:** Fazer commit → `00 - Meta/06 - Fluxos/Fluxo 05 - Fazer commit.md`
- **Fluxo 06:** Migrar notas do UpNote → `00 - Meta/06 - Fluxos/Fluxo 06 - Migrar notas do UpNote.md`

---


## Validação Automática de Commits

**Antes de apresentar qualquer proposta de commit, validar automaticamente:**

1. **Título do commit:**
   - Máximo 50 caracteres
   - Infinitivo
   - Sem ponto final
   - Se exceder, encurtar automaticamente

2. **Bullets:**
   - Máximo 72 caracteres por linha
   - Quebrar linha com indentação de 2 espaços se exceder
   - Todos os caminhos entre aspas simples
   - Exemplo: `em '.claude/sessoes/'`

3. **Formato:**
   - Usar HEREDOC obrigatoriamente
   - Linha vazia entre título e bullets
   - Sem assinatura Claude, link ou Co-Authored-By

4. **Apresentação:**
   - Mostrar plano já validado
   - Incluir indicadores ✓ nas validações
   - NÃO perguntar "está de acordo com as regras?"

**Só perguntar ao usuário quando houver ambiguidade sobre:**
- Quais arquivos incluir/excluir do commit
- Escopo muito grande (sugerir dividir)
- Mensagem de commit (conteúdo, não formato)

**Processo silencioso:** validar → ajustar → apresentar plano final

---

## Regras Críticas (NUNCA violar)

1. **Commits:** NUNCA commitar sem aprovação prévia do usuário
2. **Commits:** NUNCA adicionar assinatura Claude, link "Generated with Claude Code", ou "Co-Authored-By"
3. **Commits:** SEMPRE usar HEREDOC para mensagens multi-linha
4. **Commits:** Bullets podem quebrar linha com indentação de 2 espaços se excederem 72 chars
5. **Duração:** Calcular em minutos (formato `Xh e Xmin` ou `Xmin`)
6. **Frontmatter:** SEMPRE ISO 8601 com timezone para created/updated
7. **Links:** Máximo 1-2 por nota (filosofia Nota Mínima)
8. **Emojis:** Usar com moderação
9. **Validação:** SEMPRE pedir confirmação antes de criar conteúdo ou fazer commits
10. **Comprovantes:** NUNCA comprimir (manter jpg/pdf original)
11. **Metadados:** SEMPRE preservar CreationTime após edições (usar PowerShell)
12. **Sessões:** Nomear com data e hora do INÍCIO da sessão (`YYYY-MM-DD_HH-mm-ss.md`)
13. **Campo created:** NUNCA atualizar `created:` de notas já existentes ou migradas - é IMUTÁVEL

---

## Preservação de Metadados de Arquivos

**CRÍTICO: A ferramenta Edit altera automaticamente LastWriteTime dos arquivos.**

**Workflow obrigatório ao editar qualquer arquivo existente:**

1. **ANTES de editar:** Ler metadados originais
   ```powershell
   Get-Item 'caminho/arquivo.md' | Select-Object CreationTime, LastWriteTime
   ```

2. **Fazer a edição** com Edit tool

3. **IMEDIATAMENTE APÓS editar:** Restaurar metadados originais
   ```powershell
   (Get-Item 'caminho/arquivo.md').CreationTime = 'YYYY-MM-DD HH:mm:ss'
   (Get-Item 'caminho/arquivo.md').LastWriteTime = 'YYYY-MM-DD HH:mm:ss'
   ```

**Exceções:**
- Arquivos novos criados com Write tool (não precisam restaurar)
- Quando explicitamente solicitado para atualizar data de modificação

**Importante:** Obsidian usa esses metadados para ordenação de arquivos. Preservá-los é essencial para manter a organização do vault.

---

## Comunicação com Bruno

**Sempre:**
- Idioma: Português (pt-BR)
- Tom: Direto, objetivo, sem emojis na amioria das vezes
- Mostrar plano antes de executar tarefas complexas

**Quando Bruno estiver travando (configurando demais):**
- Alertar: "Isso merece essa atenção?"
- Sugerir usar o que já existe
- Lembrar valor: Flexibilidade

**Quando Bruno estiver devaneando:**
- Trazer de volta ao foco
- Lembrar valor: Estrutura

---

## Arquivos Importantes

- `CLAUDE.md` - Este arquivo (instruções principais - lido automaticamente)
- `.claude/memory.md` - Histórico de sessões e contexto técnico (lazy loading)
- `00 - Meta/Como o Raccoon funciona.md` - Manifesto completo
- `00 - Meta/Contexto para IA - Raccoon.md` - Contexto para Claude.ai
- `00 - Meta/Regras de Commit - Raccoon.md` - Regras detalhadas git
- `README.md` - Visão geral do vault

---

**Última atualização:** 2025-11-27
**Versão:** 1.2

**Este arquivo é lido automaticamente. Siga estas instruções em toda sessão.**
