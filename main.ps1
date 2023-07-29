$client = new-object System.Net.WebClient
$client.DownloadFile("https://aka.ms/getdiskspd","C:\temp\diskspd.zip")
Expand-Archive -LiteralPath C:\temp\diskspd.zip -DestinationPath C:\diskspd
C:\diskspd\amd64\diskspd.exe -d300 -W15 -C15 -L -r -w40 -t8 -b64K -Su -c10G C:\temp\test.dat