#!/bin/sh -l

cd "$1" || exit
output=npm find-dupes --fund=false
if [[ $string == *"up to date"* ]]; then
  echo "::"warning file=package-lock.json"::"Duplicate dependencies found. Run npm dedupe to remove them, or add --dry-run parameter to get more info.
fi
