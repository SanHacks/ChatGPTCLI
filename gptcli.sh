#!/bin/bash "
OPENAI_API_TOKEN="YOUR API TOKEN HERE"
# Check if the OPENAI_API_TOKEN environment variable is set
if [ -z "$OPENAI_API_TOKEN" ]; then
    echo "Please set your OpenAI API token using the environment variable OPENAI_API_TOKEN."
    exit 1
fi

# Define the prompt from the command line argument
PROMPT="$1"

# Check if the prompt argument is provided
if [ -z "$PROMPT" ]; then
    echo "Please provide a prompt as the argument."
    exit 1
fi

# Use curl to make the API call
curl --location 'https://api.openai.com/v1/completions' \
--header 'Content-Type: application/json' \
--header "Authorization: Bearer $OPENAI_API_TOKEN" \
--data '{
  "model": "davinci",
  "prompt": "'"$PROMPT"'",
  "max_tokens": 100,
  "temperature": 0,
  "top_p": 1,
  "n": 1,
  "stream": false,
  "logprobs": null,
  "stop": "\n"
}' | jq -r '.choices[0].text'