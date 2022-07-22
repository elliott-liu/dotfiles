#!/usr/bin/env zsh

echo "\n<<< STARTING ZSH SETUP >>>"

# Installation unnecessary; it's in the brewfile.

ZSH_PATH=/opt/homebrew/bin/zsh

if grep ${ZSH_PATH} /etc/shells; then
  echo "${ZSH_PATH} already exists in /etc/shells, skipping step..."
else
echo "Enter superuser (sudo) password to edit /etc/shells"
  echo $ZSH_PATH | sudo tee -a '/etc/shells' > /dev/null
fi

if [ "$SHELL" = ${ZSH_PATH} ]; then
  echo "$SHELL is already ${ZSH_PATH}"
else
echo "Enter user password to change login shell"
  chsh -s ${ZSH_PATH}
fi

if sh --version | grep zsh; then
  echo "/private/var/select/sh already symlinked to /bin/zsh, skipping step..."
else
# Looked promising, might remove later
echo "Enter superuser (sudo) password to symlink sh to zsh"
sudo ln -sfv '/bin/zsh' '/private/var/select/sh'
fi