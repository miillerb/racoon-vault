# Sistema de Memória Claude - Guia de Uso

## Visão Geral

Este diretório contém o sistema de memória persistente para conversas com Claude Code, permitindo continuidade de contexto entre sessões independentes.

**Problema resolvido:** Claude Code não mantém memória entre sessões - cada conversa começa do zero.

**Solução:** Sistema de arquivos estruturado que você lê/atualiza com auxílio do Claude.

## Estrutura

```
.claude/
├── README.md              # Este arquivo - guia de uso
├── memory.md              # Resumo executivo (SEMPRE ler primeiro)
├── contexto-projeto.md    # Contexto detalhado do projeto
├── template-sessao.md     # Template para novas sessões
└── sessoes/               # Histórico de sessões
    └── YYYY-MM-DD.md      # Uma nota por sessão importante
```

## Como Usar

### 📖 No Início de Cada Sessão

**Comando essencial:**
```
Leia .claude/memory.md
```

Este arquivo contém o resumo executivo que permite ao Claude se situar rapidamente:
- Última sessão
- Preferências suas
- Estado atual do projeto
- Links para informações detalhadas

**Quando ler contexto adicional:**
```
Leia .claude/contexto-projeto.md
```

Use quando:
- Primeiro trabalho em área nova do projeto
- Precisar entender padrões e convenções estabelecidas
- Claude precisar de contexto mais profundo

**Consultar sessão específica:**
```
Leia .claude/sessoes/2025-11-15.md
```

Use quando:
- Retomar trabalho de sessão anterior
- Revisar decisões tomadas
- Verificar o que foi feito anteriormente

### 💬 Durante a Sessão

Claude pode:
- Consultar esses arquivos quando necessário
- Pedir para ler contexto adicional se precisar
- Sugerir anotações de decisões importantes

Você pode:
- Pedir ao Claude para consultar arquivos específicos
- Solicitar atualizações em memory.md se algo importante mudar
- Pedir para Claude verificar decisões anteriores

### ✅ No Final da Sessão

**Se a sessão foi significativa:**
```
Crie nota de sessão para hoje
```

Claude irá:
1. Criar `.claude/sessoes/YYYY-MM-DD.md` usando o template
2. Documentar discussões, decisões, código modificado
3. Atualizar `.claude/memory.md` com resumo da sessão

**Quando criar nota de sessão:**
- ✅ Decisões arquiteturais tomadas
- ✅ Código significativo criado/modificado
- ✅ Problemas complexos resolvidos
- ✅ Aprendizados importantes
- ❌ Conversas triviais ou puramente informativas
- ❌ Mudanças muito pequenas

## Arquivos Principais

### memory.md
**Propósito:** Resumo rápido para início de sessão

**Quando atualizar:**
- Ao final de cada sessão significativa
- Quando preferências mudarem
- Quando estrutura do projeto mudar

**Conteúdo:**
- Última sessão e seu resumo
- Preferências do usuário
- Links para arquivos importantes
- Notas rápidas sobre estado atual

**Tamanho ideal:** < 100 linhas (leitura em ~1 minuto)

---

### contexto-projeto.md
**Propósito:** Contexto completo e detalhado do projeto

**Quando atualizar:**
- Mudanças estruturais no projeto
- Novos padrões estabelecidos
- Integrações/ferramentas adicionadas
- Objetivos do projeto evoluírem

**Conteúdo:**
- Propósito do vault Raccoon
- Estrutura e organização
- Padrões e convenções
- Histórico importante
- Ferramentas utilizadas

**Tamanho:** Sem limite (referência completa)

---

### template-sessao.md
**Propósito:** Estrutura padrão para documentar sessões

**Quando usar:**
- Claude usa automaticamente ao criar notas de sessão
- Você pode copiar manualmente se preferir

**Modificar:**
- Apenas se estrutura não estiver atendendo necessidades
- Mudanças afetam todas as sessões futuras

**Não modificar diretamente** - é um template, não documentação de sessão real

---

### sessoes/YYYY-MM-DD.md
**Propósito:** Registro histórico detalhado de cada sessão

**Quando criar:**
- Ao final de sessões importantes (via comando ao Claude)
- Manualmente se preferir documentar diferente

**Conteúdo típico:**
- Objetivos da sessão
- Discussões e explorações
- Decisões tomadas e suas razões
- Código/arquivos modificados
- Problemas e soluções
- Próximos passos

**Organização:**
- Um arquivo por data
- Se múltiplas sessões no mesmo dia: considerar `2025-11-15-manha.md`

## Boas Práticas

### ✅ Para Você (Usuário)

**SEMPRE:**
- Pedir para Claude ler `memory.md` no início de cada sessão
- Criar nota de sessão após trabalho significativo
- Manter `contexto-projeto.md` atualizado com mudanças estruturais

**CONSIDERE:**
- Revisar `memory.md` ocasionalmente para garantir que está atual
- Consolidar aprendizados de múltiplas sessões em `contexto-projeto.md`
- Arquivar sessões muito antigas se acumular demais

**EVITE:**
- Deixar `memory.md` desatualizado por muitas sessões
- Criar nota de sessão para conversas triviais
- Duplicar informação entre arquivos

---

### ✅ Para Claude

**SEMPRE:**
- Ler `memory.md` quando solicitado no início da sessão
- Usar `template-sessao.md` como base para novas sessões
- Atualizar `memory.md` ao criar nota de sessão
- Ser conciso em `memory.md`, detalhado em notas de sessão

