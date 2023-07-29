timestamp=$(date +%d-%m-%Y_%H-%M-%S)
az batch task create \
  --account-name dabosschstoragerepro \
  --account-endpoint dabosschstoragerepro.westeurope.batch.azure.com \
  --task-id $timestamp \
  --job-id diskspd \
  --task-id $timestamp \
  --json-file diskspd-task.json