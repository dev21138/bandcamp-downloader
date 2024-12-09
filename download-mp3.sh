#!/bin/bash
rm -rf ./mycollection/mp3-320 && mkdir -p ./mycollection/mp3-320
./venv/bin/python  bandcamp-downloader.py --browser firefox --format mp3-320 --cookies /home/developer/snap/firefox/common/.mozilla/firefox/bquyll2y.default/cookies.sqlite --download-since 2024-12-02 --parallel-downloads 16 --directory ./mycollection/mp3-320 <user>
