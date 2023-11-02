FROM amazeeio/advanced-task-toolbox:latest

COPY scripts/ /app/scripts/

RUN apk add jq

RUN DOWNLOAD_PATH=$(curl -sL "https://api.github.com/repos/uselagoon/lagoon-sync/releases/latest" | grep "browser_download_url" | cut -d \" -f 4 | grep linux_386) && wget -O /usr/local/bin/lagoon-sync $DOWNLOAD_PATH && chmod a+x /usr/local/bin/lagoon-sync


# CMD lagoon config add --create-config -g $TASK_API_HOST/graphql -H $TASK_SSH_HOST -P $TASK_SSH_PORT -l amazeeio --force && /app/vendor/bin/robo run --migrateYaml=./scripts/migrate_bi_$(echo $JSON_PAYLOAD_ENVTYPE).yaml