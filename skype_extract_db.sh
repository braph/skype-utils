#!/bin/bash

unset CDPATH
set -u
set +o histexpand

mainDb=${1?"Missing main.db file"};   # like ~/.Skype/$user/main.db
convId=${2?"Missing conversion id"};  # like "19:e48d9d6e12be427a84d83411e9a36b48@thread.skype"
outFile=${3?"Missing output file"};   # blabla.csv

sqlite3 -batch "$mainDb" <<EOF
.mode csv
.output $outFile
select author, datetime(timestamp, 'unixepoch', 'localtime'), edited_timestamp, body_xml from Messages where convo_id in (select id from Conversations where identity = '$convId');
.output stdout
.exit
EOF

