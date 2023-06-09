#!/bin/bash

# MySQLのホスト、ユーザー、パスワードを設定します
MYSQL_HOST="127.0.0.1"
MYSQL_USER="root"
MYSQL_PASSWORD="your_password"

# ダウンタイムをチェックする間隔（秒）を設定します
CHECK_INTERVAL=10

while true; do
    # `mysqladmin ping`コマンドを実行してデータベースの応答を確認します
    ping_output=$(mysqladmin ping -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD 2>&1)

    # データベースが応答しているかどうかを確認します
    if [[ "$ping_output" == "mysqld is alive" ]]; then
        echo "$(date): is alive"  
    else
        echo "$(date): is dead"
    fi

    # 次のチェックまで待機します
    sleep $CHECK_INTERVAL
done
