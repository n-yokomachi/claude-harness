---
name: terminal-init
description: ターミナル環境（WezTerm + Zellij）のインストールと設定を行う。ターミナルセットアップ、WezTerm設定、Zellij設定に使用。
allowed-tools: Bash, Read, Write, Edit, Glob
---

# Terminal Init

WezTerm + Zellij のインストールと設定ファイルの配置を行う。

## 実行手順

### Step 1: OS検出とパッケージマネージャ確認

1. OS検出（macOS / Linux / Windows）
2. パッケージマネージャの確認:
   - macOS: `brew`
   - Linux: `apt` / `dnf` / `pacman` など
   - Windows: `winget` または `scoop`

### Step 2: インストール

既にインストール済みかどうかを確認し、未インストールのもののみインストールする。

**macOS:**
```bash
brew install --cask wezterm
brew install zellij
```

**Windows (winget):**
```bash
winget install wez.wezterm
winget install zellij-org.zellij
```

**Linux (apt例):**
```bash
# WezTerm: 公式リポジトリから
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update && sudo apt install wezterm
# Zellij: cargo or バイナリダウンロード
cargo install zellij
```

### Step 3: 設定ファイルの配置

ハーネスリポジトリ内の設定ファイルをシンボリックリンクで配置する。

**Mac/Linux:**
```bash
# WezTerm
ln -sf <repo>/dotfiles/wezterm.lua ~/.wezterm.lua

# Zellij
mkdir -p ~/.config/zellij
ln -sf <repo>/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
```

**Windows (Git Bash):**
```bash
export MSYS=winsymlinks:nativestrict
# WezTerm
ln -s <repo>/dotfiles/wezterm.lua ~/.wezterm.lua
# Zellij
mkdir -p ~/.config/zellij
ln -s <repo>/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
```

※ 設定ファイルが `<repo>/dotfiles/` に存在しない場合はスキップし、手動設定が必要な旨を報告する。

### Step 4: 検証と報告

1. `wezterm --version` と `zellij --version` でインストール確認
2. 設定ファイルのシンボリックリンク状態を `ls -la` で確認
3. Claireの口調で結果を報告
