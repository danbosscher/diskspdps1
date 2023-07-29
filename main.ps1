## Powershell script to run Diskspd across Azure Batch nodes
## https://github.com/danbosscher/diskspdps1

# Variables
$url="https://aka.ms/getdiskspd"
$temp="C:\temp"
$diskspddir="C:\diskspd"
$diskspdexe="C:\diskspd\amd64\diskspd.exe"

# Grab diskspd if not already installed
if (-not(Test-Path -Path $diskspd)) {
    try {
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://aka.ms/getdiskspd","$temp\diskspd.zip")
        Expand-Archive -LiteralPath $temp\diskspd.zip -DestinationPath $diskspd
    }
    catch {
        Write-Output "Error downloading or extracting diskspd archive: $_"
        exit 1
    }
}

# Delete old test file if present
if (Test-Path -Path $temp\test.dat) {
    try {
        Remove-Item -Path $temp\test.dat
    }
    catch {
        Write-Output "Error removing old test file: $_"
        exit 1
    }
    Write-Output "This is an existing node"
}
else {
    Write-Output "This is a new node"
}

# Run diskspd
$diskspdexe -d10 -W15 -C15 -L -r -w40 -t8 -b64K -Su -c10G $temp\test.dat