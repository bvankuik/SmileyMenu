#!/bin/sh

# For the convert commandline tool, first install brew cask:
# https://brew.sh/
# Then install ImageMagick via:
# brew install imagemagick

orig="appicon.png"
new_prefix="appicon_"

mac="16 32 64 128 256 512 1024"

for i in $mac; do
    echo "Resizing to $i x $i"
    convert -resize $i $orig ${new_prefix}${i}.png
done

