<# On the first prompt, type "y" and press enter. On the following prompts, type "a" and press enter #>

Write-Host "[ Welcome to the TrudeVim installer for Windows ]" -ForegroundColor Blue

Write-Host "[ Installing Chocolatey ]" -ForegroundColor Blue
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Host "[ Installing Neovim ]" -ForegroundColor Blue
choco install neovim
Write-Host "[ Installing Git ]" -ForegroundColor Blue
choco install git
Write-Host "[ Installing Neovide ]" -ForegroundColor Blue
choco install neovide.install
Write-Host "[ Installing Make ]" -ForegroundColor Blue
choco install make
Write-Host "[ Installing MingW ]" -ForegroundColor Blue
choco install mingw

cls

Write-Host "[ Cloning TrudeVim ]" -ForegroundColor Blue
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
refreshenv

git clone https://github.com/TrudeEH/TrudeVim C:\Users\$env:UserName\TrudeVim

cd C:\Users\$env:UserName\TrudeVim\
mkdir C:\Users\$env:UserName\AppData\Local\nvim
move init.lua C:\Users\$env:UserName\AppData\Local\nvim\
cd ..
Remove-Item "C:\Users\$env:UserName\TrudeVim" -Recurse -Force

nvim
