# Find the files inside a specific folder
cls
$path = ".\NewFolder"
$parentpath = Get-Location
$excludedFile = "DoNotDelete.txt"
$count = 0

function WriteLog{
Param ($Message)

$Date = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
$LogMessage = "$Date : $Message"
Add-Content -path $parentpath\log.txt -value  $LogMessage
}

$Files = Get-ChildItem -Path $path -File -Recurse -Include *.txt -Exclude $excludedFile # returns files in that path

WriteLog "==============Script Started=============="
if($Files -ne $Null){
foreach($File in $Files){

Remove-Item $File -Force -Verbose
WriteLog "Deleted => $File" 
$count+=1
}
WriteLog "Script ended and deleted $count file(s)==========="

}
else{
WriteLog "Script ended and found no files to Delete==========="
}