#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Download Video
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon ⬇️
# @raycast.argument1 { "type": "text", "placeholder": "URL" }

# Documentation:
# @raycast.description Use yt-dlp to download a video embedded in a webpage
# @raycast.author Leon Hazen
# @raycast.authorURL github.com/leonhazen

if ! command -v yt-dlp &> /dev/null; then
	echo "yt-dlp is required (https://github.com/yt-dlp/yt-dlp).";
	exit 1;
fi

url=$1
dst="${HOME}/Downloads/yt-dlp"
filename="%(webpage_url_domain)s-%(id)s.%(ext)s"

mkdir -p "${dst}"
yt-dlp "${url}" -o "${dst}/${filename}"
open "${dst}"