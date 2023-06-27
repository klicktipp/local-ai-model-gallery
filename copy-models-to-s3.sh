#!/bin/sh

set -eu

git clone https://github.com/go-skynet/model-gallery

cd model-gallery

for model_url in $(cat *.yaml | grep "uri.*\.bin" | cut -d '"' -f2); do 
  model="${model_url##*/}"
  echo "=== Model: ${model} ==="
  curl -L "${model_url}" | aws s3 cp - "https://kt-ai-stack.s3.amazonaws.com/local-ai/gpt4all.io/models/${model}"
done

rm -rf model-gallery
