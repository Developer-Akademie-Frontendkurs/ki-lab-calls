@echo off
cd /d "%~dp0"
docker compose -f n8n\compose.yml up -d || exit /b
echo n8n is running at http://localhost:5678
