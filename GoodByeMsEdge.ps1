if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
     $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
     Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
     Exit
    }
   }
taskkill /f /im msedge.exe
Start-Sleep 1
takeown /a /r /d Y /f "C:\Program Files (x86)\Microsoft\Edge"
takeown /a /r /d Y /f "C:\Program Files (x86)\Microsoft\EdgeUpdate"
takeown /a /r /d Y /f "C:\Program Files (x86)\Microsoft\EdgeCore"
Remove-Item  -Recurse -Force "C:\Program Files (x86)\Microsoft\Edge"
Remove-Item  -Recurse -Force "C:\Program Files (x86)\Microsoft\EdgeUpdate"
Remove-Item  -Recurse -Force "C:\Program Files (x86)\Microsoft\EdgeCore"
Write-Output "Microsoft Edge has been uninstalled until the next update. Enjoy!"
Start-Sleep 1
