#!/bin/bash

git checkout main

podman run --name postfix debian:bullseye-slim /bin/bash -c "apt-get update > /dev/null && apt-cache policy postfix | sed -n -e 's/^.*Candidate: //p' | tr -d '\n'" > version
podman rm postfix

git add -A
git commit -m `cat version | cut -d~ -f 1 | cut -d+ -f 1`
git push origin main
git tag -f `cat version | cut -d~ -f 1 | cut -d+ -f 1`
git push origin -f `cat version | cut -d~ -f 1 | cut -d+ -f 1`