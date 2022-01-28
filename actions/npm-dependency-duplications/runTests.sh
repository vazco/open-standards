#!/bin/bash

#Setup
fail=0
pass=0

#Helpers
assertEqual() {
  if [[ "$1" == "$2" ]]; then
    echo OK
    pass=$((pass + 1))
  else
    echo FAIL: "'$1'" is not equal "'$2'"
    fail=$((fail + 1))
  fi
}

#Consts
actionPath="actions/npm-dependency-duplications/"
testsPath="$actionPath"test

#Runner
echo "Detects dependency duplication"
positiveTest() {
  desiredOutput="::warning file=package-lock.json::Duplicate dependencies found. Run npm dedupe to remove them, or add --dry-run parameter to get more info."
  output=$("$actionPath"entrypoint.sh "$testsPath"/positive)
  assertEqual "$output" "$desiredOutput"
}
positiveTest

echo "Detects no duplication of dependencies"
negativeTest() {
  desiredOutput="No dependency duplication found."
  output=$("$actionPath"entrypoint.sh "$testsPath"/negative)
  assertEqual "$output" "$desiredOutput"
}
negativeTest

#Summary
echo ""
if [[ $fail == 0 ]]; then
  echo "SUCCESS, $pass / $pass tests passed!"
  exit 0
else
  sum=$((fail + pass))
  echo "FAILURE, $pass / $sum tests passed!"
  exit 1
fi
