#!/bin/bash
#
# generate a Markdown version of a web page. Goes in separate folder, since
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
# html2md.sh URL
#
# This will generate a converted file in the current folder

# Author: John Shepherdson 2020-07-29
# Inspired by https://gist.github.com/jesperronn/ff5764274b3642bc7f2f
#
which pandoc > /dev/null
rc=$?
if [[ $rc != 0 ]]; then
  echo "FATAL missing pandoc. You can install with 'brew install pandoc' or similar"
  exit 9
fi

if [ -z "$1" ]; then
  echo "Usage:"
  echo "htmlx2md.sh [URL of webpage to convert]"
  echo ""
  exit 13
fi

curl "$1"
res=$?

if test "$res" != "0"; then
  exit 11
fi

# remove the 'https://' or 'https://' part of the URL, to use as the output filename
filename=${1##*/}

# cleanup
rm -rf "$filename"

mkdir -p "$filename"
cd "$filename" || exit 11

pandoc --from html --to markdown "$1" --extract-media="media" --o "${filename}.md"

code=$?

if test "$code" == "0"; then
  echo "Conversion completed - output written to ${filename}/${filename}.md"
  echo "and associated media files written to ${filename}/media"
fi
