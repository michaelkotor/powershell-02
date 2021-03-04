$computerName = Get-CimInstance -ClassName Win32_ComputerSystem
$hardDriveInfo = Get-WmiObject -Class Win32_logicaldisk


# I didn't use WMI object, because it shows 0, because the value is too small
$totalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum

$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$cpuTime = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
$availMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
$result = $date + ' > CPU: ' + $cpuTime.ToString("#,0.000") + '%, Avail. Mem.: ' + $availMem.ToString("N0") + 'MB (' + (104857600 * $availMem / $totalRam).ToString("#,0.0") + '%)'

$filename = ".\Info.txt"
$computerName.Name >> $filename
$hardDriveInfo >> $filename
$totalRam >> $filename
$result >> $filename