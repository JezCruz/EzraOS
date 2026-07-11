#!/data/data/com.termux/files/usr/bin/bash

set -e

BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

echo
printf "${BLUE}EzraOS Installer${RESET}\n"
printf "${WHITE}Installing required packages...${RESET}\n\n"

pkg update -y
pkg install -y git python curl llama-cpp

BASE="$HOME/EzraOS"
PREFIX_PATH="$PREFIX/bin"

# Create required directories
mkdir -p \
  "$BASE/data/history" \
  "$BASE/logs" \
  "$BASE/runtime" \
  "$BASE/models"

# Create clean user data only if missing
touch "$BASE/data/notes.txt"

[ -f "$BASE/data/history/general.json" ] || echo '[]' > "$BASE/data/history/general.json"
[ -f "$BASE/data/history/java.json" ] || echo '[]' > "$BASE/data/history/java.json"
[ -f "$BASE/data/history/bible.json" ] || echo '[]' > "$BASE/data/history/bible.json"

# Remove stale runtime files
rm -f "$BASE/runtime/server.pid"
rm -f "$BASE/logs/server.log"

# Make scripts executable
chmod +x "$BASE/ezra"
chmod +x "$BASE/core/server.sh"
chmod +x "$BASE/modules/"*.sh 2>/dev/null || true

# Create global ezra command
ln -sf "$BASE/ezra" "$PREFIX_PATH/ezra"

echo
printf "${CYAN}EzraOS installation completed.${RESET}\n"
printf "${WHITE}Start EzraOS with:${RESET}\n\n"
printf "    ${CYAN}ezra${RESET}\n\n"
printf "${WHITE}The AI model may be downloaded automatically on first use.${RESET}\n"
echo
