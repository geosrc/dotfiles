# PowerShell profile
# Load by dot sourceing it from one of the system profile scripts
# e.g. $PROFILE or $PROFILE.CurrentUserAllHosts (C:\Users\<user>\Documents\PowerShell\profile.ps1):
#
# $p = Join-Path $HOME "dotfiles/pwsh_profile.ps1"
# if (Test-Path -Path $p) {
#    . $p
# }

Set-Alias -Name l -Value Get-ChildItem
$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1

# Make interactive consoles fancy
if ($host.Name -eq 'ConsoleHost') {

    # Show icons in Get-ChildItem
    # > Install-Module -Name Terminal-Icons -Repository PSGallery
    if (Get-Module -ListAvailable -Name Terminal-Icons) {
        Import-Module -Name Terminal-Icons
    }
    # else {
    #     Write-Host -ForegroundColor Red "`u{f00d}"
    # }

    # Predictive promt
    # > Install-Module PSReadLine
    if (Get-Module -ListAvailable -Name PSReadLine) {
        Import-Module PSReadLine
        Set-PSReadLineOption -PredictionSource History
        Set-PSReadLineOption -PredictionViewStyle ListView
        Set-PSReadLineOption -EditMode Windows
    }

    # Load oh-my-posh with custom theme
    # Install from https://ohmyposh.dev:
    # > winget install JanDeDobbeleer.OhMyPosh -s winget
    # or
    # > Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
    # Requires https://www.nerdfonts.com/ and the new AtlasEngine in Terminal.app to work
    if (Get-Command "oh-my-posh" -ErrorAction SilentlyContinue) 
    {
        oh-my-posh init pwsh --config "$HOME/dotfiles/fabian.omp.json" | Invoke-Expression
    }
}




