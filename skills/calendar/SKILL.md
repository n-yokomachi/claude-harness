---
name: calendar
description: カレンダーを確認する。今日の予定、スケジュール、空き時間、予定の確認に使用。
allowed-tools: mcp__claude_ai_Google_Calendar__gcal_list_events, mcp__claude_ai_Google_Calendar__gcal_get_event, mcp__claude_ai_Google_Calendar__gcal_find_my_free_time, mcp__claude_ai_Google_Calendar__gcal_list_calendars
---

# カレンダー確認

Google Calendarの予定を確認して報告する。

## 実行手順

1. **引数なし**: `gcal_list_events` で今日の予定を取得
2. **引数あり**: 指定された条件で検索
   - 日付指定: その日の予定を取得
   - 「空き」「free」: `gcal_find_my_free_time` で空き時間を検索
   - 「今週」「this week」: 今週の予定一覧
   - 「明日」「tomorrow」: 明日の予定
3. 予定を時系列でまとめる:
   - 時間
   - タイトル
   - 場所（あれば）
   - ミーティングリンク（あれば）

## 引数の例
- `/calendar` → 今日の予定
- `/calendar 明日` → 明日の予定
- `/calendar 今週` → 今週の予定一覧
- `/calendar 空き` → 今日の空き時間

## 出力ルール
- TONaRiの口調で報告
- 直近の予定（30分以内）があれば強調
- 予定がない時間帯は「フリータイム」として伝える
