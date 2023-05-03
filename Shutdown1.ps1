

$action = New-ScheduledTaskAction -Execute "C:\Windows\System32\CMD.exe" -argument '/k shutdown -s -t 172800'
$trigger = New-ScheduledTaskTrigger -AtLogon
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "ShutDown" -Description "Shutdown Test"