#!/bin/sh -l

cd "$1" || exit
npm dedupe
git status -s | grep " M package-lock.json" && echo "::"warning file=package-lock.json"::"Duplicate dependencies found. Run npm dedupe to remove them, or add --dry-run parameter to get more info.
git reset --hard HEAD
