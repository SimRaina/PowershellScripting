cls  # clear console output screen
$path = Get-Location  # returns curent path of the script
echo $path

# Check if a folder exist. If not then create it.

$foldertocheck = ".\NewFolder" # $foldertocheck = "$path\NewFolder"

if(Test-Path $foldertocheck){
  Write-Host "Folder exist"
}

else{
 New-Item $foldertocheck -ItemType Directory
 Write-Host "Folder Created" 
}