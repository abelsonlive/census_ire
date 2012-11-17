#!/usr/bin/bash
state=0
for file in $(paste urls.txt filepaths.txt) ; do
    if [[ $state -eq 0 ]] ; then
        state=1
        url=$file
    else
        state=0
        wget -O- $url | gzcat > $file
    fi
done