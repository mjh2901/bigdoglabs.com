#!/bin/bash
# path to repo (change if repo moves)
cd /Users/Shared/docker/dev.mikehathaway.com

# Run job every hour using cron
# 0 * * * * /root/docker/dev.mikehathaway.com/autocommit.sh

# Github Personal Access Token
# REDACTED_PAT

#!/bin/bash

# Exit immediately if a command fails
set -e

# Ensure we're inside a Git repository
if [ ! -d .git ]; then
  echo "❌ Error: This is not a Git repository."
  exit 1
fi

# Check and configure Git user info
if ! git config --get user.name > /dev/null; then
  read -p "Enter your Git name (for commits): " GIT_NAME
  git config user.name "$GIT_NAME"
fi

if ! git config --get user.email > /dev/null; then
  read -p "Enter your Git email (for commits): " GIT_EMAIL
  git config user.email "$GIT_EMAIL"
fi

# Configure credential helper
git config --global credential.helper store

# Check if GitHub credentials are already stored
if ! grep -q "github.com" ~/.git-credentials 2>/dev/null; then
  echo "🔐 GitHub credentials not found."
  read -p "Enter your GitHub username: " GH_USER
  read -s -p "Enter your GitHub Personal Access Token (PAT): " GH_TOKEN
  echo ""

  # Get the current repo's remote URL
  REPO_URL=$(git remote get-url origin)

  if [[ "$REPO_URL" =~ ^https://github.com/(.*) ]]; then
    echo "https://$GH_USER:$GH_TOKEN@github.com/${BASH_REMATCH[1]}" >> ~/.git-credentials
    echo "✅ GitHub credentials saved."
  else
    echo "❌ Could not parse GitHub repo URL. Make sure you're using HTTPS."
    exit 1
  fi
fi

# Stage all changes
git add -A

# Only commit and push if there are changes
if git diff --cached --quiet; then
  echo "✅ No changes to commit."
else
  git commit -m "Auto Commit"
  git push
  echo "🚀 Changes committed and pushed."
fi

# --- Log handling ---
LOGFILE="./autocommit.sh.log"

# Reset log weekly if it's older than 7 days
if [ -f "$LOGFILE" ] && [ $(find "$LOGFILE" -mtime +7 -print) ]; then
    : > "$LOGFILE"
fi

# Append run info
echo "autocommit.sh ran $(date)" >> "$LOGFILE"

