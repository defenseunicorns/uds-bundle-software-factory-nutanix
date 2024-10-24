# Configuration Notes

Collected notes to aid in configuring GitLab for your environment.

## Sharded Gitaly

[Gitaly](https://docs.gitlab.com/ee/administration/gitaly/), the git server inside GitLab, has a few HA configurations. The Gitaly cluster (where multiple Gitaly nodes are clustered together, each one as the sole-tenant on a server/VM) is the recommended approach but is not supported on k8s (see [epic](https://gitlab.com/groups/gitlab-org/-/epics/6127) for more details). Sharded Gitaly does work on k8s though. With Gitaly sharded, the gitaly statefulset will increase it's number of replicas with each one becoming a different storage path for GitLab.Per the weights set by the operator in the GitLab UI, GitLab will roll-the-dice to determine which gitaly recieves each repo as it's created. It will be on operators to tell GitLab what weight to give each instance and to move busy repos off nodes which are overwhelmed with busy-bodies onto nodes which are quieter. Read about [Gitaly capabilities](https://docs.gitlab.com/ee/administration/gitaly/gitaly_geo_capabilities.html#gitaly-capabilities) for more information on the trade-offs and risks between Gitaly Clusters and Gitaly Shards.

To increase the number of Gitaly shards edit the value of the GITALY_SHARD_NAMES variable in your uds-config file. The first shard must always be named `default` to avoid problems with the upgrade. Beyond that, they can be named anything. If you are adding or dropping shards, be aware you must manually move repos onto the new shard or off the old shard first. Helm has no built-in repo migrator.
