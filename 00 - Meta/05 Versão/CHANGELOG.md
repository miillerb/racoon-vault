# Changelog

Todas as mudanças notáveis do Raccoon Vault serão documentadas neste arquivo.

O formato segue [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/), e este projeto adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [0.1.4] - 25/11/2025

Expansão da documentação da estrutura do vault com todas as subpastas e pastas temporárias.

### Adicionado
- Documentação completa da estrutura do vault em CLAUDE.md, Bem-vindo de volta.md e README.md
- Subpastas documentadas em 00 - Meta: 01 Inbox, 02 Arquivos, 03 - Modelos, 04 Index, 05 Versão
- Pasta 15 - Timeline documentada (diário pessoal e linha do tempo)
- Subpasta comprovantes/ em 11 - Finanças documentada
- Pastas temporárias identificadas: Clippings/, Migration/
- Pasta Bases/ documentada (arquivos .base do Plugin nativo Bases)

### Modificado
- Estrutura do vault expandida de 9 para 26 itens documentados
- Posição de .claude/ movida para topo da estrutura
- Descrições mais específicas para cada pasta e subpasta
- CLAUDE.md versão atualizada para 1.1

## [0.1.3] - 24/11/2025

Sistema de Timeline criado e workflow de pausas implementado para preservar timestamps.

### Adicionado
- Sistema completo de inicialização automática de sessão em CLAUDE.md
- Workflow de captura de timestamps em pausas (regra crítica)
- Sistema de Timeline (15 - Timeline/) para diário pessoal
- Template de nota de diário em 03 - Modelos/
- Recurso documentando transferência WhatsApp via ADB
- Nota de diário sobre dia difícil (24/11/2025)
- Regra crítica #14: campo `created:` é imutável

### Modificado
- CLAUDE.md atualizado com instrução de captura de timestamp em pausas
- Sistema de finanças: 21 transações, saldo R$ 3.179,14

## [0.1.2] - 23/11/2025

Confirmação da filosofia Raccoon em uso: construir conforme necessidade real.

### Adicionado
- Sistema de Timeline com 3 entradas de diário
- Nota de diário sobre momento com Malu (22/11/2025)
- Comprovante migrado do UpNote: abastecimento R$ 100,00
- Estatísticas do cofre: 61 notas, 21 MB, 137 KB markdown (2,2 KB/nota)

### Modificado
- Análise de filosofia Raccoon: confirmado uso correto (construir conforme necessidade)
- Aplicado valor Flexibilidade: evitado trabalho administrativo desnecessário

## [0.1.1] - 22/11/2025

Migração de notas do UpNote e documentação retroativa de sessões.

### Adicionado
- Migração Lote 2 e 3 do UpNote (2 notas para Finanças)
- Nota "Minhas Contas e Cartões de Banco" migrada
- Nota "2019-07 - Contracheque Eletronorte" migrada
- PDF de contracheque em 02 Arquivos/
- Tags inline com formato ponto e vírgula ('`tag1`; `#tag2`)
- Documentação retroativa de sessão 21/11 (21:52-01:46)
- Cálculo de duração via git reflog

### Modificado
- Progresso migração UpNote: 7/1243 notas processadas
- Duração sessão 00:01 corrigida para 1h e 48min
- Memory.md atualizado com nova sessão

## [0.1.0] - 21/11/2025

Workflow de importação UpNote → Obsidian implementado e validação automática de commits.

### Adicionado
- Padronização de nomenclatura de sessões (timestamp de INÍCIO)
- Workflow completo UpNote → Obsidian em CLAUDE.md (5 passos)
- Validação automática de commits (título ≤50 chars, bullets ≤72 chars)
- Estruturas 00 - Meta/01 Inbox/ e 02 Arquivos/
- Importação de 3 notas do UpNote + 1 imagem (89 KB)

### Modificado
- 4 sessões renomeadas para formato YYYY-MM-DD_HH-mm-ss.md

## [0.0.3] - 20/11/2025

Sistema de finanças completo implementado com MoC, transações e comprovantes.

### Adicionado
- Estrutura inicial do vault (00-Meta até 90-Arquivo)
- Sistema de finanças completo em 11 - Finanças/
- MoC "📁 Minhas finanças.md" com tabela estática
- 11 transações financeiras iniciais (10 gastos, 1 receita)
- Campo obrigatório "Banco" em transações
- Padrão de comprovantes: `YYYY-MM-DD_HH-MM-SS - Título - valor.pdf/jpg`
- Workflow de comprovantes documentado em CLAUDE.md (7 passos)
- Preservação de metadados de arquivos (CreationTime com PowerShell)
- 2 comprovantes adicionados (13º salário R$ 980,13, Pastel R$ 66,00)

### Modificado
- README.md adaptado para compatibilidade GitHub
- MoC reordenado cronologicamente (mais antigo primeiro)

## [0.0.2] - 16/11/2025

Sistema de memória persistente para Claude Code implementado com formatos padronizados.

### Adicionado
- Sistema de memória persistente Claude em .claude/
- Arquivo memory.md (resumo executivo)
- Arquivo contexto-projeto.md (contexto detalhado)
- Template de sessão (template-sessao.md)
- Diretório .claude/sessoes/ para histórico
- Formatos padronizados de data/hora (ISO 8601 e pt-BR)
- Duração abreviada (Xh, Xm e Xs)

### Modificado
- Commits corrigidos para seguir regras (limite 50 chars)
- Merge com repositório remoto (origin/main)

## [0.0.1] - 15/11/2025

Repositório inicializado com manifesto e sistema de memória Claude.

### Adicionado
- Repositório Git inicializado
- Sistema de memória Claude implementado
- Primeira sessão Claude Code documentada
- Arquivo "Como o Raccoon funciona.md" (manifesto)
- Conceito de Nota Mínima definido
- Valores fundamentais: Curiosidade, Flexibilidade, Organização
- Regras de commit estabelecidas

---

## Versionamento Semântico

Formato: **MAJOR.MINOR.PATCH** (ex: 1.2.3)

- **MAJOR** (1.0.0): Mudanças incompatíveis que quebram funcionalidade existente
- **MINOR** (0.1.0): Novos recursos adicionados de forma retrocompatível
- **PATCH** (0.0.1): Correções de bugs e pequenas melhorias

Versões **0.x.x** indicam desenvolvimento inicial (pré-lançamento).
A versão **1.0.0** será o primeiro lançamento estável e completo.

## Legenda de Mudanças

- **Adicionado** para novos recursos
- **Modificado** para mudanças em recursos existentes
- **Descontinuado** para recursos que serão removidos
- **Removido** para recursos removidos
- **Corrigido** para correções de bugs
- **Segurança** para vulnerabilidades corrigidas
