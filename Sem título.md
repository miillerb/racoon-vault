`
```bash
git commit -m "$(cat <<'EOF'
Implementar sistema de migração de notas do UpNote

- Criar estrutura 'Migration/UpNote/' com categorização
- Migrar notas do UpNote para 'Migration/UpNote/'
- Processar anexos (PDFs e imagens) e mover para
  '00 - Meta/02 Arquivos/'
- Adicionar documentação do progresso (5/1243 notas,
  4 categorias)
- Atualizar configurações CLAUDE.md com o workflow completo de
  migração UpNote
- Definir padrão: type 'migração-upnote', categoria
  obrigatória, preservação de CreationTime, duplo formato de
  tags
- Atualizar configurações do Obsidian
EOF
)"
```

