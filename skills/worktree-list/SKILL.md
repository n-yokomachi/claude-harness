---
name: worktree-list
description: 現在のgit worktree一覧を表示する
allowed-tools: Bash
---

# worktree-list

現在のリポジトリに関連する git worktree の一覧をわかりやすく表示する。

## 使い方

```
/worktree-list
```

## 手順

1. `git worktree list` を実行して一覧を取得する。

2. 結果を見やすいテーブル形式で表示する:
   - パス
   - ブランチ名
   - コミットハッシュ（短縮）
   - メインかどうかのマーク

3. worktree が1つ（メインのみ）の場合は「追加の worktree はありません」と案内する。
