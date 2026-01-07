---
created: 2025-01-07T18:30:00-03:00
updated: 2025-01-07T18:30:00-03:00
title: Notion - Export Markdown com Metadados
tags: [recurso, saas, markdown, notion, trabalho]
type: recurso
---

# Notion - Export Markdown com Metadados

## Resumo

SaaS web para notas com export para Markdown incluindo timestamps (milissegundos) e tags. Ideal para ambiente de trabalho sem instalação de programas.

---

## Características

- ✅ 100% web-based (funciona em qualquer navegador)
- ✅ Export Markdown com YAML frontmatter
- ✅ Timestamps ISO 8601 com milissegundos
- ✅ Sistema de tags (Multi-select properties)
- ✅ Gratuito (plano Free suficiente)

---

## Setup Inicial

### 1. Adicionar Propriedades ao Database

Para cada database/página:

1. Clique **"+ Add a property"**
2. Role até **"Advanced"**
3. Adicione **"Created time"** (timestamp automático)
4. Adicione **"Last edited time"** (timestamp automático)
5. Adicione **"Tags"** (tipo Multi-select)
6. **Ative (toggle on)** todas as propriedades na visualização

### 2. Criar Integração API

1. Acesse: https://www.notion.so/my-integrations
2. Clique **"New integration"**
3. Dê nome: "Markdown Exporter"
4. Permissões: **Read content**
5. Copie o token (formato: `secret_...`)
6. **Compartilhe** páginas desejadas com a integração

---

## Formato dos Timestamps

Notion usa **ISO 8601 com milissegundos**:

```
2025-01-07T14:30:00.000Z
```

- Data: YYYY-MM-DD
- Hora: HH:mm:ss
- Milissegundos: .000
- Timezone: Z (UTC)

---

## Export com Metadados

### Ferramenta: notion-exporter

**Instalação:**
```bash
pip install notion-exporter
```

**Script de Export (export_notion.py):**
```python
from notion_exporter import NotionExporter

exporter = NotionExporter(
    notion_token="secret_SEU_TOKEN_AQUI",
    extract_page_metadata=True  # Ativa export de metadados
)

# Exportar workspace completo
exporter.export_workspace(output_path="./notion-export")

# OU exportar páginas específicas
# exporter.export_pages(
#     page_ids=["id-pagina-1", "id-pagina-2"],
#     output_path="./notion-export"
# )
```

**Executar:**
```bash
python export_notion.py
```

---

## Exemplo de Output

**Frontmatter gerado:**
```yaml
---
title: Reunião Cliente XYZ
created_time: 2025-01-07T09:00:00.000Z
last_edited_time: 2025-01-07T16:45:23.521Z
tags: [trabalho, reuniao, cliente]
url: https://www.notion.so/workspace/...
path: /Projetos/Cliente XYZ
---
```

---

## Metadados Exportados

| Campo | Descrição | Exemplo |
|-------|-----------|---------|
| `title` | Título da página | "Reunião Cliente XYZ" |
| `created_time` | Data/hora criação | 2025-01-07T09:00:00.000Z |
| `last_edited_time` | Data/hora última edição | 2025-01-07T16:45:23.521Z |
| `tags` | Tags (Multi-select) | [trabalho, reuniao] |
| `url` | Link da página no Notion | https://notion.so/... |
| `path` | Caminho no workspace | /Projetos/Cliente |

---

## Workflow de Uso

1. **Trabalhar no Notion** (dia a dia, qualquer computador)
2. **Criar notas** normalmente
3. **Tags** adicionadas via propriedade Multi-select
4. **Timestamps** gerados automaticamente
5. **Exportar** quando precisar dos arquivos markdown (rodar script)

---

## Alternativa: notion2md

**Instalação:**
```bash
pip install notion2md
```

**Uso:**
```python
from notion2md.exporter import MarkdownExporter

exporter = MarkdownExporter(token="secret_SEU_TOKEN")
exporter.export(
    id="id-da-pagina",
    output_path="./export"
)
```

**Diferença:** Requer propriedades customizadas "Created" e "Tags" (não usa as automáticas do Notion).

---

## Vantagens

✅ Interface web completa (nenhuma instalação necessária)
✅ Sincronização automática multi-dispositivo
✅ Timestamps precisos (milissegundos)
✅ Export automatizável via script
✅ Gratuito para uso pessoal
✅ Propriedades automáticas (nunca esquece timestamps)

---

## Limitações

⚠️ Export com metadados completos requer script Python
⚠️ Export nativo (UI) não inclui todos os metadados no frontmatter
⚠️ Precisa configurar integração API (uma vez)

---

## Links Úteis

- **Notion:** https://www.notion.so
- **My Integrations:** https://www.notion.so/my-integrations
- **notion-exporter:** https://github.com/bogdankostic/notion-exporter
- **notion2md:** https://github.com/echo724/notion2md
- **API Docs:** https://developers.notion.com

---

## Notas

- Timestamps em UTC (converter para timezone local se necessário)
- Export via API respeita permissões (apenas páginas compartilhadas com integração)
- Script pode ser automatizado (GitHub Actions, cron, etc.)
- Notion Free permite até 10 integrações

---

**Última verificação:** 07/01/2025
