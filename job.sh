timestamp=$(date +%d-%m-%Y_%H-%M-%S)
az batch job create \
  --account-name dabosschstoragerepro \
  --account-endpoint dabosschstoragerepro.westeurope.batch.azure.com \
  --template diskspd-job.json