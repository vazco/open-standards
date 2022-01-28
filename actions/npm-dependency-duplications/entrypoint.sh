#!/bin/sh -l

cd "$1" || exit
cp package-lock.json package-lock-copy.json
npm dedupe 1> /dev/null
diffRes=$(diff package-lock.json package-lock-copy.json)
if [ "$diffRes" != "" ]; then
    location=""
    case "$1" in
    */)
      location="$1"
        ;;
    *)
      location="$1"/
        ;;
    esac
  echo "::"warning file="$location""package-lock.json""::"Duplicate dependencies found. Run npm dedupe to remove them, or add --dry-run parameter to get more info.
else
   echo "No dependency duplication found."
fi
rm package-lock.json
mv package-lock-copy.json package-lock.json
