$Shell = New-Object -ComObject Shell.Application
$Global:Recycler = $Shell.NameSpace(0xa)

foreach($item in $Recycler.Items())
{
    $DeletedDate = $Recycler.GetDetailsOf($item,2) -replace "\u200f|\u200e",""
    $dtDeletedDate = get-date $DeletedDate 
    If($dtDeletedDate -lt (Get-Date).AddDays(-14))
    {
        Remove-Item -Path $item.Path -Confirm:$false -Force -Recurse
    }#EndIF
}#EndForeach item