#!/bin/bash

# Claude Code notification script
# Usage: notify.sh <type>
# Types: permission_prompt, idle_prompt, stop

TYPE="${1:-stop}"

case "$TYPE" in
  permission_prompt)
    terminal-notifier \
      -title "Claude Code" \
      -message "承認待ちです" \
      -sound "Glass" \
      -activate "com.microsoft.VSCode"
    ;;
  idle_prompt)
    terminal-notifier \
      -title "Claude Code" \
      -message "入力待ちです" \
      -sound "Purr" \
      -activate "com.microsoft.VSCode"
    ;;
  stop)
    terminal-notifier \
      -title "Claude Code" \
      -message "タスクが完了しました" \
      -sound "Hero" \
      -activate "com.microsoft.VSCode"
    ;;
esac
