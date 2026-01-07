# Guia de Metadados do Sistema

## Frontmatter Padrão

Todos os arquivos do sistema devem conter frontmatter YAML com os seguintes campos:

```yaml
---
created_at: YYYY-MM-DDTHH:MM:SS-03:00
updated_at: YYYY-MM-DDTHH:MM:SS-03:00
type: [valor]
status: [valor]
tags: [lista]
---
```

---

## Campos

### `created_at`
Data e hora de criação do arquivo no formato ISO 8601 completo com timezone -03:00

**Formato**: `YYYY-MM-DDTHH:MM:SS-03:00`

**Exemplo**: `2025-12-01T17:27:58-03:00`

### `updated_at`
Data e hora da última modificação do arquivo no formato ISO 8601 completo com timezone -03:00

**Formato**: `YYYY-MM-DDTHH:MM:SS-03:00`

**Exemplo**: `2025-12-01T17:27:58-03:00`

---

## `type` - Tipo do Arquivo

Define a natureza e propósito do arquivo no sistema.

### Valores Possíveis:

- **`docs`** - Documentação do sistema
  - Guias, manuais, instruções
  - Exemplo: este arquivo

- **`nota`** - Anotações gerais
  - Notas de reunião, ideias, rascunhos
  - Conteúdo informativo sem estrutura rígida

- **`recurso`** - Recursos e referências
  - Templates, snippets, exemplos
  - Material de apoio e consulta

- **`objetivo`** - Planejamento e metas
  - Objetivos, metas, KPIs
  - Tracking de progresso

- **`pessoal`** - Informações pessoais
  - Dados sobre você, preferências, contexto
  - Memórias e histórico pessoal

---

## `status` - Status do Arquivo

Indica o estado atual do arquivo no sistema.

### Valores Possíveis:

- **`active`** / **`ativo`**
  - Arquivo em uso ativo no sistema
  - Consultado e atualizado regularmente
  - Exemplo: MEMORIA_CENTRAL.md

- **`in-progress`** / **`em-desenvolvimento`**
  - Arquivo sendo construído ou refinado
  - Conteúdo incompleto ou em evolução
  - Ainda não está na versão final

- **`stable`** / **`estável`**
  - Arquivo completo e estabelecido
  - Mudanças pouco frequentes
  - Estrutura consolidada

- **`draft`** / **`rascunho`**
  - Versão preliminar
  - Ideias iniciais, não revisado
  - Pode sofrer grandes mudanças

- **`archived`** / **`arquivado`**
  - Arquivo não mais em uso ativo
  - Mantido para histórico
  - Baixa prioridade de consulta

- **`deprecated`** / **`descontinuado`**
  - Substituído por outro arquivo/sistema
  - Mantido temporariamente para referência
  - Será removido futuramente

---

## `tags` - Etiquetas

Lista de palavras-chave para categorização e busca.

### Formato:
```yaml
tags: [tag1, tag2, tag3]
```

### Tags Sugeridas:

#### Sistema e Estrutura
- `sistema`
- `memoria`
- `documentacao`
- `guia`
- `template`

#### Produtividade
- `produtividade`
- `tarefas`
- `habitos`
- `metas`
- `planejamento`

#### Áreas da Vida
- `saude`
- `carreira`
- `financas`
- `relacionamentos`
- `desenvolvimento-pessoal`
- `lazer`

#### Temporal
- `diario`
- `semanal`
- `mensal`
- `anual`
- `ferias`
- `2025`
- `2026`

#### Contexto
- `ia`
- `obsidian`
- `automacao`
- `review`
- `retrospectiva`

---

## Exemplos

### Exemplo 1: Arquivo de Memória Central
```yaml
---
created_at: 2025-12-01T15:57:00-03:00
updated_at: 2025-12-01T17:27:58-03:00
type: pessoal
status: active
tags: [memoria, sistema, produtividade, ia]
---
```

### Exemplo 2: Documentação
```yaml
---
created_at: 2025-12-01T17:27:58-03:00
updated_at: 2025-12-01T17:27:58-03:00
type: docs
status: stable
tags: [documentacao, guia, sistema, metadados]
---
```

### Exemplo 3: Nota de Planejamento
```yaml
---
created_at: 2025-12-01T17:27:58-03:00
updated_at: 2025-12-01T17:27:58-03:00
type: objetivo
status: in-progress
tags: [planejamento, 2026, metas, review]
---
```

### Exemplo 4: Template
```yaml
---
created_at: 2025-12-01T17:27:58-03:00
updated_at: 2025-12-01T17:27:58-03:00
type: recurso
status: stable
tags: [template, diario, produtividade]
---
```

---

**Nota**: Este guia deve ser consultado ao criar novos arquivos para manter consistência no sistema.
