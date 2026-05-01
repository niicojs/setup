# bun
irm bun.sh/install.ps1 | iex

irm https://vite.plus/ps1 | iex

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

vp env default lts

# system settings
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1

# apps
winget install --id=7zip.7zip
winget install --id=Microsoft.PowerShell
winget install --id=Google.Chrome.Beta
winget install --id=Microsoft.VisualStudioCode.Insiders
winget install --id=Starship.Starship
winget install --id=dotPDN.PaintDotNet
winget install --id=Telegram.TelegramDesktop
winget install --id=SST.OpenCodeDesktop
winget install --id=Git.Git
winget install --id=GitHub.GitHubDesktop 
winget install --id=Tailscale.Tailscale
winget install --id=Microsoft.PowerToys

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

# script
bun 02-install.js
