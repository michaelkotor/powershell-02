$url = "https://download.sysinternals.com/files/Handle.zip"

Invoke-WebRequest -Uri $url -OutFile ".\file.zip"

Expand-Archive -LiteralPath '.\file.zip' -DestinationPath ".\app" -force

.\app\handle64.exe "-accepteula" > "result.txt"