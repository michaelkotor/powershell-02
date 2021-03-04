$action = New-ScheduledTaskAction -Execute "notepad.exe"
$trigger = New-ScheduledTaskTrigger -Once -At 3PM

Register-ScheduledTask MyTask  -Action $action -Trigger $trigger -TaskName "Notepad task"

