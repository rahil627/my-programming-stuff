# windows 11

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


# download and install winget package manager
# https://github.com/microsoft/winget-cli/releases/latest
# TODO: copy/pasta a script to install it
# TODO: dunno about chocolatey 'n other package managers...


# app sources
# https://github.com/PSGitHubUser1/Windows-Essentials-Apps-Installer/blob/main/wea-v1.3/weai/wea_installer_v1.3_RUN-AS-ADMIN.cmd

# instead of writing a script, put things into objects
# then can run it interactively

# apps to try
enum apps-to-try {
    Microsoft.PowerToys
    SomePythonThings.WingetUIStore
    GitHub.GitHubDesktop
    Microsoft.PCManager

    Obsidian.Obsidian
}

# main apps
enum apps {
    # todo: dropbox
    # todo: choose a browser
    Discord.Discord
    #Telegram.TelegramDesktop # just use phone app

    VideoLAN.VLC

    Microsoft.Powershell # strangely, windows 11 ships with v1, currently at v7!!
    # make it the default terminal
    #   - open terminal -> click on the down-arrow near new tab location -> set startup/default profile
    # todo: no way to do this via command line? :/
    Microsoft.VisualStudioCode
    Microsoft.dotNetFramework # needed for powershell lsp
    Git.Git #winget install --id Git.Git -e --source winget


    #tightnvc?
}

function install-app($id) { # can install by name too?
    $cmd = "winget install --id "+$id
}

function install-all-apps {
    #winget install --id Discord.Discord
    $cmd = "winget install --id "

    foreach ($app in $apps) {
        Invoke-Expression -Command $cmd + $app.#?? enum value to string?
    }
}

function setup-powershell {
    #Microsoft.Powershell # strangely, windows 11 ships with v1, currently at v7!!
    # make it the default terminal
    #   - open terminal -> click on the down-arrow near new tab location -> set startup/default profile
    # todo: no way to do this via command line? :/
    Invoke-Expression -C "update-help"
    # todo: catch error then try
    #Invoke-Expression -C "Update-Help -Verbose -Force -ErrorAction SilentlyContinue"

}

function setup-git {
    Invoke-Expression -C git config --global user.name "ra"
    Invoke-Expression -C git config --global user.email rahil627@gmail.com
}





