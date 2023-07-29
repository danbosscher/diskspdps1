## Powershell script to run Diskspd across Azure Batch nodes
## https://github.com/danbosscher/diskspdps1

# Variables
# Grab diskspd if not already installed
if (-not(Test-Path -Path C:\diskspd)) {
    try {
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://aka.ms/getdiskspd","C:\temp\diskspd.zip")
        Expand-Archive -LiteralPath C:\temp\diskspd.zip -DestinationPath C:\diskspd
    }
    catch {
        Write-Output "Error downloading or extracting diskspd archive: $_"
        exit 1
    }
}

# Delete old test file if present
if (Test-Path -Path C:\temp\test.dat) {
    try {
        Remove-Item -Path C:\temp\test.dat
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
C:\diskspd\amd64\diskspd.exe -d10 -W15 -C15 -L -r -w40 -t8 -b64K -Su -c10G C:\temp\test.dat