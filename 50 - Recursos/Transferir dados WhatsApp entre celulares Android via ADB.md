---
created: 2025-11-24T20:29:29-03:00
updated: 2025-11-24T20:29:29-03:00
title: Transferir dados WhatsApp entre celulares Android via ADB
tags: [recurso, android, whatsapp, adb, tutorial]
type: recurso
---

# Transferir dados WhatsApp entre celulares Android via ADB

Guia completo para transferir mídia do WhatsApp entre celulares Android preservando metadados (datas de criação e modificação) usando ADB (Android Debug Bridge).

---

## O que é ADB?

- Ferramenta oficial do Google para comunicar com Android via linha de comando
- Transfere arquivos preservando metadados completos
- Transferência: celular → PC (temporário) → celular
- Arquivos passam pelo PC mas são deletados depois

---

## Requisitos

- PC com Windows
- Espaço livre temporário (equivalente ao tamanho da pasta WhatsApp/Media)
- Cabo USB para conectar os celulares
- 15-30 minutos (dependendo do tamanho)

---

## Passo 1: Instalar ADB no PC

1. Baixar **Platform Tools** do site oficial:
   https://developer.android.com/tools/releases/platform-tools

2. Extrair pasta para `C:\adb\` (arquivo tem ~10 MB)

3. Abrir PowerShell nessa pasta:
   - Ir para `C:\adb\`
   - **Shift + botão direito** na pasta
   - Clicar em **"Abrir janela do PowerShell aqui"**

---

## Passo 2: Habilitar Depuração USB (em ambos os celulares)

**No celular antigo E no celular novo:**

1. Ir em **Configurações** → **Sobre o telefone**
2. Tocar **7 vezes** em **"Número da compilação"**
   - Aparecerá mensagem: "Você agora é um desenvolvedor"
3. Voltar para Configurações
4. Ir em **Opções do desenvolvedor** (nova opção que apareceu)
5. Ativar **"Depuração USB"**

---

## Passo 3: Copiar do celular antigo para PC

1. **Conectar celular antigo** via USB no PC

2. **No PowerShell** (`C:\adb\`), executar:
   ```powershell
   .\adb devices
   ```
   - Deve aparecer o dispositivo listado
   - Se aparecer popup no celular pedindo autorização, **aceitar**
   - Se não aparecer nada, reconectar cabo ou reiniciar celular

3. **Confirmar caminho** (opcional):
   ```powershell
   .\adb shell ls /sdcard/Android/media/com.whatsapp/WhatsApp/
   ```
   - Deve listar a pasta "Media"

4. **Copiar pasta Media inteira** preservando metadados:
   ```powershell
   .\adb pull /sdcard/Android/media/com.whatsapp/WhatsApp/Media C:\temp\whatsapp_media
   ```
   - Aguardar conclusão (pode levar vários minutos)
   - Barra de progresso mostrará o andamento

5. **Desconectar celular antigo** com segurança

---

## Passo 4: Copiar do PC para celular novo

1. **Conectar celular novo** via USB no PC

2. **No PowerShell**, executar:
   ```powershell
   .\adb devices
   ```
   - Autorizar no celular novo quando aparecer popup

3. **Copiar do PC para celular novo**:
   ```powershell
   .\adb push C:\temp\whatsapp_media /sdcard/Android/media/com.whatsapp/WhatsApp/Media
   ```
   - Aguardar conclusão
   - Barra de progresso mostrará o andamento

4. **Desconectar celular novo** com segurança

---

## Passo 5: Limpar arquivos temporários no PC

No PowerShell:
```powershell
Remove-Item C:\temp\whatsapp_media -Recurse
```

---

## Vantagens do ADB

- ✅ Preserva 100% dos metadados (datas originais)
- ✅ Transferência confiável e verificável
- ✅ Controle total do processo
- ✅ Não precisa espaço permanente no PC
- ✅ Continua de onde parou se houver erro

---

## Desvantagens do ADB

- ⚠️ Precisa instalar ADB
- ⚠️ Linha de comando (não tem interface gráfica)
- ⚠️ Precisa habilitar modo desenvolvedor
- ⚠️ Precisa espaço temporário no PC

---

## Solução de Problemas

### "adb não é reconhecido como comando"
- Certifique-se de estar no diretório `C:\adb\` no PowerShell
- Use `.\adb` ao invés de apenas `adb`

### "device unauthorized"
- Aceitar popup de autorização no celular
- Se não aparecer: desconectar, desativar/ativar Depuração USB, reconectar

### "no devices/emulators found"
- Verificar se cabo USB está funcionando
- Tentar outra porta USB do PC
- No celular: trocar modo USB para "Transferência de arquivos"

### Transferência muito lenta
- Normal para pastas grandes (10+ GB)
- USB 3.0 (porta azul) é mais rápido que USB 2.0
- Fechar outros programas que usam USB

---

## Alternativas

Se ADB não funcionar, outras opções:

1. **Via PC (copiar/colar normal):** Simples mas pode não preservar todos metadados
2. **MicroSD como intermediário:** Preserva metadados, mais lento
3. **Syncthing:** App que sincroniza via Wi-Fi preservando metadados
4. **Files by Google:** Rápido via Wi-Fi Direct, mas pode alterar metadados

---

**Criado em:** 24/11/2025
**Testado em:** Samsung Galaxy A54 → Samsung Galaxy A56
