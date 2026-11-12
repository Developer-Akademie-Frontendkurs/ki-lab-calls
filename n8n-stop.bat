@echo off
cd /d "%~dp0"
docker compose -f ./n8n/compose.yml down || exit /b
echo n8n is stopped
