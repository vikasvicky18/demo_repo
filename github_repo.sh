#!/bin/bash

# GitHub access token (replace with your token)
ACCESS_TOKEN="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"

# GitHub username
USERNAME="vikasvicky18"

# Repository name
REPO_NAME="demo_repo"

# Create a new GitHub repository
create_repo() {
  curl -H "Authorization: token $ACCESS_TOKEN" -d '{"name": "'$REPO_NAME'"}' "https://api.github.com/user/repos"
}

# Add 10 files with content to the repository
add_files() {
  for i in {1..10}; do
    echo "Creating file$i.txt"
    touch file$i.txt
    echo "This is the content of file $i" > file$i.txt
  done

  git init
  git add .
  git commit -m "Initial commit"
  git branch -M main
  git remote add origin "https://github.com/$USERNAME/$REPO_NAME.git"
  git push -u origin main
}

# Main script
create_repo
add_files

echo "Repository $REPO_NAME has been created on GitHub and 10 files have been added."

