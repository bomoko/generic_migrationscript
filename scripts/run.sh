#!/bin/bash

lagoon config add --create-config -g $TASK_API_HOST/graphql -H "$TASK_SSH_HOST" -P $TASK_SSH_PORT -l amazeeio --force 

sleep 5000

# Check if the file exists
if [ -f "/home/.ssh/migration_id_rsa" ]; then
  /app/vendor/bin/robo run --sshKey="/home/.ssh/key"
else
  /app/vendor/bin/robo run
fi