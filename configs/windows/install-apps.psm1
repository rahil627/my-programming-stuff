# just install apps, setup/load configs with another script

# winget >= msstore
# msstore requires signing into microsoft
# msstore used to require msix installers, which where standard/cleaner (kinda sandboxed), but now they accept everything
# with winget, can update all packages via "winget --upgrade" as opposed to using the microsoft store/windows settings gui
# it's more likely the open-source community are better at keeping packages up-to-date over msstore's small team
# given that i'm aiming for more privacy, alternative apps (ungoogled chromium, vscodium) will never exist on msstore
# from a comment on reddit: "I always use winget. Store versions aren't always current. Not sure if they get auto updated, as it's not installing them via the store, just using the store's repository. I also skip the store version because you have to be signed in to use it and I use this on machines that aren't tied to an MS account. They're definitely not sandboxed."

# https://winstall.app/
# simple site to search through winget repos

$apps_to_try =  @( # array
    # TODO: try in windows sandbox/sandboxie

    # TODO: move taskbar to the side
    # ..wtf. microsoft
    # https://github.com/valinet/ExplorerPatcher
    #  - reddit says this has it, but may be buggy

    # TODO: research launcher software like Enso from wayyyy back
    # https://github.com/microsoft/PowerToys/issues/20825
    # powertoys run (fork of wox), flow.launcher (C#), wox (not well maintained, cross-platform)
    # https://github.com/hlaueriksson/awesome-powertoys-run-plugins
    #  - everything plugin for powertoys run

    "SublimeHQ.SublimeText" # TODO: --include-unknown

    "SomePythonThings.WingetUIStore"
    "GitHub.GitHubDesktop" # compare with vs-code
    "Microsoft.PCManager"

    # dendron is a vs-code extension
    "Obsidian.Obsidian"
    #"Logseq.Logseq"
    #"Joplin.Joplin"

    "appmakes.Typora"
)

$apps = @{ # enum won't work, and psobject seems like a hassle

    # windows 11 pro?
    # only adds features aimed at businesses except for these important ones:
    # windows sandbox, windows remote desktop, hyper-v, bitlocker
    # alternatives exist for all of them: sandboxie, anydesk/etc., virtualbox/vmware/etc., something
    # but it's nice to have these features *just work*
    # ~$35 new with dvd or ~$25 for a "retail key", def worth the price!

    # OS essentials
    shell = "Microsoft.Powershell"

    # otherwise find some cheap keys on ebay for 'eset nod32'
    # https://old.reddit.com/r/antivirus/wiki/index#wiki_anti-virus_.28aka_anti-malware.29_developers
    # conclusion from reddit as of 2024: windows defender or bitdefender free or eset nod32 [paid]
    # note: kaspersky, the best free lightweight av, is gone now due to political reasons
    # bitdefender uses a bunch of ram (200-700mb of 16gb), but hopefully less cpu because of it
    # eset nod32 is much lighter on resources
    # eset keys can be found online quite cheap ($16/year), but then it's another thing to worry about..
    # windows defender is actually good now, though just as resource-hungry as bitdefender and with windows sandbox, might be all you need
    # can use another tool to configure windows defender more
    anti_virus = "Bitdefender.Bitdefender"
    # TODO: automate this, or does it save to app settings/windows backup?
    # settings -> turn off recommendation notifications and special offers

    # 260mb!
    # currently need it to remap caps lock to escape (at the OS level)
    # "fancy zones" window manager looks great too!
    # a windows shortcuts cheatsheet too!
    # there's actually a lot of gui goodies in here...
    powertoys = "Microsoft.PowerToys" # couldn't use enum because label has a '.' in it
    #media_player = "VideoLAN.VLC" # also hash keys can't have a '-' in it

    # software needed to run apps
    dotnet_framework = "Microsoft.dotNetFramework"
    vcpp_restributable = "Microsoft.VCRedist.2015+.x64"

    # essential apps
    #simple_gui_text_editor = "SublimeHQ.SublimeText"
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
    #vscode = "Microsoft.VisualStudioCode"
    vscode = "VSCodium.VSCodium" # works the same!, just extensions rely on people  adding them to a list
    git = "Git.Git" #winget install --id Git.Git -e --source winget # TODO: what's the -e flag?
    lazygit = "JesseDuffield.lazygit" # TODO vs magit
    
    # more dev specific
    erlang = "Erlang.ErlangOTP" # for elixir
    sql = "postgresql" # TODO: add install by search, add --source winget
    # "PostgreSQL.PostgreSQL 16"

    #tightnvc?

 } #| foreach {winget install -e --id $_}

# example use:
# install_app($apps.shell)
function install_app($id) { # restriction: '-' is a special char for powershell commands
    $output = winget install --id $id --source winget # store string to avoid command substitution
    # without id, i think it will search by name by default and run into multiple choices/sources
    # with --source winget, can consistently upgrade all apps via "winget --upgrade" instead of the windows store

    # if package exists, do nothing

    # if no id, use name/string to search for package and install
    if ($output -match "No package found matching input criteria." ) {
        winget install --name $id --source winget

        # if multiple packages exist, do nothing
    }


}

function install_apps($apps) { # todo: is this casting a dynamic var?
    foreach ($app in $apps) {
        install-app($app); # app.ToString() by default
    }
}

# main script
function install_all_apps() {
    install_apps($apps)
}
