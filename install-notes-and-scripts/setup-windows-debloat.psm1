# WARNING: be careful when removing ("tweaking") things from windows, often, it's not worth the damage it can do. Instead, look for ways to simply turn things off.
# if you do remove the wrong package, use the reinstall-removed-package.ps1 script to add it back

$apps_to_remove = @{

    # to try:
    # clipchamp
    # solitaire & casual games
    # xbox

    # non-microsoft bloat
    linkedin = "linkedin"

    # microsoft bloat
    outlook = "outlook (new)" # TODO: is it worth even trying..??
    xbox = "xbox" # TODO: free ultimate pass for 1 month, then trash it

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

function remove_all_bloatware($apps) {
    foreach ($app in $apps) {
        uninstall-app($app);
    }
}

