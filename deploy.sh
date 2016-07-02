#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

hugo && \  # Build the project.
git add -A # Add changes to git.

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg" && \
git push origin master && \ # Push source and build repos.
git subtree push --prefix=public git@github.com:spencerlyon2/hugo_gh_blog.git gh-pages
