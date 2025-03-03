#!/bin/bash

# Slack Incoming Webhook URL (またはBotトークンとチャンネルID) を設定
read -r -p "Slack Incoming Webhook URLを入力してください (または、'token'と入力してBotトークンとチャンネルIDを入力): " WEBHOOK_URL

if [[ "$WEBHOOK_URL" == "token" ]]; then
  read -r -p "Bot User OAuth Tokenを入力してください: " BOT_TOKEN
  read -r -p "チャンネルIDを入力してください: " CHANNEL_ID
fi

# 作業の例 (ファイルを作成)
# ここに実際の作業コマンドを記述

# Slackに通知 (Incoming Webhookの場合)
if [[ "$WEBHOOK_URL" != "token" ]]; then
  curl -X POST -H 'Content-type: application/json' --data '{"text":"OpenHandsの作業が完了しました！"}' "$WEBHOOK_URL"
else
  # Slackに通知 (chat.postMessageの場合)
  curl -X POST -H 'Authorization: Bearer '$BOT_TOKEN'' \
      -H 'Content-type: application/json' \
      --data '{
          "channel": "'$CHANNEL_ID'",
          "text": "OpenHandsの作業が完了しました！"
      }' \
      https://slack.com/api/chat.postMessage
fi
