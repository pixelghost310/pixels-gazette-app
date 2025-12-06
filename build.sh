#!/bin/bash

echo "🧹 Cleaning old content directory..."
rm -rf content

echo "📚 Cloning content repository from GitHub..."
echo "🔗 Repository: https://github.com/${CONTENT_REPO}"
if [ $NO_GITHUB_TOKEN ]; then
    git clone https://github.com/${CONTENT_REPO} content
else
    git clone https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/${CONTENT_REPO} content
fi

echo "🏗️ Building site with Quartz..."
npx quartz build

echo "✅ Build completed successfully!"
