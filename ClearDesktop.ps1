Write-Host "Welcome to the archive example"  
#Give the location of folder from which files should be deleted 
$path = [Environment]::GetFolderPath('Desktop')  
$DaysTOBeArchived = "-1"  
## Files which were modified before three days will be deleted. 
$CurrentDate = Get-Date  
$DatetoBeDeleted = $CurrentDate.AddDays(-$DaysTOBeArchived)  
$files=Get-ChildItem $path -Recurse | Where-Object { $_.LastWriteTime -lt $DatetoBeDeleted }  
Foreach ($file in $files){ 
Remove-Item $file.FullName |out-null 
Write-Host "Cleared the file "$file }
