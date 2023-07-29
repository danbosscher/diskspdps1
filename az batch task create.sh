timestamp=$(date +%d-%m-%Y_%H-%M-%S)
az batch task create \
  --account-name dabosschstoragerepro \
  --account-endpoint dabosschstoragerepro.westeurope.batch.azure.com \
  --task-id $timestamp \
  --job-id DiskSpdJob \
  --command-line "powershell -command (iex ((new-object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/danbosscher/diskspdps1/main/main.ps1')))" \
