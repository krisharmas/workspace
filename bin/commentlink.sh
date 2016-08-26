#!/bin/bash

git fetch origin refs/meta/config:refs/remotes/origin/meta/config
git checkout meta/config
cat <<EOF >> project.config
[commentlink "jira"]
    match = ^([A-Z]*-[0-9]*)
    link = https://jira2.workday.com/browse/\$1
EOF

