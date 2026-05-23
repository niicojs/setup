# bun

irm bun.sh/install.ps1 | iex

# vite-plus, node, pnpm

New-Item -Path "d:\.bin" -Type Directory
$env:VP_HOME = "D:\.bin\.vite-plus"
$env:PNPM_HOME = "D:\.bin\.pnpm"
[Environment]::SetEnvironmentVariable('VP_HOME',$env:VP_HOME,[EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable('PNPM_HOME',$env:PNPM_HOME,[EnvironmentVariableTarget]::User)

irm https://vite.plus/ps1 | iex

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

vp env default lts

# system settings

$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
Set-ItemProperty $key ShowSuperHidden 1

# Explorer: Disable creating Thumbs.db files on network volumes: Enable: 0, Disable: 1
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "DisableThumbnailsOnNetworkFolders" 1
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" 0 # Widgets


# Uninstall Bing Finance
Get-AppxPackage "Microsoft.BingFinance" -AllUsers | Remove-AppxPackage -AllUsers
Get-AppXProvisionedPackage -Online | Where DisplayName -like "Microsoft.BingFinance" | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null

# Uninstall Bing News
Get-AppxPackage "Microsoft.BingNews" -AllUsers | Remove-AppxPackage -AllUsers
Get-AppXProvisionedPackage -Online | Where DisplayName -like "Microsoft.BingNews" | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null

# Uninstall Bing Sports
Get-AppxPackage "Microsoft.BingSports" -AllUsers | Remove-AppxPackage -AllUsers
Get-AppXProvisionedPackage -Online | Where DisplayName -like "Microsoft.BingSports" | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null

# Uninstall Bing Weather
Get-AppxPackage "Microsoft.BingWeather" -AllUsers | Remove-AppxPackage -AllUsers
Get-AppXProvisionedPackage -Online | Where DisplayName -like "Microsoft.BingWeather" | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null

# Uninstall Get Office, and it's "Get Office365" notifications
Get-AppxPackage "Microsoft.MicrosoftOfficeHub" -AllUsers | Remove-AppxPackage -AllUsers
Get-AppXProvisionedPackage -Online | Where DisplayName -like "Microsoft.MicrosoftOfficeHub" | Remove-AppxProvisionedPackage -Online -AllUsers | Out-Null



# apps

winget install -e --id Microsoft.WindowsTerminal
winget install -e --id=7zip.7zip
winget install -e --id=Microsoft.PowerShell
winget install -e --id=Google.Chrome.Beta
winget install -e --id=Microsoft.VisualStudioCode.Insiders
winget install -e --id=Starship.Starship
winget install -e --id=dotPDN.PaintDotNet
winget install -e --id=Telegram.TelegramDesktop
winget install -e --id=SST.OpenCodeDesktop
winget install -e --id=Git.Git
winget install -e --id=GitHub.GitHubDesktop 
winget install -e --id=Tailscale.Tailscale
winget install -e --id=Microsoft.PowerToys

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

git config --global core.autocrlf true

vp i

# script
node ./02-install.ts

Install-WindowsUpdate -acceptEula
