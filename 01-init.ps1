# bun
irm bun.sh/install.ps1 | iex

# pnpm and node
Invoke-WebRequest https://get.pnpm.io/install.ps1 -UseBasicParsing | Invoke-Expression

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

pnpm env use --global lts

# system settings
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1

# apps
winget install --id=Microsoft.PowerShell
winget install --id=Google.Chrome.Beta
winget install vscode
winget install --id=Starship.Starship
winget install --id=dotPDN.PaintDotNet
winget install --id=Telegram.TelegramDesktop
winget install --id=SST.opencode
winget install --id=Git.Git
winget install --id=GitHub.GitHubDesktop

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

# script
bun 02-install.js
