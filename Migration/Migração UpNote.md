---
created: 2025-11-21T22:50:42-03:00
updated: 2025-11-22T00:52:00-03:00
title: Migração UpNote
tags: [migration, upnote, workflow]
type: documentação
---

# Migração UpNote

---

## Propósito

Migrar 1243 notas do UpNote para o Raccoon de forma organizada e controlada.

## Estrutura

```
Migration/UpNote/
├── [Categoria 1]/    # Criada automaticamente baseada em categories do UpNote
├── [Categoria 2]/
└── ...
```

A estrutura de categorias é criada dinamicamente durante a migração, baseada no campo `categories:` do frontmatter original do UpNote.

## Formato de Conversão

### Frontmatter Original (UpNote)
```yaml
---
date: YYYY-MM-DD HH:mm:ss
created: YYYY-MM-DD HH:mm:ss
categories:
- Categoria / Subcategoria
---
```

### Frontmatter Convertido (Raccoon)
```yaml
---
created: YYYY-MM-DDTHH:mm:ss-03:00
updated: YYYY-MM-DDTHH:mm:ss-03:00
title: [extraído do H1]
tags: [convertido de hashtags inline]
type: captura-rapida
---
```

**Nota:** Campo `categories:` do UpNote é usado apenas para criar a pasta, não é incluído no frontmatter convertido.

### Tags

**Duplo formato (UpNote + Raccoon):**
- **Frontmatter:** `tags: [tag1, tag2]` (formato Raccoon)
- **Corpo:** `#tag1 #tag2` (formato UpNote preservado)

Exemplo:
```markdown
---
tags: [clippings, produtividade]
---

# Título

#clippings #produtividade

Conteúdo...
```

## Workflow Completo

### 1. Exportar do UpNote

1. Abrir UpNote
2. Selecionar lote de notas (10-20 recomendado)
3. Exportar → Markdown
4. Salvar em pasta acessível

### 2. Copiar para Migration

1. Copiar arquivos exportados para `Migration/UpNote/`

### 3. Executar Migração

**Comando:** `migrar notas do upnote`

Claude irá automaticamente:

1. **Ler notas** em `Migration/UpNote/`
2. **Converter formato:**
   - Criar frontmatter Raccoon (ISO 8601)
   - Extrair título do H1
   - Converter hashtags inline para array no frontmatter
   - Manter hashtags inline no corpo
   - Remover `<br>` e `* * *`
   - Adicionar `type: captura-rapida`
   - Remover campo `categories:` do frontmatter
3. **Organizar por categoria:**
   - Ler `categories:` do frontmatter original
   - Criar subpasta correspondente
   - Mover nota convertida para essa pasta
4. **Listar processadas** para revisão
5. **Limpar:**
   - Deletar pasta UpNote exportada (ex: `UpNote_YYYY-MM-DD_HH-mm-ss/`)

## Progresso

**Total:** 1243 notas
**Processadas:** 5
**Restantes:** 1238

**Lotes migrados:**
- [x] Lote 1 (21-22/11/2025, 5 notas)
- [ ] Lote 2 (data, quantidade)

## Categorias Encontradas

**Saúde:** 2 notas
**Estudos:** 1 nota
**Recursos:** 1 nota
**Finanças:** 1 nota

---

**Última atualização:** 22/11/2025, 00:52:00
