# PSReadLine
Import-Module PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# winget autocomplete
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# posh-git
Import-Module posh-git

# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue

# # posh env
# function Set-EnvVar
# {
#   $p = $executionContext.SessionState.Path.CurrentLocation
#   $osc7 = ""
#   if ($p.Provider.Name -eq "FileSystem")
#   {
#     $ansi_escape = [char]27
#     $provider_path = $p.ProviderPath -Replace "\\", "/"
#     $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
#   }
#   $env:OSC7=$osc7
# }
# New-Alias -Name 'Set-PoshContext' -Value 'Set-EnvVar' -Scope Global -Force

$prompt = ""
function Invoke-Starship-PreCommand {
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.ProviderPath -replace "\\", "/"
        $prompt = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}$ansi_escape\"
    }
    $host.ui.Write($prompt)
}

# scoop autocomplete
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias -Name open -Value explorer
Set-Alias -Name gpg  -Value (join-path (scoop prefix git) 'usr\bin\gpg.exe')

# # omposh
# oh-my-posh init pwsh --config "~/.vbalien.omp.json" | Invoke-Expression

Invoke-Expression (&starship init powershell)
pfetch