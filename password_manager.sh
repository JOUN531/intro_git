#!/bin/bash

function add_password() {
    echo "�T�[�r�X������͂��Ă��������F"
    read service_name

    echo "���[�U�[������͂��Ă��������F"
    read user_name

    echo "�p�X���[�h����͂��Ă��������F"
    read -s password
    echo

    echo "$service_name:$user_name:$password" >> password_manager.txt
    echo "�p�X���[�h�̒ǉ��͐������܂���."
}

function get_password() {
    echo "�T�[�r�X������͂��Ă��������F"
    read search_service

    result=$(grep "^$search_service:" password_manager.txt)

    if [ -z "$result" ]; then
        echo "���̃T�[�r�X�͓o�^����Ă��܂���B"
    else
        echo "�T�[�r�X���F$(echo $result | cut -d':' -f1)"
        echo "���[�U�[���F$(echo $result | cut -d':' -f2)"
        echo "�p�X���[�h�F$(echo $result | cut -d':' -f3)"
    fi
}

while true; do
    echo "�p�X���[�h�}�l�[�W���[�ւ悤�����I"
    echo "���̑I����������͂��Ă�������(Add Password/Get Password/Exit)�F"
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
            echo "���͂��ԈႦ�Ă��܂��BAdd Password/Get Password/Exit ������͂��Ă��������B"
            ;;
    esac
done
