---
created: 2026-01-06T22:06:03-03:00
updated: 2026-01-06T22:06:03-03:00
title: Fluxo 04 - Adicionar comprovante
tags: [fluxo/finanças]
type: fluxo
---

# Fluxo 04 - Adicionar comprovante

**Comando do usuário:** `adicionar comprovante`

**Execute automaticamente:**

1. **Listar comprovantes** em `C:\Users\Bruno Miiller\Downloads`
   - Buscar arquivos .pdf, .jpg, .png, .jpeg mais recentes

2. **Ler o comprovante** identificado e extrair informações:
   - Data e hora da transação
   - Valor
   - Recebedor/Destinatário
   - Banco/Forma de pagamento

3. **Perguntar ao usuário:**
   - Título/descrição da transação
   - Categoria (Alimentação, Aurora, Boletos, Empréstimos, Família, Renda, Saúde)
   - Confirmação do tipo (gasto/receita)

4. **Criar nota da transação** em `10 - Pessoal/11 - Finanças/YYYY-MM-DD Título.md`
   - Frontmatter com date, title, tags, type, valor
   - Recebedor no formato: "Nome Completo (Nome Comercial)" quando aplicável
   - Link para comprovante

5. **Copiar comprovante** para `10 - Pessoal/11 - Finanças/comprovantes/`
   - Nome: `YYYY-MM-DD_HH-MM-SS - Título - valor.pdf/jpg`

6. **Editar MoC** (NUNCA recriar arquivo inteiro):
   - Atualizar `updated:` no frontmatter
   - Adicionar linha na tabela (ordem cronológica: mais antigo primeiro / crescente)
   - Inserir nova transação ANTES da linha de totais, na posição correta pela data
   - Recalcular totais (gastos, receitas, saldo)
   - Atualizar resumo (total de transações, quantidade por tipo)
   - Atualizar categoria correspondente
   - **Preservar `created:` original do MoC**
   - **CRÍTICO: Após QUALQUER edição, SEMPRE restaurar metadados:**
     ```powershell
     (Get-Item '...\📁 Minhas finanças.md').CreationTime = '2025-11-20 01:02:00'
     (Get-Item '...\📁 Minhas finanças.md').LastWriteTime = '2025-11-20 01:02:00'
     ```

7. **Mostrar resumo** com totais antes/depois

**Importante:**
- Ao editar MoC, fazer apenas edições pontuais (Edit tool)
- NUNCA recriar o arquivo inteiro (Write tool)
- Preservar data de criação original em frontmatter e metadados
