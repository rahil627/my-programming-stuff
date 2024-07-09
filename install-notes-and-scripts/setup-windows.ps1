# windows 11

# some inspiration
# https://gist.github.com/brandonkal/0ababb7eaf65e97234b21d50c88edce8
# https://github.com/Kugane/winget
# todo: debloat windows 11

# download and install winget package manager
# https://github.com/microsoft/winget-cli/releases/latest

# todo: dunno about chocolatey 'n other package managers...

# app sources
# https://github.com/PSGitHubUser1/Windows-Essentials-Apps-Installer/blob/main/wea-v1.3/weai/wea_installer_v1.3_RUN-AS-ADMIN.cmd

# apps to try
enum apps-to-try {
    Microsoft.PowerToys
    SomePythonThings.WingetUIStore
    GitHub.GitHubDesktop
    Microsoft.PCManager
}

# apps
enum essential-apps {
    # todo: choose a browser
    Discord.Discord
    Telegram.TelegramDesktop
    Microsoft.VisualStudioCode
}

enum file-opening-apps {
    VideoLAN.VLC
}

enum dev-apps {
    Git.Git #winget install --id Git.Git -e --source winget
}



#winget install --id Discord.Discord
$cmd = "winget install --id "


