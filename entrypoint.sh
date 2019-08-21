#!/bin/sh
set -euo pipefail

OUT_DIR=out
FILENAME=awesome
GIF_FILENAME=${OUT_DIR}/${FILENAME}.gif
VIDEO_FILENAME=${OUT_DIR}/${FILENAME}.mp4

# Createsa gif, given image files
function create_gif {
    local frame_delay=5
    # loop infinitely, strip color profiles, optimize frame and transparency
    convert -loop 0 -delay ${frame_delay} -strip -coalesce -layers Optimize $* ${GIF_FILENAME}
}

function create_video {
    ffmpeg -y -i ${GIF_FILENAME} -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" ${VIDEO_FILENAME}
}

function main {
    if [ $# -eq 0 ]; then
        echo "Usage: main image.png [image.png]"
        exit 1
    fi
    mkdir -p ${OUT_DIR}
    create_gif $*
    create_video
}

main $*