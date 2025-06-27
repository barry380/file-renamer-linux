#!/bin/bash

INPUT_DIR="/input"
OUTPUT_DIR="/output"
MAPPING_FILE="/app/mapping.json"
LOG_FILE="/app/logs/log.txt"
DRY_RUN=false

if [[ "$1" == "--dry-run" ]]; then
  DRY_RUN=true
fi

echo "" > "$LOG_FILE"

jq -r 'to_entries[] | "\(.key)|\(.value)"' "$MAPPING_FILE" | while IFS='|' read -r src dst; do
  SRC_PATH="$INPUT_DIR/$src"
  DST_PATH="$OUTPUT_DIR/$dst"

  if [[ -f "$SRC_PATH" ]]; then
    if $DRY_RUN; then
      echo "[INFO] (dry-run) $src → $dst" >> "$LOG_FILE"
    else
      cp "$SRC_PATH" "$DST_PATH"
      echo "[INFO] $src → $dst" >> "$LOG_FILE"
    fi
  else
    echo "[WARN] $src not found, skipping" >> "$LOG_FILE"
  fi
done
