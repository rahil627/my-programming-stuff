
# generally, just copy from AppData
# my god, windows is so much more simple! far far less cognitive load than linux

# todo: need env var for path to repos
# TODO: test how strings work
# cp $home\AppData\Roaming\helix\config.toml $home\my-stuff\repos\my-programming-stuff\configs\helix\

# NOTE: use ~\ or $home\
# NOTE: can save some paths in $vars in the current session ($profile)
# NOTE: using full path would only work on windows, use $vars to make it cross-platform

$my_configs_path = $my_paths['configs']

# shell
# TODO: currently broken due to onedrive, see config file in $my_configs
# cp $config_paths['shell'] "$my_configs_path\powershell"

# terminal
cp $config_paths['terminal'] "$my_configs_path\terminal"

# text editor
cp $config_paths['text_editor'] "$my_configs_path\helix"

