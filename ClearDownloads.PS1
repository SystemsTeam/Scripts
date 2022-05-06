#This will delete the contents of a users downloads folder that hasn't been used in 14 days
#Because the script opens the downloads folder in a new shell, it needs to be digitally signed, but we can bypass this by setting the execution policy
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
$limit = (Get-Date).AddDays(-14)
$path = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path
# Delete files older than the $limit.
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.LastwriteTime -lt $limit } | Remove-Item -Force
