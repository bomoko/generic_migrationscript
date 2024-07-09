FROM amazeeio/advanced-task-toolbox:latest

COPY ./lagoon/99_sshkey_entrypoint.sh /lagoon/entrypoints/99_sshkey_entrypoint.sh

COPY scripts/ /app/scripts/

RUN apk add jq

RUN DOWNLOAD_PATH=$(curl -sL "https://api.github.com/repos/uselagoon/lagoon-sync/releases/latest" | grep "browser_download_url" | cut -d \" -f 4 | grep linux_386) && wget -O /usr/local/bin/lagoon-sync $DOWNLOAD_PATH && chmod a+x /usr/local/bin/lagoon-sync
RUN curl -L "https://github.com/uselagoon/lagoon-cli/releases/download/v0.21.3/lagoon-cli-v0.21.3-linux-amd64" -o /usr/local/bin/lagoon && chmod +x /usr/local/bin/lagoon

CMD /app/scripts/run.sh