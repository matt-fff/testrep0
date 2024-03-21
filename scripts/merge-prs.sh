#!/bin/sh

if ! command -v gh >/dev/null 2>&1; then
    echo "Install gh first"
    exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
    echo "You need to login: gh auth login"
    exit 1
fi

# Check if a command-line argument was provided
if [ $# -eq 0 ]
then
  LIMIT=1000
else
  LIMIT=$1
fi

gh pr list --json number --jq '.[].number' | \
  head -n $LIMIT | \
  xargs -I{} gh pr comment {} -b "/trunk merge"