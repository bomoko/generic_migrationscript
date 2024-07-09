#!/bin/sh


if [ ! -z "$MIGRATION_SSH_PRIVATE_KEY" ]; then
      echo "Writing ssh key into home"
      mkdir -p /home/.ssh
      echo "$MIGRATION_SSH_PRIVATE_KEY" > /home/.ssh/migration_id_rsa
      chmod 600 /home/.ssh/migration_id_rsa
fi