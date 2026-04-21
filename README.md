#   Windows Dot files!!

### Update powershell
```bash
winget install --id Microsoft.PowerShell --source winget
```
Windows Debloater
```bash
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
```
### Apps
```bash
winget install "RipGrep GNU" fastfetch "Zen Browser" Neovim GlazeWM jtroo.kanata_gui
```

### Kanata
#### Make the directory
```bash
mkdir C:\kanata
```
in
```bash
nvim C:\kanata\kanata.kbd
```
paste this:
```bash
(defcfg)

(defsrc
  caps
)

(defalias
  caps-esc (tap-hold 200 200 esc lctl)
)

(deflayer base
  @caps-esc
)
```
### Create a Shortcut and Startup
`Windows + r`
```bash
shell:startup
```
#### Create Shortcut
> Target
```bash
C:\Users\luisa\AppData\Local\Microsoft\WinGet\Packages\jtroo.kanata_gui_Microsoft.Winget.Source_8wekyb3d8bbwe\kanata_windows_gui_winIOv2_cmd_allowed_x64.exe --cfg "C:\kanata\kanata.kbd"
```


## Task Scheduler is outdated
#### Create Task Scheduler
Automatic Task line:
```bash
schtasks /create /tn "Kanata" /sc onlogon /rl highest /tr "\"C:\Users\luisa\AppData\Local\Microsoft\WinGet\Packages\jtroo.kanata_gui_Microsoft.Winget.Source_8wekyb3d8bbwe\kanata_windows_gui_winIOv2_x64.exe\" --cfg \"C:\kanata\kanata.kbd\"" /f
```

Manual way
program/script
```bash
C:\Users\luisa\AppData\Local\Microsoft\WinGet\Packages\jtroo.kanata_gui_Microsoft.Winget.Source_8wekyb3d8bbwe\kanata_windows_gui_winIOv2_x64.exe
```
Add argument
```bash
--cfg "C:\kanata\kanata.kbd"
```


## Configuring Neovim
Making the config colver
```bash
mkdir $env:LOCALAPPDATA\nvim
```

#### C-compiler
```bash
winget install --id Microsoft.VisualStudio.2022.BuildTools -e --override "--wait --passive --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended"
```

> Open the visual Studio Installer and add the "Desktop development with C++" to the build tool one
- find Build Tools 2022
- click Modify
- check Desktop development with C++
- apply changes

#### Nerd-Font:
Download Link: `https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip`

> have to manually set the font to this one


### Github setup
```bash
git config --global user.name spample
```
```bash
git config --global user.email luis.antonio.gonzalez501@gmail.com
```
```bash
git config --global init.defaultBranch main
```
### Github ssh setup
```bash
eval "$(ssh-agent -s)"
```
```bash
ssh-keygen -t ed25519 -C luis.antonio.gonzalez501@gmail.com
```
```bash
xclip -selection clipboard $HOME/.ssh/id_ed25519.pub 
```
```bash
ssh -T git@github.com
```

## Oh-My-Posh

#### Install
```bash
winget install JanDeDobbeleer.OhMyPosh -s winget
```

#### Ascii ESC convertion
```bash
(Get-Content .\windowsASCII.txt -Raw) -replace '\\e', "`e" | Set-Content logo_fixed.txt -NoNewline
```
