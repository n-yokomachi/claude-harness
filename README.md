# claude-harness

Claude Code のカスタムスキル・設定ファイル一式を管理し、`/harness-init` コマンドで `~/.claude/` へデプロイするハーネスプロジェクトです。

キャラクター設定は [TONaRi](https://github.com/n-yokomachi/tonari) を参考にしています。

## セットアップ

```bash
# このリポジトリを clone
git clone <repo-url>
cd claude-harness

# Claude Code 上でインストーラを実行
/harness-init
```

`/harness-init` を実行すると、`dotfiles/` と `skills/` の内容が `~/.claude/` 以下にコピーされます。

## プロジェクト構造

```
claude-harness/
├── dotfiles/           # ~/.claude/ に配置するファイル群
│   ├── CLAUDE.md       #   グローバル指示ファイル
│   └── settings.json   #   Claude Code 設定
├── skills/             # ~/.claude/skills/ に配置するスキル群
│   ├── briefing/       #   朝のブリーフィング（予定・メール・天気）
│   ├── calendar/       #   カレンダー確認
│   └── email-check/    #   メールチェック
├── .claude/skills/
│   └── harness-init/   # インストーラスキル（プロジェクトレベル）
├── CLAUDE.md           # プロジェクト固有の指示
└── TODO.md             # タスク管理
```

## スキル一覧

| スキル | 説明 |
|--------|------|
| `/briefing` | 今日の予定・メール・天気をまとめて報告 |
| `/calendar` | Google Calendar の予定を確認 |
| `/email-check` | Gmail の受信トレイを確認 |

## 外部連携

| サービス | 方式 |
|----------|------|
| Gmail | クラウド MCP（Anthropic 提供） |
| Google Calendar | クラウド MCP（Anthropic 提供） |
| Slack | クラウド MCP（Anthropic Slack Connector） |

## 開発フロー

1. `skills/` や `dotfiles/` のファイルを編集
2. `/harness-init` で `~/.claude/` に反映
3. 別プロジェクトで動作確認

## シークレット管理

`settings.json` にシークレットは含めません。API キー等はシェルプロファイル（`~/.zshrc` など）で `export` してください。
