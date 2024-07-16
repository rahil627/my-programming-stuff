$apps_to_remove @{
    widget = "windows web experience pack" # not an id. i think it searches
}

function uninstall_app($app) {
    $command = "winget uninstall $app" # hash value .tostring?
}

function remove_all_bloatware($apps) {
    foreach ($app in $apps) {
        uninstall-app($app);
    }
}

