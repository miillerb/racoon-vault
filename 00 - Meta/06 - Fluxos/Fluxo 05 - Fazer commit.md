---
created: 2026-01-06T22:06:03-03:00
updated: 2026-01-06T22:06:03-03:00
title: Fluxo 05 - Fazer commit
tags: [fluxo/git]
type: fluxo
---

# Fluxo 05 - Fazer commit

**Comando do usuário:** `fazer commit`

**Execute automaticamente:**

1. Executar `git status` e analisar mudanças
2. Propor mensagem de commit seguindo regras (título + bullets)
3. **AGUARDAR APROVAÇÃO EXPLÍCITA DO USUÁRIO**
4. Adicionar arquivos com `git add` (excluir .obsidian/ salvo solicitação)
5. Executar commit com HEREDOC:
   ```bash
   git commit -m "$(cat <<'EOF'
   Título do commit

   - Bullet 1
   - Bullet 2
   EOF
   )"
   ```
6. Executar `git status` após commit
7. Perguntar: "Deseja fazer push para origin/main?"

**CRÍTICO:** NUNCA commitar sem aprovação prévia do usuário
