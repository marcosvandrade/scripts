#!/bin/bash

#Pasta contendo o local onde está armazenado seus papéis de parede

export wallpaper_path=/home/marcos/hd2TB/Dropbox/wallpaper/maratonaDev

shopt -s nullglob

# Armazenar todos as extensões dos arquivos de imagem em um array

wallpapers=(

$wallpaper_path/*.jpg

$wallpaper_path/*.jpeg

$wallpaper_path/*.png

$wallpaper_path/*.bmp

$wallpaper_path/*.svg

)

wallpapers_size=${#wallpapers[*]}

#Troca aleatória 

while true

do

    #Gerador randômico

    random_index=$(($RANDOM % $wallpapers_size))

    gsettings set org.gnome.desktop.background picture-uri ${wallpapers[$random_index]}

    #Especificar tempo de troca

    sleep 1m

done