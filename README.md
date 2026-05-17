# play
A CLI music player script that simply runs cava while music is playing, with local cava theme!\
Will automatically stop showing cava's "music bars" when ctrl+c is pressed.

The core design idea is to have a simple and minimal way of playing and visualizing long audio tracks such as playlists or ambient music, without any particular control on the GUI interface, just plain bars and a keyboard shortcut to stop the player. This simple solution I designed is by far my favorite way of listening to music on my laptop, as when I work i only listen to ambient tracks. For this reason I decided to share it even though it's pretty simple. I use it all the time.

If you have some *purchased tracks*, you can use tools such as [yt-dlp](https://github.com/yt-dlp/yt-dlp) to obtain a copy of them to play using this script.

---
## ✅**Prerequisites**
- The Linux operating system.
- mpv player installed - please refer to [it's GitHub page](https://github.com/mpv-player/mpv).
- cava installed - please refer to [it's GitHub page](https://github.com/karlstav/cava).

## 💾**Download and use**
- Download the play.sh file and put it in the same folder where you have your music files.
- Point the terminal to your music folder with the cd command, for example:
  ```bash
  cd ~/Music
  ```
- Make the script executable with
  ```bash
  chmod u+x play.sh
  ```
- Run the script!
  ```bash
  ./play [track.mp3]
  ```
  *Note*: You can use **tab** after ./play to see your track list.
- Exit anytime with the ctrl+c shortcut.

## 🖼️**Edit theme**
play.sh holds it's local cava configuration, which you can adjust as you wish.\
Look inside the file, you'll see:
```bash
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
```
Refer to the [cava manual](https://github.com/karlstav/cava#configuration) to understand how to change those values, as this one is my personal configuration, but there are plenty of other options that you can choose!

---
## A couple of screenshots
*...even though it just looks like cava*

### My play script running alongside it's code
![play-vim](https://github.com/toccifrancesco/play/blob/main/screenshots/play-vim.png)

### Just my play script, fullscreen
![plain-play](https://github.com/toccifrancesco/play/blob/main/screenshots/plain-play.png)

---
Wish you a good time with my simple script!
