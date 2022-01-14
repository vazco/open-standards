#!/bin/sh -l

cd "$1" || exit
pwd
ls
cp package-lock.json package-lock-copy.json
npm dedupe 1> /dev/null
diff=`diff package-lock.json package-lock-copy.json`
if [[ $diff != "" ]]; then
  echo "::"warning file=package-lock.json"::"Duplicate dependencies found. Run npm dedupe to remove them, or add --dry-run parameter to get more info.
fi
rm package-lock-copy.json
