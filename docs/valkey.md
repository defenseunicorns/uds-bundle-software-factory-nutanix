# Configuration Notes

## ValKey Clustering

In bundle version 0.5.1 Valkey was changed to deploy replicated by default.

To enable/disable clustering and control cluster size - see [gitlab ref arch](https://docs.gitlab.com/ee/administration/reference_architectures/3k_users.html):

| Variable | Default | Description |
| :------- | :------ | :---------- |
| GL_VALKEY_ARCH | `replication` | See options [in the Bitnami chart](https://github.com/bitnami/charts/tree/main/bitnami/valkey/#cluster-topologies) |
| 
| GL_VALKEY_REPLICAS | `3` | Choose any odd number in [3, n] if arch is `replication` not `standalone` |
| GL_VALKEY_SENTINEL | `true` | Enable the deployment of a sentinel if deploying replicated |
| GL_VALKEY_RESOURCES | `{}` | Set resource reservations and limitations |

The following variables were added to help installers direct the valkey cluster nodes (pods) to the desired _cluster_ nodes.

| Variable | Default | Description |
| :------- | :------ | :---------- |
| GL_VALKEY_AFFINITY | `[]` | Valkey pod node affinity |
| GL_VALKEY_NODE_SELECTORS | `[]` | Valkey pod node selectors |
| GL_VALKEY_TOLERATIONS | `[]` | Add node taint tolerations |
