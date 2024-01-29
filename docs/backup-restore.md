# Backup and Restore

## Gitlab
# Backup
Gitlab is configured to take automatic backups and store those backups to the configured object storage bucket.

- If desired, you can manually trigger a backup by triggering the Kubernetes CronJob that is used for the automated backups.
CLI:
```bash
kubectl create job -n gitlab \
  --from=cronjob/gitlab-toolbox-backup \
  gitlab-toolbox-backup
```

K9s:
![Gitlab Backup Cron Trigger](screenshots/gitlab-k9s-backup-cron.png)

# Restore
- Retrieve the filename of the desired backup from the configured gitlab-backup object storage bucket. Everything up through the `ee`.
- Using the `backup-utiliity` in the gitlab-toolbox pod along with the filename of the backup you can initiate a restore. Example kubectl command below.
```bash
kubectl exec -it -n gitlab deploy/gitlab-toolbox -- /bin/bash -c \
        "backup-utility --restore -t 1702938944_2023_12_18_16.5.1-ee"
```
- Cycle the gitlab-runner pod once restore is complete.

# Databases
It is recommended to use the native database backup tools provided by your database provider to create your backups and create a new restored DB to switch to.

[Nutanix NDB](https://portal.nutanix.com/page/documents/solutions/details?targetId=BP-2061-PostgreSQL-on-Nutanix:BP-2061-PostgreSQL-on-Nutanix)

[AWS RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_CommonTasks.BackupRestore.html)

Once you have the desired DB with the restored data live and ready you can update your `uds-config.yaml` to point to this new restored DB and run a `uds deploy <bundle>` to update the cluster.

# Velero
Apps like Jira and Confluence require you to backup the local or shared home directory. This bundle has Velero configured to backup persistent volumes which contain this data. To perform a restore you will want to get the name of the velero backup you want to use for your restore and perform a velero restore for the relevant namespace.

Example command to start a velero restore for a namespace:
```bash
kubectl exec -it -n velero svc/velero-velero -- /bin/bash -c \
    "velero restore create my-confluence-restore-$(date +%s)  \
    --from-backup velero-velero-uds-confluence-backup-20240129050033 --include-namespaces confluence --wait"
```



