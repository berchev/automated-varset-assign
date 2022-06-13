#!/bin/bash
set -x

# README
# Add workspace names to a list called `workspace-id-list`
# instead creating payload.json - a possible alternative: --data '{"data":[{"type":"workspaces","id":"'$i'"}]}'

TOKEN="XXXXXXXXXXXXXXXX.atlasv1.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
varsetid="varset-XXXXXXXXXXXXXXXXXXXXXXXX"

for i in $(cat workspace-id-list)
do
   echo adding worskpace $i to payload
   echo '{"data":[{"type":"workspaces","id":"'$i'"}]}' > ./payload.json
   sleep 2
   echo adding variableset for workspace $i
   curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @payload.json \
  https://app.terraform.io/api/v2/varsets/$varsetid/relationships/workspaces
  sleep 2
done
