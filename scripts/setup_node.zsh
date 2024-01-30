#!/usr/bin/env zsh

echo "📦 Starting Node.js setup..."

# Function to check and install NPM packages
check_and_install_npm_package() {
  local package=$1
  if npm list --global "$package" >/dev/null 2>&1; then
    echo "✅ $package already installed, skipping..."
  else
    echo "🔧 Installing $package..."
    npm install --global "$package"
  fi
}

# Array of NPM packages to install
npm_packages=(
  "firebase-tools"
  "@angular/cli"
  "@ionic/cli"
  "typescript"
  "json-server"
  "http-server"
  "trash-cli"
  "nodemon"
  "corepack"
  "postman-to-openapi"
)

# Check if Node.js is installed
if command -v node >/dev/null 2>&1; then
  echo "✅ Node $(node --version) & NPM $(npm --version) already installed, skipping Node installation..."
else
  echo "🔧 Installing Node & NPM with nvm..."
  echo "🔧 Installing LTS version..."
  nvm install --lts
  echo "🔧 Installing latest version..."
  nvm install node --default
fi
echo ""

echo "🔧 Installing global NPM packages...\n"
for package in "${npm_packages[@]}"; do
  check_and_install_npm_package "$package"
done
echo "\n✅ Global NPM packages installation complete."
echo ""

echo "🔧 Global NPM Package List:"
npm list --global --depth=0
