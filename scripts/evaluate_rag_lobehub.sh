#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/env.sh"

TOP_K="${TOP_K:-10}"
OUT_FILE="${OUT_DIR}/${QA_OUTPUT_FILE/.json/_lobehub_top${TOP_K}.json}"

python3 task_eval/evaluate_qa.py \
  --data-file "$DATA_FILE_PATH" \
  --out-file "$OUT_FILE" \
  --model gpt-5-mini \
  --batch-size 1 \
  --use-rag \
  --retriever lobehub \
  --top-k "$TOP_K" \
  --rag-mode dialog
