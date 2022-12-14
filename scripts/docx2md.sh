#!/bin/bash
#
# generate a Markdown version of a word document. Goes in separate folder, since
# images are extracted and converted as well (separate folder avoids naming clashes).
#
# REQUIREMENTS: pandoc
#
#
# with pandoc
#  --extract-media=[media folder]
#
# USAGE:
#
# docx2md.sh filename #(no extension)
#
# This will generate a converted file in a subfolder, for example if you have a file
# `contract.docx`:
#
# generates:
# ```
# contract
# ├── contract.md
# └── media
#     ├── image1.png
#     ├── image2.png
#     └── image3.png
# ```
#
# Author: Jesper Rønn-Jensen 2015-11-30
# https://gist.github.com/jesperronn/ff5764274b3642bc7f2f
# Inspired by https://gist.github.com/aembleton/1eb889bc443996a508df
#
which pandoc > /dev/null
rc=$?
if [[ $rc != 0 ]]; then
  echo "FATAL missing pandoc. You can install with 'brew install pandoc' or similar"
  exit 9
fi

if [ -z "$1" ]; then
  echo "Usage:"
  echo "docx2md.sh [filename-no-extension]"
  echo ""
  exit 13
fi

if [ ! -f "$1.docx" ]; then
  echo "FATAL missing file '$1.docx'"
  exit 11
fi

# cleanup
rm -rf "$1"

mkdir -p "$1"
cd "$1" || exit 11

pandoc -f docx -t markdown  --extract-media="media" -o "$1.md" "../$1.docx"

code=$?

if test "$code" == "0"; then
  echo "Conversion completed - output written to $1/$1.md"
  echo "and associated media files written to $1/media"
fi 
