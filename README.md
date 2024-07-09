# generic migration

This presents a generic migration task that can be used to move a Lagoon environment (specifically one with mariadb as a database) between deploy targets/clusters.

In order to use it, you will need to register the task with the projects or environments that you're going to be migrating - for this, see `create_task.gql` for the graphql to run.

The task provides requires three arguments to run
* CLUSTER_SOURCE_ID - the _current_ cluster ID (an integer). Used for prerequisites checks and rollback
* CLUSTER_TARGET_ID - the _future_ cluster ID (also an integer). Used to determine where the deployment will end up.
* FILE_TRANSFER_DIRECTORY - the directory that you would like to rsync between environments (if empty, defaults to `/app/web/sites/default/all/files`)

You'll need to be a maintainer or admin yourself in order to run this.


## Migrating environments within Organizations

With the advent of [organizations](https://docs.lagoon.sh/concepts-basics/building-blocks/organizations/) it requires a little extra work to get the process ready.

1. Create a new user in Lagoon
2. Create an ssh keypair for this user and assign it the key (this can be done in the Lagoon UI in the settings menu, or via the cli)
3. Add this new user to a organization group that has the MAINTAINER role
    * This is required because in migrations you need to be able to specify deploy target rules and switch deploy targets.
4. On projects where you will be migrating, add the private key as a RUNTIME variable called `MIGRATION_SSH_PRIVATE_KEY`
