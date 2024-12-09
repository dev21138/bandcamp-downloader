#!/bin/bash
rm -rf ./mycollection/flac && mkdir -p ./mycollection/flac
./venv/bin/python bandcamp-downloader.py --browser firefox --format flac --cookies /home/developer/snap/firefox/common/.mozilla/firefox/bquyll2y.default/cookies.sqlite --download-since 2024-12-02 --parallel-downloads 16 --directory ./mycollection/flac <user>
