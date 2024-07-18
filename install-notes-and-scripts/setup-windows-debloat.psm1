# WARNING: be careful when removing ("tweaking") things from windows, often, it's not worth the damage it can do. Instead, look for ways to simply turn things off.
# if you do remove the wrong package, use the reinstall-removed-package.ps1 script to add it back

$apps_to_remove = @{
    app = "app-id"
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

