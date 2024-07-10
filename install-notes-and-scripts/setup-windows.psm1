# windows 11

# don't need this so much since windows store is the ui for this

# also doubles as a test of powershell dev (vs ruby)

# put this script into memory
# (automatically exports/imports functions to current session of powershell)
# If a script module does not include an Export-ModuleMember command, the functions and aliases in the script module are exported, but the variables are not. When a script module includes Export-ModuleMember commands, only the members specified in the Export-ModuleMember commands are exported. You can also use Export-ModuleMember to suppress or export members that the script module imports from other modules.
# An Export-ModuleMember command is optional, but it is a best practice. Even if the command confirms the default values, it demonstrates the intention of the module author.
# import-module .\setup-windows.psm1
# then you can run any function
# typing $apps in powershell will cleanly print-out the object




# some inspiration
# https://gist.github.com/brandonkal/0ababb7eaf65e97234b21d50c88edce8
# https://github.com/Kugane/winget
# todo: debloat windows 11
# https://gist.github.com/kid1412621/e9bafc5362acbded0f6b726402c40d62
#  - oh my posh?
#  - register autocomplete stuff for .net?
#  - set some basic aliases
#  - TODO: can try to mix linux and windows, getting the best of both worlds
# https://gist.github.com/Code-Quake/ff3e25da5f7585a803e2d757bb2c3aac
#  - this one looks good


# TODO: download and install winget package manager
# https://github.com/microsoft/winget-cli/releases/latest
# TODO: copy/pasta a script to install it
# TODO: dunno about chocolatey 'n other package managers...


# app sources
# https://github.com/PSGitHubUser1/Windows-Essentials-Apps-Installer/blob/main/wea-v1.3/weai/wea_installer_v1.3_RUN-AS-ADMIN.cmd

# instead of writing a script, put things into objects
# then can run it interactively

$apps_to_try =  @( # array
    "Microsoft.PowerToys" # couldn't use enum because label has a '.' in it
    "SomePythonThings.WingetUIStore"
    "GitHub.GitHubDesktop"
    "Microsoft.PCManager"

    "Obsidian.Obsidian"
    "Joplin.Joplin"
    
    "appmakes.Typora"
)

$apps = @{ # enum won't work, and psobject seems like a hassle
    dropbox = "Dropbox.Dropbox"
    # todo: choose a browser
    browser = eloston.ungoogled-chromium # with uBlock
    # setup_browser
    # brave # comes with adblocker, privacy, etc.
    # thorium # maintained by one person
    # cromite
    # librewolf or betterfox # firefox with sane defaults
    spotify = "Spotify.Spotify"
    discord = "Discord.Discord" #"SlackTechnologies.Slack"
    #Telegram.TelegramDesktop # just use phone app
    #Microsoft.Skype

    steam = "Valve.Steam"

    media_player = "VideoLAN.VLC"

    powershell = "Microsoft.Powershell" # strangely, windows 11 ships with v1, currently at v7!!
    # make it the default terminal
    #   - open terminal -> click on the down-arrow near new tab location -> set startup/default profile
    # todo: no way to do this via command line? :/
    vscode = "Microsoft.VisualStudioCode"
    dotnet_framework = "Microsoft.dotNetFramework" # needed for powershell lsp
    git = "Git.Git" #winget install --id Git.Git -e --source winget


    #tightnvc?

 } #| foreach {winget install -e --id $_}

function install_app($id) { # restriction: '-' is a special char for powershell commands
    $cmd = "winget install --id "+$id # store string to avoid command substitution
    # without id, i think it will run into multiple choices/sources
    # todo: --source winget
    Invoke-Expression -Command $cmd
}

function install_all_apps($apps) { # todo: is this casting a dynamic var?
    foreach ($app in $apps) {
        install-app($app); # app.ToString() by default
    }
}

function setup_shell {
    #Microsoft.Powershell # strangely, windows 11 ships with v1, currently at v7!!
    # make it the default terminal
    #   - open terminal -> click on the down-arrow near new tab location -> set startup/default profile
    # todo: no way to do this via command line? :/
    Invoke-Expression -C "update-help";
    # todo: catch error then try
    #Invoke-Expression -C "Update-Help -Verbose -Force -ErrorAction SilentlyContinue"

}

function setup_git {
    Invoke-Expression -C git config --global user.name "ra"
    Invoke-Expression -C git config --global user.email rahil627@gmail.com
}

function setup_browser {
    # copy ungoogled chromium settings?
    #   - https://superuser.com/questions/149032/where-is-the-chrome-settings-file
    #   - file:///C:/Users/rahil/AppData/Local/Chromium/User%20Data/Default/Preferences
    #   - a giant json file, may have to do it manually :/
    #   - i don't even see the search engine setting
    # startpage as default search engine (delete others)
    #  - an ungoogled google search engine
    # follow instructions on the first screen to set up a way to install apps from the chrome web store
    # uBlock origin
}

function install_winget {
    #Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
    $hasPackageManager = Get-AppPackage -name 'Microsoft.DesktopAppInstaller'
    if (!$hasPackageManager -or [version]$hasPackageManager.Version -lt [version]"1.10.0.0") {
        "Installing winget Dependencies"
        Add-AppxPackage -Path 'https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx'

        $releases_url = 'https://api.github.com/repos/microsoft/winget-cli/releases/latest'

        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $releases = Invoke-RestMethod -uri $releases_url
        $latestRelease = $releases.assets | Where { $_.browser_download_url.EndsWith('msixbundle') } | Select -First 1

        "Installing winget from $($latestRelease.browser_download_url)"
        Add-AppxPackage -Path $latestRelease.browser_download_url
    }
    else {
        "winget already installed"
    }
}

# by default all functions and aliases are exported into current session of powershell
#Export-ModuleMember -Function install-everything
# export everything
# https://stackoverflow.com/questions/73215604/how-to-export-variables-from-a-powershell-module
Export-ModuleMember -Function * -Alias * -Variable *

