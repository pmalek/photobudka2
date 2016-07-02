#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

# Build the project and add stage changes
hugo -t hugo-agency-theme && \
git add -A && \
git commit -m "$msg"
git push origin master && \
git subtree push --prefix=public $(git config --get remote.origin.url) gh-pages
