#!/bin/bash

#01 sync and exclude
rsync -r --exclude '*.MXF' /mnt/ENC/Encoded/* /mnt/ENC/Proxies/ ;\

#02 remove unnecessary files
rm -rf /mnt/ENC/Encoded/* ;\

#03 move file to encode
mv /mnt/ENC/FileEnc/* /mnt/ENC/Encoded/ ;\

#04 Encoding MXF to MOV proxy
for i in /mnt/ENC/Encoded/*/*/*/*/*/*.MXF ; do
ffmpeg -y -i "$i" -c:v prores_ks -profile:v 0 -qscale:v 12 -vendor ap10 -pix_fmt yuv422p10le -s 1920x1080 -filter_complex 'amerge=inputs=4,channelmap=channel_layout=quad' -c:a pcm_s24le -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:fontsize=36: x=(w-tw)/2: y=h-(2*lh): text=PROXY: fontcolor=white: box=1: boxcolor=0x00000000@1" -an -f mov "${i%.*}"_proxy.mov ;\


done
