# Find the files inside a specific folder
cls
$path = ".\NewFolder"
$excludedFile = "DoNotDelete.txt"


$Files = Get-ChildItem -Path $path -File -Recurse -Include *.txt -Exclude $excludedFile # returns files in that path


if($Files -ne $Null){
foreach($File in $Files){

Remove-Item $File -Force -Verbose

}
}
else{
Write-Host "No File to Delete"
}