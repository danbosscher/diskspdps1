## Powershell script to run Diskspd across Azure Batch nodes

# Variables
$url="https://aka.ms/getdiskspd"
$temp="C:\temp"
$diskspd="C:\diskspd"

# Grab diskspd if not already installed
if (-not(Test-Path -Path $diskspd)) {
    try {
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://aka.ms/getdiskspd","$temp\diskspd.zip")
        Expand-Archive -LiteralPath $temp\diskspd.zip -DestinationPath $diskspd
    }
}

# Delete old test file if present
if (Test-Path -Path $temp\test.dat) {
    Remove-Item -Path $temp\test.dat
    Write-Output "This is an existing node"
}
else {
    Write-Output "This is a new node"
}

# Run diskspd
$diskspd\amd64\diskspd.exe -d300 -W15 -C15 -L -r -w40 -t8 -b64K -Su -c10G $temp\test.dat