#!/bin/bash

function add_password() {
    echo "サービス名を入力してください："
    read service_name

    echo "ユーザー名を入力してください："
    read user_name

    echo "パスワードを入力してください："
    read -s password
    echo

    echo "$service_name:$user_name:$password" >> password_manager.txt
    echo "パスワードの追加は成功しました."
}

function get_password() {
    echo "サービス名を入力してください："
    read search_service

    result=$(grep "^$search_service:" password_manager.txt)

    if [ -z "$result" ]; then
        echo "そのサービスは登録されていません。"
    else
        echo "サービス名：$(echo $result | cut -d':' -f1)"
        echo "ユーザー名：$(echo $result | cut -d':' -f2)"
        echo "パスワード：$(echo $result | cut -d':' -f3)"
    fi
}

while true; do
    echo "パスワードマネージャーへようこそ！"
    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read choice

    case $choice in
        "Add Password")
            add_password
            ;;
        "Get Password")
            get_password
            ;;
        "Exit")
            echo "Thank you!"
            exit 0
            ;;
        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
            ;;
    esac
done
