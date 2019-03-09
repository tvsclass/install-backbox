#!/bin/bash
clear


function message {
echo "[tvs-m] message:"  $1 ; }



function list {
echo '[list]' $1  ; }



function quest {
echo '[question]:' $1
read ban
case $ban in
y)
echo 
;;
*)
message 'отменено пользователем'
exit 0 
;;
esac
}

message 'скрипт запущен...'
message 'вас приветствует мастер установки приложений tvs_'
echo
echo 'отмечено к установке:'
list 'main.anlinux'
list 'tvs.faststartscript'
echo

quest 'Установить скрипты? (y/n)'

echo

echo 'нужные компоненты:'
echo
list 'git'
list 'toilet 1.0+'
list 'bash 1.0+'
echo
quest 'Установить компоненты?'
message Установка...
apt install toilet git openssh -y >> /dev/null
message 'Компоненты установлены'
echo
quest 'Запустить установку? (дистрибутив backbox) (y/n)'
message 'Запускаю...'

cd ~/

pkg install wget openssl-tool proot -y >> /dev/null 
hash -r 
wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/BackBox/backbox.sh 
bash backbox.sh
git clone https://github.com/tvsclass/anlinuxFSe/
cd anlinuxFSe
bash faststartINS.sh

message 'установка завершена.'
message 'введите bb для запуска'
