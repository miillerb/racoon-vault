---
created: 2025-11-21T14:00:09-03:00
updated: 2025-11-21T19:30:00-03:00
title: Workflow UpNote → Obsidian
tags: [raccoon, workflow, meta]
type: captura-rapida
---

# Workflow UpNote → Obsidian

---

**Propósito:** Migrar capturas do UpNote (mobile) para o Obsidian (SSOT definitivo)

## 1\. Capturar no UpNote (na rua)

1. Abrir UpNote no celular
2. Criar nota nova (botão verde +)
3. Seguir padrão de formatação:

```
# Título
#tag
---

Conteúdo da captura
```

4. Nota cai automaticamente em "Uncategorized" (inbox nativo)
5. Continuar o dia normalmente

## 2\. Exportar do UpNote (quando chegar em casa)

**Opção A - Export manual:**

1. Abrir UpNote no celular
2. Ir em "Uncategorized"
3. Selecionar nota(s) para processar
4. Tocar nos três pontos `...`
5. Escolher "Export" → "Markdown"
6. Salvar em pasta acessível do notebook (iCloud Drive/Google Drive/AirDrop)

**Opção B - Backup automático (recomendado):**

1. Settings → Automatic notes backup
2. Ativar "Export backup to markdown"
3. Definir pasta de backup em serviço acessível do notebook
4. Backup roda automaticamente

## 3\. Preparar no Obsidian

1. Copiar arquivos .md exportados para `00 - Meta/01 Inbox/`

## 4\. Processar com Claude Code

1. Abrir Claude Code no terminal do vault:

```bash
claude
```

2. Instrução para o Claude:

```
Processar arquivos em 00 - Meta/01 Inbox/:

1. Converter formato UpNote para Obsidian:
   - Remover <br> tags
   - Trocar * * * por ---
   - Criar frontmatter YAML:
     * created: [data do campo created do UpNote em ISO 8601 -03:00]
     * updated: [data do campo date do UpNote em ISO 8601 -03:00]
     * title: [extrair do H1]
     * tags: [converter #hashtags inline para array]
     * type: captura-rapida

2. Salvar arquivos convertidos mantendo nome original

3. Listar arquivos processados para revisão
```

## 5\. Revisar e classificar (manual)

1. Abrir cada arquivo em `01 Inbox`
2. Decidir destino:

- 10 - Pessoal
- 20 - Trabalho
- 30 - Estudos
- 40 - Projetos
- 50 - Recursos
- 90 - Arquivo
- Ou deletar se não servir

3. Mover arquivo para pasta apropriada

## 6\. Transformar em Nota Mínima (quando necessário)

1. Abrir captura-rapida que merece virar Nota Mínima
2. Usar Claude Code para processar:

- Tornar autocontida
- Garantir que funciona sozinha
- Máximo 1-2 links se realmente necessário

3. Alterar `type: captura-rapida` para `type: nota-mínima`
4. Atualizar campo `updated` com timestamp atual

## 7\. Limpar

1. Deletar arquivos de `01 Inbox` após processar
2. Deletar pasta UpNote exportada (ex: `UpNote_2025-11-21_18-07-05/`)
3. Deletar notas do UpNote que já foram processadas
4. Manter UpNote limpo (apenas "Uncategorized" ativo e notas do Meta para consulta)

## Frequência recomendada

1. Semanal mínimo (não deixar acumular muito)
2. Diária se estiver capturando muito
3. Quando "Uncategorized" no UpNote chegar a 10+ notas

## Checklist rápido

- [ ] Exportei do UpNote?
- [ ] Copiei para `01 Inbox`?
- [ ] Rodei conversão com Claude Code?
- [ ] Revisei e classifiquei cada arquivo?
- [ ] Movi para pastas apropriadas?
- [ ] Limpei `01 Inbox`?
- [ ] Deletei do UpNote?

---

**Última atualização:** 2025-11-21
