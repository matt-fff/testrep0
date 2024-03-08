#!/bin/sh

if ! command -v gh >/dev/null 2>&1; then
    echo "Install gh first"
    exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
    echo "You need to login: gh auth login"
    exit 1
fi

gh pr list --json number --jq '.[].number' | \
  xargs -I{} gh pr comment {} -b "/trunk merge"

