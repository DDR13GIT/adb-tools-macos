#!/bin/bash

TARGET_DIR=~/Library/Android/sdk
GITHUB_REPO="https://github.com/DDR13GIT/adb-tools-macos" 
FOLDER_NAME="platform-tools"

# Check if the TARGET_DIR exists, if not, create it
if [ ! -d "$TARGET_DIR" ]; then
  echo "Directory $TARGET_DIR does not exist. Creating it..."
  mkdir -p "$TARGET_DIR"
fi

echo "Cloning the repository..."
git clone --depth 1 --branch main $GITHUB_REPO $TARGET_DIR/$FOLDER_NAME

# Check if the clone was successful
if [ $? -eq 0 ]; then
  echo "Repository cloned successfully into $TARGET_DIR/$FOLDER_NAME"
else
  echo "Failed to clone the repository."
  exit 1
fi

# Backup .zshrc before modifying
echo "Backing up .zshrc..."
cp ~/.zshrc ~/.zshrc.backup

# Add the environment variables to .zshrc
echo "Updating .zshrc with Android SDK environment variables..."
echo "export ANDROID_HOME=/Users/debopriyadebroy/Library/Android/sdk" >> ~/.zshrc
echo "export PATH=\$ANDROID_HOME/tools:\$ANDROID_HOME/tools/bin:\$ANDROID_HOME/platform-tools:\$PATH" >> ~/.zshrc

echo "Reloading .zshrc..."
source ~/.zshrc
echo "Setup completed! Please restart your terminal for changes to take effect."