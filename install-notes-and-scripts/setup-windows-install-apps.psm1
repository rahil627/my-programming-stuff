$apps_to_try =  @( # array
    # TODO: try in sandboxie

    "SomePythonThings.WingetUIStore"
    "GitHub.GitHubDesktop" # compare with github cli
    "Microsoft.PCManager"

    # dendron is a vs-code extension
    "Obsidian.Obsidian"
    "Joplin.Joplin"

    "appmakes.Typora"
)

$apps = @{ # enum won't work, and psobject seems like a hassle
    # software needed to run apps
    dotnet_framework = "Microsoft.dotNetFramework" # needed for powershell lsp
    vcpp_restributable = "Microsoft.VCRedist.2015+.x64"

    # OS essentials
    shell = "Microsoft.Powershell"
    # 260mb!
    # currently need it to remap caps lock to escape (at the OS level)
    # "fancy zones" window manager looks great too!
    # a windows shortcuts cheatsheet too!
    # there's actually a lot of gui goodies in here...
    powertoys = "Microsoft.PowerToys" # couldn't use enum because label has a '.' in it
    #media_player = "VideoLAN.VLC" # also hash keys can't have a '-' in it

    # essential apps
    simple_gui_text_editor = "SublimeHQ.SublimeText" # todo: --include-unknown
    terminal_text_editor = "Helix.Helix"
    dropbox = "Dropbox.Dropbox"
    # todo: choose a browser
    browser = "eloston.ungoogled-chromium" # with uBlock
    # setup_browser
    # brave # comes with adblocker, privacy, etc.
    # cromite
    # librewolf or betterfox # firefox with sane defaults
    spotify = "Spotify.Spotify"
    discord = "Discord.Discord" #"SlackTechnologies.Slack"
    #Telegram.TelegramDesktop # just use phone app
    #Microsoft.Skype

    steam = "Valve.Steam"

    # programming-related
    powershell = "Microsoft.Powershell" # strangely, windows 11 ships with v1, currently at v7!!
    # make it the default terminal
    #   - open terminal -> click on the down-arrow near new tab location -> set startup/default profile
    # todo: no way to do this via command line? :/
    # TODO: try vscodium
    #vscode = "Microsoft.VisualStudioCode"
    git = "Git.Git" #winget install --id Git.Git -e --source winget # TODO: what's the -e flag?


    #tightnvc?

 } #| foreach {winget install -e --id $_}

# example use:
# install_app($apps.shell)
function install_app($id) { # restriction: '-' is a special char for powershell commands
    winget install --id $id --source winget # store string to avoid command substitution
    # without id, i think it will search by default and run into multiple choices/sources
    # with --source winget, can consistently upgrade all apps via "winget --upgrade" instead of the windows store
}

function install_all_apps($apps) { # todo: is this casting a dynamic var?
    foreach ($app in $apps) {
        install-app($app); # app.ToString() by default
    }
}

