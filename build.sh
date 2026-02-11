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

# Build web app with HTML renderer (faster load, no canvaskit)
flutter build web --release --web-renderer html -O4 --pwa-strategy offline-first
