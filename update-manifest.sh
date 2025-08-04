#!/bin/bash

set -e

TARGET_REPO="soe-wai-lin/argo-e-commerce"
BRANCH="main"

# Clone the target repo using the token
git clone git@github.com:soe-wai-lin/argo-e-commerce.git
cd argo-e-commerce

# Example: Update the image tag in deployment.yaml (adjust as needed)
sed -i 's/image: cake-e-commerce:.*/image: cake-e-commerce:v1.0.16/' deployment.yaml

cat deployment.yaml

# Commit and push if there are changes
if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to commit."
else
  git add .
  git commit -m "Update deployment manifest via GitHub Action"
  git push origin ${BRANCH}
fi
