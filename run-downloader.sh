#!/bin/bash

BROWSER=firefox
FLAC_FORMAT=flac
MP3_FORMAT=mp3-320
DOWNLOAD_FOLDER=./mycollection
PARALLEL_DOWNLOADS=6

echo "Using $BROWSER browser"

# Check if a user  is provided
if [ -z "$1" ]; then
  echo "No user provided."
  exit 1
else
  BC_USER=$1
  echo "User provided: $1. Continue."
fi

# Check if cookies are provided
if [ -z "$2" ]; then
  echo "No cookies provided."
  exit 1
else
  COOKIES=$2
  echo "Cookies provided in: $2. Continue."
fi

# Check if date since is provided
if [ -z "$3" ]; then
  echo "No FROM date provided."
  FROM_DATE=2024-12-12
  echo "Downloading from $FROM_DATE"
else
  FROM_DATE=$3
  echo "FROM date provided in: $3. Continue."
fi

# Reset and prepare environment
rm -rf ./venv
virtualenv venv
source venv/bin/activate
./venv/bin/pip install -r requirements.txt

rm -rf $DOWNLOAD_FOLDER/$FLAC_FORMAT && mkdir -p $DOWNLOAD_FOLDER/$FLAC_FORMAT
echo "Command ./venv/bin/python bandcamp-downloader.py --browser $BROWSER --format $FLAC_FORMAT --cookies $COOKIES --download-since $FROM_DATE --parallel-downloads $PARALLEL_DOWNLOADS --directory $DOWNLOAD_FOLDER/$FLAC_FORMAT $BC_USER"
./venv/bin/python bandcamp-downloader.py --browser $BROWSER --format $FLAC_FORMAT --cookies $COOKIES --download-since $FROM_DATE --parallel-downloads $PARALLEL_DOWNLOADS --directory $DOWNLOAD_FOLDER/$FLAC_FORMAT $BC_USER
rm -rf $DOWNLOAD_FOLDER/$MP3_FORMAT && mkdir -p $DOWNLOAD_FOLDER/$MP3_FORMAT
echo "Command ./venv/bin/python bandcamp-downloader.py --browser $BROWSER --format $MP3_FORMAT --cookies $COOKIES --download-since $FROM_DATE --parallel-downloads $PARALLEL_DOWNLOADS --directory $DOWNLOAD_FOLDER/$MP3_FORMAT $BC_USER"
./venv/bin/python  bandcamp-downloader.py --browser $BROWSER --format $MP3_FORMAT --cookies $COOKIES --download-since $FROM_DATE --parallel-downloads $PARALLEL_DOWNLOADS --directory $DOWNLOAD_FOLDER/$MP3_FORMAT $BC_USER
