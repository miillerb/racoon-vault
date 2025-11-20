
# Raccoon

**Meu cérebro extendido - um assistente equilibrador que me dá gatilhos e pistas de memória, sem criar dependência.**

## Por que o Raccoon existe

Meu cérebro biológico é criativo, curioso, mas também desatento, atrapalhado e esquecido. Tenho dois extremos:
1. **Devaneia e se perde** - criatividade sem direção, pulo de ideia em ideia
2. **Foca obsessivamente** - travo no detalhe errado (configurar demais em vez de usar)

**O Raccoon me equilibra:**
- **Estrutura** → me segura quando desvaneio
- **Flexibilidade** → me solta quando travo no detalhe

## Estrutura atual

```
Raccoon/
├── 00 - Meta/              # Sobre mim e sobre este sistema
├── 10 - Pessoal/           # Vida pessoal (vazio por enquanto)
├── 20 - Trabalho/          # Trabalho (vazio por enquanto)
├── 30 - Estudos/           # Aprendizado (vazio por enquanto)
├── 40 - Projetos/          # Projetos específicos (vazio por enquanto)
├── 50 - Recursos/          # Templates e referências (vazio por enquanto)
├── 90 - Arquivo/           # Material antigo (vazio por enquanto)
└── .claude/                # Contexto e sessões de trabalho com IA
```

### 00 - Meta
Contém tudo sobre quem sou e como o Raccoon funciona:
- **Quem sou eu.md** - Dados pessoais, família, saúde, trabalho
- **Como o Raccoon funciona.md** - Manifesto completo do sistema
- **Minha história com anotações.md** - Jornada desde Evernote até aqui
- **Contexto para IA - Raccoon.md** - Para copiar no Claude.ai quando precisar
- **Bem-vindo de volta.md** - Mensagem contextualizada ao iniciar sessão
- **Regras de Commit - Raccoon.md** - Convenções de commits do repositório

## Valores fundamentais

1. **Curiosidade** - posso explorar qualquer assunto sem medo de quebrar o sistema
2. **Flexibilidade** - me protege de focar obsessivamente onde não devo
3. **Organização** - me mostra o que merece atenção
4. **Visual contrastado** - acessibilidade (tenho 15% de visão)

## Bloco básico: Nota Mínima

**Nota Mínima** = autocontida, tudo necessário está dentro dela

1. Não é "átomo" (isolado e inútil sozinho)
2. É como uma "célula" (pequena, mas viva e funcional)
3. Tem tudo que preciso pra entender e usar
4. Máximo 1-2 links quando realmente necessário

### Padrão de frontmatter

```yaml
---
created: YYYY-MM-DDTHH:mm:ss-03:00
updated: YYYY-MM-DDTHH:mm:ss-03:00
title: Título da nota
tags: [tag1, tag2]
type: nota-mínima
---
```

1. Classes em inglês, conteúdo em português
2. Title sincronizado com H1
3. Data formato ISO 8601 completo com timezone
4. Usar numeração (não bullets) no conteúdo

## O que NÃO fazer

1. **Muitos links** - me fazem pular de nota em nota e perder o contexto
2. **Estrutura complexa** - me fazem travar configurando em vez de usar
3. **Genérico sem personalidade** - precisa ter minha cara (Bruno)

## Como usar

**Quando tô disperso (devaneando):**
→ Estrutura me segura - criar/consultar Nota Mínima focada

**Quando tô travado (configurando demais):**
→ Flexibilidade me solta - PARAR, usar o que já tenho

**Quando não sei se algo merece atenção:**
→ Organização me guia - verificar se conecta com meus valores

## Ferramentas

1. **Obsidian** - interface principal
2. **Git** - versionamento (repositório local)
3. **Claude Code** - assistente IA (via `.claude/`)
4. **Google Drive** - backup automático (`Backup para Google Drive.ps1`)

## Escopos da IA

**IA pode:**
1. Estruturar o que eu já pensei
2. Sugerir formato e organização
3. Executar criação de notas aprovadas
4. Me lembrar dos valores quando eu desviar

**IA NÃO pode:**
1. Decidir o que é importante pra mim
2. Criar conteúdo sem eu validar
3. Substituir meu cérebro
4. Saber mais sobre mim do que eu mesmo

**Só EU posso:**
1. Definir valores e prioridades
2. Criar o conteúdo real das notas
3. Decidir quando parar de configurar e usar
4. Saber se algo merece atenção

## Arquivos importantes

1. [Como o Raccoon funciona](00%20-%20Meta/Como%20o%20Raccoon%20funciona.md) - leia primeiro
2. [Quem sou eu](00%20-%20Meta/Quem%20sou%20eu.md) - meus dados pessoais
3. [Contexto para IA](00%20-%20Meta/Contexto%20para%20IA%20-%20Raccoon.md) - copiar no Claude.ai
4. [Minha história](00%20-%20Meta/Minha%20hist%C3%B3ria%20com%20anota%C3%A7%C3%B5es.md) - minha jornada

---

**Sistema criado e mantido por Bruno Miiller**
**Tucuruí - PA, Brasil**
