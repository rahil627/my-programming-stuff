
# because i'm in the process of changing the tools i use (terminal tools vs emacs), just leave this unimplemented for now

# these configs are generated, so must load
# NOTE: avoid changing settings via gui, edit settings in the config repo, and then load them all
# cp "$my_configs\terminal\settings.json" $config_paths['terminal']
#  - now use wezterm



# NOTE: should only have to run this script once, upon os install. normally, you'd just copy a single config file at a time
write-warning "unimplemented"
# see configs folder and path vars set in powershell profile
# cp .\powershell\Microsoft.PowerShell_profile.ps1 $home\OneDrive\Documents\PowerShell\


# TODO: could create a function to load all configs, and another to load a single config
# in powershell profile, create a list of os paths correlating to each config file in the repo
# then, here, it'll be:
# cp $config_paths_local['app'] $config_paths_windows['app']
