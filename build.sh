#!/bin/bash
set -e

# Install Flutter
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1 $HOME/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Verify Flutter installation
flutter --version

# Get dependencies
flutter pub get

# Build web app (HTML renderer is set in web/flutter_bootstrap.js)
flutter build web --release -O4 --pwa-strategy offline-first


rm -rf build/web/canvaskit
echo "Removed canvaskit directory (saved ~26MB)"
