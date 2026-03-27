# Setup rápido

Backup e setup rápido das minhas configurações de terminal (Zsh, Powerlevel10k, Oh My Zsh, etc).

## Compatibilidade

| Sistema | Suporte |
|---------|---------|
| macOS | Completo |
| Linux | Parcial — o script instala pré-requisitos via Homebrew, que não é nativo no Linux. Instale `zsh` e `git` manualmente pelo gerenciador de pacotes da sua distro (`apt`, `dnf`, etc.) antes de rodar o script. |
| Windows | Não suportado — funciona apenas via WSL2 (tratado como Linux). |

## O que será instalado automaticamente

- **Homebrew** — gerenciador de pacotes (macOS)
- **zsh** — shell principal
- **git** — necessário para clonar plugins e tema
- **Oh My Zsh** — framework de configuração do zsh
- **Powerlevel10k** — tema do terminal
- **zsh-autosuggestions** — sugestões de comandos baseadas no histórico
- **zsh-completions** — completions extras para zsh
- **zshrc e p10k.zsh** — arquivos de configuração com aliases e tema

## Instalação

```bash
git clone git@github.com:phgaliotti/terminal-setup.git
cd terminal-setup
chmod +x setup.sh
./setup.sh
```

Após concluir, feche e abra o terminal.

> O script é seguro para rodar mais de uma vez — ele verifica o que já está instalado antes de instalar novamente.
