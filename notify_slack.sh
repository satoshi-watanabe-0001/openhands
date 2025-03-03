#!/bin/bash

# Slack Bot User OAuth Token と チャンネルID を設定
BOT_TOKEN="***REMOVED***"
CHANNEL_ID="C08GG0WTE9W"


# 作業の例 (ファイルを作成)
# ここに実際の作業コマンドを記述。例えば、
# echo "作業を開始します"
# ... 何らかの処理 ...
# echo "作業が完了しました"


# Slackに通知 (chat.postMessageの場合)
curl -X POST -H 'Authorization: Bearer '$BOT_TOKEN'' \\
      -H 'Content-type: application/json' \\
      --data '{
         "channel": "'$CHANNEL_ID'",
         "text": "OpenHandsの作業が完了しました！"
      }' \\
      https://slack.com/api/chat.postMessage
