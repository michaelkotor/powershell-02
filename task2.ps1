Get-Service | Where-Object {$_.Status -eq "Running"} > "running.txt"
Get-Service | Where-Object {$_.Status -eq "Stopped"} > "stopped.txt"

Function FindByName($name) {
    $service = Get-Service | Where-Object {$_.Name -eq $name}
    Write-Host $service
}