#!/bin/sh

set -eu

for model_url in $(cat *.yaml | grep "uri.*\.bin" | cut -d '"' -f2); do 
  model="${model_url##*/}"
  echo "=== Model: ${model} ==="
  curl "${model_url}" | aws s3 cp - "s3://kt-ai-stack/local-ai/gpt4all.io/models/${model}"
done

