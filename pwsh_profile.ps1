# PowerShell profile
# Load by dot sourceing it from one of the system profile scripts
# e.g. $PROFILE or $PROFILE.CurrentUserAllHosts (C:\Users\<user>\Documents\PowerShell\profile.ps1):
#
# $p = Join-Path $HOME "dotfiles/pwsh_profile.ps1"
# if (Test-Path -Path $p) {
#    . $p
# }

$env:DOTNET_CLI_TELEMETRY_OPTOUT = 1

# Make interactive consoles fancy
if ($host.Name -eq 'ConsoleHost') {

    Set-Alias -Name l -Value Get-ChildItem

    # Show icons in Get-ChildItem
    # > Install-Module -Name Terminal-Icons -Repository PSGallery
    Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue

    # Predictive promt
    # > Install-Module PSReadLine
    Import-Module PSReadLine
    
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView
    Set-PSReadLineOption -EditMode Windows

    if (Get-Command "starship" -ErrorAction SilentlyContinue) {
        $ENV:STARSHIP_CONFIG = "$HOME/dotfiles/starship.toml"
        Invoke-Expression (&starship init powershell)
    }
}




