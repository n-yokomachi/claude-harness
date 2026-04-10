---
name: worktree-start
description: git worktreeを作成し、tmuxペインで新しいClaude Codeセッションを起動する
allowed-tools: Bash, AskUserQuestion
---

# worktree-start

git worktree を作成し、依存関係をインストールした上で、tmux の新しいペインに Claude Code セッションを起動する。

## 使い方

```
/worktree-start <branch名>
```

例:
- `/worktree-start feature/KSF-42`
- `/worktree-start feature/new-api`

## 手順

1. 引数からブランチ名を取得する。引数がない場合は AskUserQuestion で確認する。

2. worktree のディレクトリパスを決定する:
   - リポジトリのルートディレクトリ名を取得（例: `ksf-dx-app`）
   - ブランチ名からサフィックスを生成（`/` を `-` に置換）
   - パス: `<リポジトリの親ディレクトリ>/<リポジトリ名>--<サフィックス>`
   - 例: `feature/KSF-42` → `/Users/na-yokomachi/ksf/ksf-dx-app--feature-KSF-42`

3. 既に同名の worktree が存在するか確認する（`git worktree list`）。存在する場合はその旨を伝え、既存のパスを使って手順6へスキップする。

4. worktree を作成する:
   ```bash
   git worktree add <path> <branch名>
   ```
   - ブランチが存在しない場合は `-b` オプションで新規作成する:
     ```bash
     git worktree add -b <branch名> <path> main
     ```

5. 依存関係をインストールする（worktree ディレクトリ内で実行）:
   - `web/` ディレクトリが存在する場合: `cd <path>/web && pnpm install`
   - `infrastructure/functions/` ディレクトリが存在する場合: `cd <path>/infrastructure/functions && uv sync`
   - いずれもバックグラウンドではなく完了を待つ

6. tmux で新しいペインを開き、Claude Code を起動する:
   ```bash
   tmux split-window -v -c "<path>"
   tmux send-keys 'claude' Enter
   ```

7. 完了メッセージを表示する:
   - 作成した worktree のパス
   - インストールした依存関係
   - tmux ペインで Claude Code が起動した旨

## 注意事項

- tmux セッション内でない場合はエラーにせず、worktree 作成と依存インストールまで行い、手動で移動するよう案内する
- 同じブランチの worktree が既に存在する場合は作り直さない
