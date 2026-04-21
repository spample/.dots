#######################################
#  PROMPT & STARTUP
#######################################

oh-my-posh init pwsh --config "C:\Users\luisa\.dots\ohmyposh\spample-theme.json" | Invoke-Expression
fastfetch


#######################################
#  HISTORY / SHELL QUALITY
#######################################

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode Windows

# Bash-like word movement
Set-PSReadLineKeyHandler -Chord Alt+b -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Alt+f -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function ForwardWord
Set-PSReadLineKeyHandler -Chord Delete -Function DeleteChar
Set-PSReadLineKeyHandler -Chord Ctrl+Delete -Function KillWord
Set-PSReadLineKeyHandler -Chord Alt+d -Function KillWord



#######################################
#  ALIASES / SIMPLE FUNCTIONS
#######################################
Remove-Item Alias:clear -ErrorAction SilentlyContinue
Remove-Item Alias:cls -ErrorAction SilentlyContinue

function global:Clear-Host {
    [System.Console]::Clear()
    fastfetch
}

Set-Alias clear Clear-Host
Set-Alias cls Clear-Host



function c {
    Clear-Host
}

function vim {
    nvim @args
}

function vi {
    nvim @args
}

function .. {
    Set-Location ..
}

function ... {
    Set-Location ../..
}

function .... {
    Set-Location ../../..
}

function touch {
    param([string]$File)

    if (-not $File) { return }

    if (Test-Path $File) {
        (Get-Item $File).LastWriteTime = Get-Date
    } else {
        New-Item -ItemType File -Path $File | Out-Null
    }
}

function which {
    param([string]$Name)
    Get-Command $Name | Select-Object Name, Source
}


#######################################
#  AUTO-LS STYLE CD
#######################################

function cdl {
    param([string]$Path = $HOME)
    Set-Location $Path
    Get-ChildItem
}

# Optional: make cd auto-list like your zsh function
function cd {
    param(
        [Parameter(ValueFromRemainingArguments = $true)]
        $Path
    )

    if ($null -eq $Path -or $Path.Count -eq 0) {
        Microsoft.PowerShell.Management\Set-Location $HOME
    } else {
        Microsoft.PowerShell.Management\Set-Location @Path
    }

    Get-ChildItem
}



