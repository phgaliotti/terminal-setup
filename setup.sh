#!/bin/bash
set -e

echo "==> Verificando pré-requisitos..."

# Instalar Homebrew se não tiver (macOS)
if ! command -v brew &>/dev/null; then
  echo "==> Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Instalar zsh se não tiver
if ! command -v zsh &>/dev/null; then
  echo "==> Instalando zsh..."
  brew install zsh
fi

# Instalar git se não tiver
if ! command -v git &>/dev/null; then
  echo "==> Instalando git..."
  brew install git
fi

# Instalar oh-my-zsh se não tiver
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Instalando oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "==> Copiando configurações..."
cp ./zshrc ~/.zshrc
cp ./p10k.zsh ~/.p10k.zsh

# Instalar Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "==> Instalando Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# Instalar zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "==> Instalando zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
fi

# Instalar zsh-completions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
  echo "==> Instalando zsh-completions..."
  git clone https://github.com/zsh-users/zsh-completions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions"
fi

# Definir zsh como shell padrão se ainda não for
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "==> Definindo zsh como shell padrão..."
  chsh -s "$(which zsh)"
fi

echo ""
echo "Tudo Ok! Agora é só abrir o terminal."
