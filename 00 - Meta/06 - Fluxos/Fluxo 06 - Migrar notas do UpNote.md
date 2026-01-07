---
created: 2026-01-06T22:06:03-03:00
updated: 2026-01-06T22:06:03-03:00
title: Fluxo 06 - Migrar notas do UpNote
tags: [fluxo/migração]
type: fluxo
---

# Fluxo 06 - Migrar notas do UpNote

**Comando do usuário:** `migrar notas do upnote`

**Execute automaticamente:**

1. **Localizar pasta exportada** em raiz do Raccoon (formato: 'UpNote_YYYY-MM-DD_HH-mm-ss/')
2. **Mover notas** da pasta exportada para 'Migration/UpNote/' (raiz temporária)
3. **Processar cada nota:**
   - Ler frontmatter original do UpNote
   - Extrair: title (do H1), created, updated (date), categories, hashtags inline
   - Criar frontmatter Raccoon:
     * created: ISO 8601 com timezone
     * updated: ISO 8601 com timezone (preservar original, NÃO atualizar)
     * title: extraído do H1
     * tags: array convertido de hashtags inline (formato: [tag1, tag2])
     * type: migração-upnote
     * categoria: nome da categoria (Saúde, Estudos, Recursos, Finanças, etc)
     * upnote-url: link x-callback-url do UpNote (se presente no original)
   - **Formato do corpo:**
     * H1 sincronizado com title do frontmatter (SEM linha em branco após frontmatter)
     * Tags inline logo após H1 (formato: `#tag1`; `#tag2`; `#tag3`) SEM linha em branco antes
     * Linha separadora (---)
     * **Resumo:** texto conciso e sintético SEM linha em branco após "Resumo:"
     * Linha separadora (---)
     * Conteúdo original
   - Remover `<br>` e substituir `* * *` por `---`
   - Remover campo `categories:` do novo frontmatter
   - **Processar anexos** (se houver):
     * Para cada arquivo anexo, processar individualmente:
       1. LER o arquivo (PDF/imagem) para verificar se o conteúdo corresponde ao título
       2. Perguntar prefixo (mostrar nome do arquivo, contador "X/Total" e conteúdo real)
          - Incluir opções contextualizadas (4+ opções quando relevante)
       3. Perguntar título com opções:
          - "Padrão": [Prefixo] - [Título da nota] - Arquivo XX.ext
          - "Título original": [Prefixo] - [Título da nota] - [nome original].ext
          - "Com data": [Prefixo] - [Título da nota] - YYYY-MM-DD.ext
          - "Completo": opção detalhada quando aplicável
          - "Outro": campo de texto livre (via opção Other automática)
       4. Mover para '00 - Meta/02 Arquivos/' com nome escolhido
       5. Próximo arquivo (repetir até terminar)
     * Converter links para wikilinks no corpo da nota
     * Imagens (JPG, PNG) e PDFs: todos tratados como anexos
   - **Preservar CreationTime:** Restaurar data de `created:` do frontmatter nos metadados do arquivo
4. **Organizar por categoria:**
   - Ler `categories:` do frontmatter original
   - Se não houver ou for "Sem categoria": perguntar categoria ao usuário
   - Criar subpasta em 'Migration/UpNote/[Categoria]/'
   - Mover nota convertida para categoria
5. **Atualizar progresso** em 'Migration/Migração UpNote.md':
   - Incrementar quantidade processada/restantes
   - Adicionar categoria encontrada (com contagem)
   - Atualizar updated no frontmatter e "Última atualização" no fim
   - Preservar CreationTime do arquivo após edição
6. **Limpar:**
   - Deletar pasta exportada 'UpNote_YYYY-MM-DD_HH-mm-ss/'

**Importante:**
- SEMPRE preservar `updated:` original do UpNote (NÃO usar data atual)
- **CreationTime:** Definir uma ÚNICA vez com data `created:` do frontmatter (data original do UpNote). Se arquivo for editado posteriormente, restaurar CreationTime para essa data original.
- SEMPRE usar Edit tool para arquivos existentes (NUNCA Write, NUNCA Update)
- Tags em duplo formato: frontmatter array + inline com ponto e vírgula
- Resumo sempre presente e conciso
- H1 sempre sincronizado com title do frontmatter
- type SEMPRE `migração-upnote` para todas as notas migradas
- categoria sempre presente no frontmatter
- LER anexos (PDF/imagem) antes de processar para validar conteúdo
- Oferecer 4+ opções contextualizadas ao perguntar prefixo/título
