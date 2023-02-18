#!/bin/bash
set -e

CHROME_DIRECTORY="12_ft_chrome"
FIREFOX_DIRECTORY="12_ft_firefox"

copy_action() {
    mkdir "$1"
    cp content-script.js popup.html popup.css popup.js manifest.json README.md "$1"/
    cp -r icons "$1"/

    if [[ "$1" == *"firefox" ]]; then
        cp manifest_firefox.json "$1"
        cd "$1" && mv manifest_firefox.json manifest.json
    fi
}

release_chrome() {
 copy_action $CHROME_DIRECTORY
 cd $CHROME_DIRECTORY && 7z a -tzip -mx9 ../$CHROME_DIRECTORY.zip *
 cd .. && rm -rf $CHROME_DIRECTORY
}

release_firefox() {
    copy_action $FIREFOX_DIRECTORY
    pwd
    sed -i '' 's/chrome/browser/g' "content-script.js"
    sed -i '' 's/chrome/browser/g' "popup.js"
    7z a -tzip -mx9 ../$FIREFOX_DIRECTORY.zip *
    cd .. && rm -rf $FIREFOX_DIRECTORY
}

release_chrome
release_firefox
