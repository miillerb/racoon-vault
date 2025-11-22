---
date: 2025-11-11
title: Regras de Commit - Raccoon
tags: [raccoon, git, regras]
type: nota-mínima
---

# Regras de Commit - Raccoon

## Quando fazer commit

Faça commit a cada **mudança mínima significativa**.

Exemplos:
1. Criou uma nota nova completa
2. Atualizou informação importante em nota existente
3. Definiu nova regra do sistema
4. Reorganizou estrutura

**Não faça commit** para:
1. Correções de typo isoladas
2. Mudanças experimentais (teste antes)
3. Configurações temporárias do Obsidian

## Formato da mensagem

### Título (primeira linha)

1. Máximo **50 caracteres**
2. Verbo no **infinitivo**
3. Sem ponto final
4. Descreve o que foi feito

**Exemplos bons:**
```
Criar nota sobre valores do Raccoon
Atualizar regras de frontmatter
Adicionar contexto para IA mobile
Definir padrão de commits
```

**Exemplos ruins:**
```
Atualizei a nota (❌ não é infinitivo)
Criar nota sobre os valores fundamentais do sistema Raccoon (❌ passa de 50 chars)
Correções. (❌ vago demais)
```

### Corpo (linhas seguintes)

1. Pule uma linha após o título
2. Use **bullets** para listar mudanças
3. Máximo **72 caracteres por linha**
4. Se bullet exceder 72 chars, quebre linha com indentação de 2 espaços
5. Detalhe o que e por quê

**Exemplo completo:**
```
Criar regras de commit do Raccoon

- Definir frequência: a cada mudança significativa
- Estabelecer limite de 50 chars no título
- Estabelecer limite de 72 chars por linha no corpo
- Usar infinitivo e bullets
```

**Exemplo com quebra de linha:**
```
Adicionar configurações e plugins do Obsidian

- Adicionar 3 plugins: notebook-navigator, minimal-settings,
  update-time-on-edit
- Adicionar tema Minimal
- Atualizar configurações do Obsidian
```

## Comandos git básicos

**Sequência padrão:**

```bash
git status
git add .
git commit -m "Título aqui" -m "" -m "- Bullet 1
- Bullet 2
- Bullet 3"
git push
```

**Importante:** Use `-m ""` vazio para criar a linha em branco entre título e corpo. Depois, uma única string com todos os bullets (sem linhas em branco entre eles).

**Ou com editor:**

```bash
git status
git add .
git commit
# (abre editor para escrever mensagem formatada)
git push
```

## Checklist antes de commit

1. ✅ Revisei as mudanças (git status / git diff)
2. ✅ Título tem máx 50 chars
3. ✅ Título está no infinitivo
4. ✅ Corpo tem bullets
5. ✅ Linhas do corpo têm máx 72 chars
6. ✅ Mudança é significativa

## Commits via Claude Code

Quando usar Claude Code para fazer commits:

**Workflow obrigatório:**
1. Mostrar `git status` e mudanças ao usuário
2. Propor mensagem de commit seguindo formato padrão
3. Aguardar aprovação explícita do usuário
4. Executar commit usando HEREDOC

**Formato HEREDOC:**
```bash
git commit -m "$(cat <<'EOF'
Título do commit

- Bullet 1
- Bullet 2
- Bullet 3
EOF
)"
```

**Regras:**
1. NUNCA commitar sem aprovação prévia do usuário
2. Sempre usar HEREDOC para commits multi-linha
3. Seguir formato normal (título + corpo com bullets)
4. Adicionar linha em branco antes dos bullets
5. Título e bullets seguem mesmas regras (50/72 chars, infinitivo)
6. Bullets podem quebrar linha com indentação de 2 espaços
7. Não adicionar assinatura Claude
8. Não adicionar link "Generated with Claude Code"
9. Não adicionar "Co-Authored-By: Claude"

---

**Última atualização:** 2025-11-21
