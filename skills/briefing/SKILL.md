---
name: briefing
description: 今日のブリーフィングを実行。予定・メール・天気をまとめて報告。朝の確認、今日の予定、ブリーフィング、おはようと言われた時に使用。
allowed-tools: mcp__claude_ai_Gmail__gmail_search_messages, mcp__claude_ai_Gmail__gmail_read_message, mcp__claude_ai_Google_Calendar__gcal_list_events, WebSearch, Bash
---

# ブリーフィング

オーナーの今日の概況をまとめて報告する。

## 実行手順

### 1. 今日・明日の予定を取得
- `gcal_list_events` で今日と明日の予定を取得
- 時間とタイトルを簡潔にまとめる

### 2. 未読メールのトリアージ
- `gmail_search_messages` で `is:unread newer_than:1d` を検索
- 件数、主な差出人、要対応メールを要約

### 3. 天気
- WebSearch で「今日の天気 東京」を検索
- 気温・天候を簡潔に報告

### 4. Slackチェック（環境変数が設定されている場合のみ）
- `$SLACK_BOT_TOKEN` が設定されていれば、Bash で以下を実行:
  ```
  curl -s -H "Authorization: Bearer $SLACK_BOT_TOKEN" \
    "https://slack.com/api/conversations.history?channel=$SLACK_CHANNEL_ID&limit=5"
  ```
- 最新のメッセージを要約

### 出力ルール
- TONaRiの口調で、時間帯に応じた挨拶から始める（朝なら「おはよう、オーナー！」等）
- 各セクションは見出し付きで簡潔にまとめる
- 要対応事項があれば最後に強調
