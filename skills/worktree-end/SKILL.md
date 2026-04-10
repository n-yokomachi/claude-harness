---
name: worktree-end
description: git worktreeを削除してクリーンアップする
allowed-tools: Bash, AskUserQuestion
---

# worktree-end

指定したブランチの git worktree を削除し、クリーンアップする。

## 使い方

```
/worktree-end <branch名>
```

例:
- `/worktree-end feature/KSF-42`
- `/worktree-end feature/new-api`

引数を省略した場合、`git worktree list` の結果を表示して選択を求める。

## 手順

1. 引数からブランチ名を取得する。引数がない場合は `git worktree list` を実行し、一覧を表示して AskUserQuestion でどれを削除するか確認する（メインの worktree は除外して表示）。

2. 対象の worktree パスを特定する:
   - `git worktree list --porcelain` を実行し、指定ブランチに対応する worktree を見つける
   - 見つからない場合はエラーメッセージを表示して終了

3. 削除前に、対象 worktree にコミットされていない変更がないか確認する:
   ```bash
   git -C <worktree-path> status --porcelain
   ```
   - 未コミットの変更がある場合は AskUserQuestion で続行するか確認する

4. worktree を削除する:
   ```bash
   git worktree remove <worktree-path>
   ```
   - 未コミットの変更がありユーザーが続行を選んだ場合は `--force` を付ける

5. prune を実行してクリーンアップ:
   ```bash
   git worktree prune
   ```

6. 完了メッセージを表示する:
   - 削除した worktree のパスとブランチ名

## 注意事項

- メインの worktree（bare リポジトリ元）は削除対象から除外する
- 現在自分がいる worktree は削除できない旨を案内する
- tmux ペインの終了は手動で行うよう案内する（`Ctrl-D` または `exit`）
