#!/bin/bash
rm -rf ./venv
virtualenv venv
source venv/bin/activate
./venv/bin/pip install -r requirements.txt
