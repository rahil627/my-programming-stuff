# just install apps, setup/load configs with another script

# winget >= msstore
# msstore requires signing into microsoft
# msstore used to require msix installers, which where standard/cleaner (kinda sandboxed), but now they accept everything
# with winget, can update all packages via "winget --upgrade" as opposed to using the microsoft store/windows settings gui
# it's more likely the open-source community are better at keeping packages up-to-date over msstore's small team
# given that i'm aiming for more privacy, alternative apps (ungoogled chromium, vscodium) will never exist on msstore
# from a comment on reddit: "I always use winget. Store versions aren't always current. Not sure if they get auto updated, as it's not installing them via the store, just using the store's repository. I also skip the store version because you have to be signed in to use it and I use this on machines that aren't tied to an MS account. They're definitely not sandboxed."

# scoop > winget?
# TODO: when to install using scoop vs winget?
# scoop seems great for dev stuff, as it creates aliases ("shims") for you

# https://winstall.app/
# simple site to search through winget repos

# TODO: prioritize scoop > winget (i think chocolatey is deprecated)

$apps_to_try =  @{ # hash-table
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

    winget_ui = "SomePythonThings.WingetUIStore"
    pc_manager = "Microsoft.PCManager"

    # dendron is a vs-code extension
    obsidian = "Obsidian.Obsidian"
    #"Logseq.Logseq",
    #"Joplin.Joplin",

    writing_text_editor = "appmakes.Typora"
}


# TODO: combine the following two data structures into a single hash-table named $apps
# winget app ids
$apps = @{ # hash-table; enum won't work, and psobject seems like a hassle

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
    
    # NOTE: text editors installed via scoop
    
    dropbox = "Dropbox.Dropbox"
    # TODO: clean up other cloud storages, use as backup for dropbox
    google_drive = "Google.GoogleDrive"
    # apple
    # microsoft?

    browser = "eloston.ungoogled-chromium" # with uBlock
    # setup_browser
    # other options to try:
    # brave # comes with adblocker, privacy, etc.
    # cromite
    # librewolf or betterfox # firefox with sane defaults
    spotify = "Spotify.Spotify"
    discord = "Discord.Discord" #"SlackTechnologies.Slack"
    # signal = "OpenWhisperSystems.Signal" # just use phone app
    # facebook-messenger

    steam = "Valve.Steam"

    # TODO: to automation.txt
    # https://www.reddit.com/r/ifttt/comments/ixy5ke/ifttt_alternatives_if_you_cant_afford_to_pay/
    # find some IFTTT-like work-flow cloud service automation software
    # power automate eating up battery, 40 minutes!
    # it also simply doesnut work: error upon startup
    # also has a steep learning curve
    # automation = "power automate"
    # try n8n instead, itus free, open-source, can self-host, has hosted version
    # nvm, cheapest plan is $20/month! must self-host
    # seems quite complicated compared to IFTTT :/
    # for now, try rclone to sync cloud storages

    # shell
    # (install cli-apps with scoop)
    powershell = "Microsoft.Powershell" # strangely, windows 11 ships with v1, currently at v7!!
    # make it the default terminal
    #   - open terminal -> click on the down-arrow near new tab location -> set startup/default profile
    # todo: no way to do this via command line? :/

    # programming-related
    #vscode = "Microsoft.VisualStudioCode",
    vscode = "VSCodium.VSCodium" # works the same!, just extensions rely on people  adding them to a list
    git = "Git.Git" #winget install --id Git.Git -e --source winget # TODO: whatjs the -e flag?
    github = "GitHub.GitHubDesktop" # love it for commit, until i try lazygit 'n magit..
    lazygit = "JesseDuffield.lazygit" # TODO vs tig vs magit
    # tig comes installed with 'git for windows' bundle
    #  - it also includes "git credential manager"

    # more dev specific
    sql = "postgresql" # TODO: add install by search, add --source winget
    # "PostgreSQL.PostgreSQL 16",

    #tightnvc?

}  #| foreach {winget install -e --id $_}


# used by scoop, but can work for winget too
$app_names = @(

    # dev
    "erlang", # dependency for elixir
    "elixir", # web/phoenix
    "haxe" # general; super easy to setup compared to ruby!
    # "ruby", # scripting, libs
    # go # ? # simpler alt to haxe
    # MSYS2 vs WSL



    # cli-apps (the best of linux, on windows! :) )
    # aim for contemporary binary replacements (rust/go/zig/etc.)

    # copied from setup-linux.sh:
    # TODO: try installing the ones i had on linux
    # core shell apps

    # essentials
    # simple community-sourced help for most commands, super practical
        "tldr",
    # sudo pacman -S tldr # man
    # one time, it didn't update the dictionary upon install, so...
    # tldr -u

    # fzf
    # holy shit, search entire OS with this!
    # git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    # ~/.fzf/install
    # note: i have this exact two lines included in the nvim plug-in manager too
    # prompts:
    # autocomplete? yes
    # bindings? TODO
    # shell integration? nah (adds to .bashrc and some fish config file

    # file directory navigator
    # TODO: try them all!
        "yazi", # vs lf (my previous app) vs nnn vs mc (classic)
        #  - looks great upon first try!
        # broot # a different way

    # replacement basic commands
    # TODO: not sure if these are better than powershell's default ls/bat, aren't object-oriented/attribute-formatted
    "eza", # ls; try lsd # --tree is better than ps's -depth output
    "bat", # cat

    # replacement utilities
    # https://news.ycombinator.com/item?id=26561211
    # https://wiki.archlinux.org/title/core_utilities#Alternatives
    # - great list
    "ripgrep", # vs powershell's select-string
    # sudo pacman -S ripgrep # grep & ack
    # TODO: try fzf+ripgrep
    # https://github.com/junegunn/fzf#3-interactive-ripgrep-integration
    "fd",
    # sudo pacman -S fd # find & parallel, fd-find package in debian
    # zoxide > cd
    "delta", # diff
    # sudo pacman -S delta # diff
    # xh > curl & httpie
    # sudo pacman -S sd # sed

    # dust or ncdu > du
    "dust" # ncdu > du; great for finding what's taking up disk space

    # procs > ps
    # bottom > top
)


# use: install_app_by_id($apps.shell)
# NOTE: uses winget at the moment
function install_app_by_id($id) { # restriction: '-' is a special char for powershell commands
    # $output =
    winget install --id $id --source winget
    # without --id, i think it will search by name by default and run into multiple choices/sources
    # with --source winget, can consistently upgrade all apps via "winget --upgrade" instead of the windows store

    # if package exists, do nothing
}

# use: install_app_by_name($app_names.haxe)
# NOTE: uses scoop at the moment
function install_app_by_name($name, $package_manager) {
    # $package_manager install $name # no string interpolation when running commands directly
    $cmd = "$package_manager install $name"
    # winget and scoop happen to have the same options here
    # winget happens to use name over id by default
    # NOTE: winget install by name can run into multiple packages problem
    #       it should provide options and not install anything
    invoke-expression($cmd)
}

# main function
# NOTE: uses scoop by default for name values
function install_app([string]$name_or_id, [string]$package_manager = "scoop") {
    $is_id = $name_or_id.contains('.')

    if ($is_id) {
        install_app_by_id($name_or_id) # (winget)
    }
    else {
        install_app_by_name($name_or_id, $package_manager)
    }
}

# main script
# probably won't ever use tho..
function install_all_apps($apps, $app_names) {
    foreach ($app in $apps) {
        install_app($app) # app.ToString() by default
    }
}
