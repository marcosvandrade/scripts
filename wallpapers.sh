#!/bin/bash

#Pasta contendo o local onde está armazenado seus papéis de parede

export wallpaper_path=file:///home/marcos/hd2TB/Dropbox/wallpaper/maratonaDev

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

    random_index=$(($RANDOM % ($wallpapers_size+1)))

    wallpaper_set=$wallpapers[$random_index]

    gsettings set org.gnome.desktop.background picture-uri "$wallpaper_set"

    #Especificar tempo de troca

    sleep 1m

done
