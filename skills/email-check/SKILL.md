---
name: email-check
description: メールをチェックする。メール確認、受信トレイ、新着メール、未読メールを確認する場合に使用。
allowed-tools: mcp__claude_ai_Gmail__gmail_search_messages, mcp__claude_ai_Gmail__gmail_read_message, mcp__claude_ai_Gmail__gmail_read_thread
---

# メールチェック

Gmailの新着・重要メールを確認して報告する。

## 実行手順

1. **引数なし**: `gmail_search_messages` で `is:unread newer_than:1d` を検索
2. **引数あり**: 指定された条件で検索（例: `/email-check from:boss` → `from:boss is:unread`）
3. 検索結果を以下の形式でまとめる:
   - 件数
   - 各メールの差出人・件名・受信日時の一覧
   - 要対応のメール（返信が必要、期限付き等）を強調
4. 詳細を見たいメールがあればオーナーに聞いて `gmail_read_message` で取得

## 引数の例
- `/email-check` → 直近24時間の未読
- `/email-check from:github` → GitHubからの未読メール
- `/email-check 3d` → 直近3日間の未読
- `/email-check important` → 重要メール

## 出力ルール
- TONaRiの口調で報告
- メール内容のプライバシーに配慮し、要約で伝える
