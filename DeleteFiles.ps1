cls
$path = Get-Location
$excluded_file = "DoNotDelete.txt"
$flag = 0
$count = 0

function WriteLog{
Param ([String]$LogMsg)
$Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
$LogMessage = "$Stamp :: $LogMsg"
Add-Content $path\log.txt -value $LogMessage
}

$Files = Get-ChildItem -Path $path -File -Recurse -Include *.txt | where{$_.name -ne $excluded_file}
    WriteLog "===========Script Started =======" 
    foreach ($File in $Files){
     $flag = 1
     if ($File -ne $Null){
      Remove-Item $File.FullName -Force -Verbose
      WriteLog "Deleted => $File"
      $count++
     }
   }

   if($flag -eq 0){
    WriteLog "No File To Delete" 
   }

   else{
       WriteLog " Script ended and deleted $count file(s)"
       }
