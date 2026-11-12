#!/bin/zsh

set -e

docker compose -f ./n8n/compose.yml up -d

echo "n8n is running at http://localhost:5678"
