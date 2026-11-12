#!/bin/zsh

set -e

docker compose -f ./n8n/compose.yml down

echo "n8n has been stopped."
