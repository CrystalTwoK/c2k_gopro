fx_version 'adamant'
game 'gta5'

author 'Crystal2K'
description 'GoPro Script by Crystal2K'
version "1.0.0"

client_scripts {'client/*.lua'}
shared_scripts {'config.lua'}
server_scripts {'server/*.lua'}

ui_page('ui/main.html')

files {
    'ui/main.html',
    'ui/css/main.css',
    'ui/js/main.js',
    'ui/assets/*.png',
    'ui/assets/*.jpg',
    'ui/assets/fonts/*.ttf',
}