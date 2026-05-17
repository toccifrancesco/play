#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./play.sh [title]"
    exit 1
fi

SONG_PATH=$(find . -maxdepth 2 -iname "*$1*" -type f -print -quit)

if [ -z "$SONG_PATH" ]; then
    echo "Error: No file matching '$1' found."
    exit 1
fi

cleanup() {
    echo -e "\nExiting..."
    kill "$PLAYER_PID" 2>/dev/null
    tput cnorm
    exit 0
}

trap cleanup SIGINT

echo "Now playing: $(basename "$SONG_PATH")"
mpv --no-video --msg-level=all=no "$SONG_PATH" > /dev/null 2>&1 &
PLAYER_PID=$!

TEMP_CAVA_CONF=$(mktemp)
    cat <<EOF > "$TEMP_CAVA_CONF"
    #Treat this as your "local" cava config
    [general]
    bar_width = 2
    bar_spacing = 1

    [color]
    gradient = 1
    gradient_count = 2
    gradient_color_1 = '#caf5ff'
    gradient_color_2 = '#eecaff'
EOF

cava -p "$TEMP_CAVA_CONF"

cleanup
