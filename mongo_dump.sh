#!/usr/bin/bash
FILES="states/*"
for f in $FILES
do
    mongoimport -d census -c sf1 --type csv --file "$f" --headerline --upsert
done