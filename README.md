```
# yt-tui

A terminal-first YouTube search and download tool written in shell.  
Uses Invidious as a lightweight YouTube frontend and `yt-dlp` for audio extraction.

---

## Dependencies

- `yt-dlp`
- `wget`
- `fzf`
- `ffmpeg` (for `.m4a` to `.mp3` conversion)

---

## Installation

```bash
git clone https://github.com/bhu1-103/yt-tui.git
cd yt-tui
chmod +x yt dl.sh m4a2mp3.sh sync.sh
```

---

## Usage

### 1. Interactive Mode (search and download)

```bash
./yt
```

- Prompts for a search query  
- Displays top 10 results using `fzf`  
- Downloads selected result as `.m4a`  
- Embeds metadata and thumbnail  

---

### 2. Batch Mode (from file)

1. Create a file called `dl.txt` with one entry per line:

```txt
Vaundy - Tokimeki
Kenshi Yonezu - Eine Kleine
Yorushika - Just a Sunny Day for You
Aimer - Kataomoi
ZUTOMAYO - Study Me
Aimer - RE:I AM
King Gnu - Hakujitsu
Ichiko Aoba - Mars 2027
Yogee New Waves - Summer of Love
Homecomings - Moving Days
```

2. Then run:

```bash
./dl.sh
```

- Automatically searches and downloads each query in `dl.txt`  
- Downloads are saved as `.mp3` with metadata  

---

### 3. Convert `.m4a` files to `.mp3`

```bash
./m4a2mp3.sh
```

- Converts all `.m4a` files in the current directory to `.mp3` using `ffmpeg`

---

### 4. Sync to iPod / PS Vita / External Device

```bash
./sync.sh /run/media/$USER/DEVICE_NAME/
```

- Manually syncs your music to a mounted device  
- Uses `rsync` (customizable)

---

## To-do

- [x] TUI search with `fzf`
- [x] Batch mode (`dl.txt`)
- [x] Format conversion with `ffmpeg`
- [x] Basic sync to external device
- [ ] MusicBrainz tagging support
- [ ] Device auto-detection
- [ ] Fallback if Invidious fails
- [ ] Resume/incremental sync

---

## Notes

- Scripts are written in `zsh`, but should work in `bash` with minor edits  
- Built and tested on Arch Linux
```
