# WARNING: be careful when removing ("tweaking") things from windows, often, it's not worth the damage it can do. Instead, look for ways to simply turn things off.
# if you do remove the wrong package, use the reinstall-removed-package.ps1 script to add it back

$bloatware = @{

    # winget list | select-string "app-name"
    #  - to find the app's id/name

    # to try:
    # media player (vs vlc media player)
    # news
    # sound recorder
    # clipchamp
    # xbox

    # ok:
    # discord # microsoft can't buy out products made with love!
    # paint # still the best ms native app
    # notepad
    # maps # this is actually ok!

    # calculator
    # snipping tool (though it should be a powertoy)

    # non-microsoft bloat

    # - vendor-specific
    # acer

    # microsoft bloat
    #edge # can't uninstall (neatly) :(
    outlook = "outlook (new)" # TODO: is it worth even trying..??
    ms_games = "solitaire & casual games" # takes 114mb and doesn't even have the games installed..??
    linkedin = "linkedin" # microsoft bought it
    movies = "movies & tv" # just plain terrible cash-grab
    xbox = "xbox" # TODO: free ultimate pass for 1 month, then trash it

    email = "mail and calendar" # read it has ads, $$
    todo = "todo" # use simple text file
    clock = "Windows Clock" # use phone, [9WZDNCRFJ3PR], # TODO: is this a permanent id or does it change by version?
    sticky_notes = "Microsoft Sticky Notes" # [9NBLGGH4QGHW]
    # uses sqllite! wtf!! otherwise, i kinda dig the mess of multiple notes all over the desktop

    #widget = "windows web experience pack" # not an id. i think it searches
    # just turn this off in settings, doh!
}

function uninstall_app($id) {
    winget uninstall --id $id # hash value .tostring?
}

function uninstall_apps($apps) {
    foreach ($app in $apps) {
        uninstall-app($app)
    }
}

# main script
function remove-all-bloatware() {
    uninstall_apps($bloatware)
    # may remove other stuff beyond mere uninstalling apps
}

