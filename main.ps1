$client = new-object System.Net.WebClient
$client.DownloadFile("https://aka.ms/getdiskspd","C:\temp\diskspd.zip")
Expand-Archive -LiteralPath C:\temp\diskspd.zip -DestinationPath C:\diskspd
C:\diskspd\diskspd.exe -t2 -o32 -b4k -r4k -w0 -d120 -Sh -D -L -c5G
