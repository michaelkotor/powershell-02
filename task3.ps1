$logs = Get-EventLog -LogName System -Newest 10

Function GetLogsOfApplication($name) {
    $array = Get-EventLog -LogName Application | Where-Object {$_.Source -eq $name}
    $array > "$name.txt"
    "Total: $($array.Count)" >>  "$name.txt"
}

GetLogsOfApplication "EventSystem"
