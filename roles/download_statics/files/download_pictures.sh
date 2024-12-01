#!/bin/bash
pictures=$(curl https://imgur.com/gallery/more-clouds-from-me-D7WeFYF\#/t/wallpaper | tr "\"" "\n" | tr -d "\\" | grep  "https.*jpeg$")

for i in $(echo $pictures); do
  curl $i -o /data/images/$(echo "$i" | tr "//" "\n" | tail -n1)
done
