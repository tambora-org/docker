#!/bin/bash
# Current Container Name : {{ $CurrentContainer.Name }}

echo "No languages to install, use ENV:TESSERACT_LANGUAGES"

#apt-get autoremove
#apt-get clean

tesseract --list-langs


