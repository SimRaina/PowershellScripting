# Find the files inside a specific folder
cls
$path = ".\NewFolder"


$Files = Get-ChildItem -Path $path -File -Recurse -Include *.txt -Exclude *.log # returns files in that path
echo $Files