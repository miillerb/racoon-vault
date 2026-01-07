---
created: 2026-01-06T22:06:03-03:00
updated: 2026-01-06T22:06:03-03:00
title: Fluxo 02 - Finalizar sessão
tags: [fluxo/claude-code]
type: fluxo
---

# Fluxo 02 - Finalizar sessão

**Comando do usuário:** `finalizar sessão` OU **15min de inatividade**

**Execute automaticamente:**

1. **Preencher nota de sessão** já criada em `.claude/sessoes/YYYY-MM-DD_HH-mm-ss.md`
   - Nome: data e hora do INÍCIO da sessão (ex: `2025-11-21_00-01-26.md`)
   - Usar template de `.claude/template-sessao.md`
   - Frontmatter: `criado:` já está preenchido do início
   - Calcular duração em minutos (formato `Xh e Xmin` ou `Xmin`)
   - Documentar: objetivos, discussões, decisões, arquivos modificados, aprendizados, próximos passos

2. **Atualizar `.claude/memory.md`**
   - "Última atualização": data atual
   - Seção "Últimas Sessões": adicionar nova sessão no topo
   - Cada sessão: data, início, fim, duração, arquivo, resumo (2-3 frases)
   - Seção "Contexto Técnico Atual": HEAD, origin/main, commits não pushados, pendências
   - Preservar CreationTime do memory.md após edição

3. **Perguntar sobre commit** (somente se comando manual)
   - Mostrar `git status`
   - Perguntar: "Deseja fazer commit das mudanças?"
   - Se sim, seguir workflow de commit (revisar → propor mensagem → executar → perguntar push)