**CONSIDERE:**
- Sugerir leitura de `contexto-projeto.md` se precisar de contexto profundo
- Recomendar criação de nota de sessão após trabalho significativo
- Sugerir atualização de `contexto-projeto.md` se padrões mudarem

**EVITE:**
- Deixar `memory.md` muito longo (> 150 linhas)
- Duplicar informação já em `contexto-projeto.md`
- Criar notas de sessão para conversas triviais

## Workflow Típico

### Primeira Sessão do Dia
```
Você:   "Leia .claude/memory.md"
Claude: [lê e se situa]
Você:   "Vamos implementar feature X"
Claude: [trabalha com contexto]
        ...
Você:   "Crie nota de sessão para hoje"
Claude: [cria sessoes/YYYY-MM-DD.md]
Claude: [atualiza memory.md]
```

### Sessão de Continuação
```
Você:   "Leia .claude/memory.md"
Claude: [vê que última sessão foi sobre feature X]
Você:   "Vamos continuar a feature X"
Claude: [contexto preservado]
        ...
Você:   "Crie nota de sessão para hoje"
```

### Novo Tópico
```
Você:   "Leia .claude/memory.md e contexto-projeto.md"
Claude: [contexto completo]
Você:   "Vamos trabalhar em Y"
Claude: [entende padrões do projeto]
```

## Manutenção

### Mensal
- [ ] Revisar `memory.md` - ainda relevante?
- [ ] Consolidar aprendizados de sessões em `contexto-projeto.md`
- [ ] Considerar arquivar sessões muito antigas (> 3 meses)

### Quando Necessário
- [ ] Atualizar template se estrutura não funcionar bem
- [ ] Reorganizar `sessoes/` se crescer muito (criar subpastas por mês/ano)
- [ ] Limpar `memory.md` se ficar muito longo

### Sinais de que Sistema Precisa Ajuste
- ⚠️ `memory.md` com mais de 200 linhas
- ⚠️ Claude frequentemente pede contexto adicional
- ⚠️ Informação duplicada entre arquivos
- ⚠️ Dificuldade em encontrar informação específica

## Troubleshooting

### Claude não lembra de sessões anteriores?
**Solução:** Sempre peça "Leia .claude/memory.md" no início

**Por que acontece:** Cada sessão Claude é completamente independente - não há memória automática

---

### memory.md está muito longo?
**Solução:** Mova detalhes para `contexto-projeto.md`, mantenha só essencial

**Regra prática:** memory.md deve ser leitura de ~1 minuto

---

### Sessões ficando muito longas para documentar?
**Solução:** Seja mais seletivo - nem toda conversa precisa de nota completa

**Alternativa:** Crie notas mais curtas ou apenas atualize `memory.md`

---

### Esqueceu de criar nota de sessão?
**Solução:** Tudo bem! Próxima sessão, peça: "Crie nota de sessão para 2025-11-14 sobre [tópico]"

**Preventivo:** Crie hábito de pedir ao final de sessões importantes

---

### Informação duplicada entre arquivos?
**Solução:**
- `memory.md` = resumo executivo, referências
- `contexto-projeto.md` = informação duradoura, padrões
- `sessoes/` = histórico detalhado, temporário

---

### Não sabe se deve criar nota de sessão?
**Pergunta:** Essa sessão teve decisões ou código que você consultará no futuro?
- **Sim** → Criar nota
- **Não** → Apenas atualizar `memory.md` se necessário

## Exemplo de Uso Real

```markdown
[Segunda-feira]
Você:   "Leia .claude/memory.md"
Claude: "Entendido. Última sessão foi sexta sobre feature X.
         Projeto Raccoon está em desenvolvimento.
         Como posso ajudar hoje?"
Você:   "Vamos refatorar o módulo Y"
Claude: [trabalha...]
Você:   "Crie nota de sessão para hoje"
Claude: [cria sessoes/2025-11-18.md com detalhes do refactoring]
        [atualiza memory.md: última sessão = refactoring módulo Y]

[Terça-feira]
Você:   "Leia .claude/memory.md"
Claude: "Entendido. Ontem refatoramos módulo Y.
         Há algum follow-up ou nova tarefa?"
Você:   "Sim, vamos adicionar testes para Y"
Claude: [já sabe sobre refactoring de ontem]
        [trabalha em contexto]
```

## Dicas Avançadas

### Para Projetos Grandes
Considere subdividir `contexto-projeto.md`:
- `.claude/contexto-arquitetura.md`
- `.claude/contexto-decisoes.md`
- `.claude/contexto-padroes.md`

### Para Equipes
- Versione `.claude/` no git
- Cada membro pode ter suas próprias notas de sessão
- `contexto-projeto.md` é compartilhado

### Automação (Futuro)
- Scripts para criar notas de sessão
- Hooks do git para atualizar memory.md
- MCP server para acesso automático

---

## Sobre Este Sistema

**Criado em:** 2025-11-15
**Versão:** 1.0
**Propósito:** Compensar ausência de memória nativa do Claude Code

**Filosofia:**
- Simples > Complexo
- Arquivos de texto > Banco de dados
- Manual explícito > Automação mágica
- Flexível > Rígido

Este sistema foi projetado para ser:
- ✅ Fácil de entender
- ✅ Fácil de manter
- ✅ Resistente a falhas
- ✅ Versionável no git
- ✅ Legível por humanos

---

**Feedback e Melhorias:**
Este é um sistema vivo. Ajuste conforme suas necessidades!
