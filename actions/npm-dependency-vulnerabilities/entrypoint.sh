#!/bin/sh -l

cd "$1" || exit
npm audit --dry-run
output=$?
if [ "$output" = 0 ]; then
    echo "No vulnerabilities found."
else
  location=""
  case "$1" in
  */)
    location="$1"
      ;;
  *)
    location="$1"/
      ;;
  esac
  echo "::"warning file="$location""package-lock.json""::"Dependency vulnerabilities found. Run npm audit to get more info.
fi
