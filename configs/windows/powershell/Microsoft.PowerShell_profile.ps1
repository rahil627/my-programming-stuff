# hx $profile

# NOTE: after modifying, re-run this:
# . $profile

# WARNING: don't edit the config file ($profile) directly, it keeps disappearing, then have to restart PC in order to gain access to the folder.. TODO: maybe due to OneDrive messing up :/

# copy this file to the system
# cp .\Microsoft.PowerShell_profile.ps1 C:\Users\ra\OneDrive\Documents\PowerShell\

# then, back it up (when it's working properly)
# cp $profile C:\Users\ra\my-stuff\repos\my-programming-stuff\configs\windows\powershell\

# functions here magically become commands

# an example from about_profiles from help/docs
function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

# begin


# TODO: WARNING: doesn't work, scoping issues
# TODO: read about_scoping
# maybe best to create a module and import it, as it will "load to the root-level global scope of the runspace by default"
# use 'set-alias -scope global' # temp way
function load_aliases {

  # TODO: slowly merge the rest from my old fish config

  # TODO: alt shortcuts for most commonly-used commands?
  # fzf
  # text-editor
  
  # basics
  set-alias l ls
  set-alias h help # TODO: still need tldr?

  # apps
  
  set-alias shell pwsh
  
  set-alias -scope global f yazi_cd # NOTE: yazi_cd is a function
  set-alias -scope global yazi yazi_cd
  # abbr -a f 'lf'
  # abbr -a f 'lfcd' # also c+f binding; NOTE: requires lfcd function
  # WARNING: lfcd doesn't show autocomplete/autosuggest of lf flags

  set-alias t hx
  set-alias helix hx
  # set-alias e 'doom run' # emacs
  # set-alias emacs 'doom run' # works without this

  # TODO: merging from my old fish session start-up script
  #       just add as needed
  
  # contemporary replacements

  # -i   --ignore-case
  # TODO: try using select-string instead
  # set-alias rg 'rg -i' # -> grep # note: ripgrep defaults might affect everything that uses it (fzf, nvim, etc.)
  # set-alias rgh 'rg -i --hidden' # --no-ignore-dot ??, also the -i is duplicated to no ill effect
  # set-alias ripgrep 'rg -i' # rg is the actual command for the ripgrep package
  
  # set-alias f 'fd' # -> find; currently f = file manager
  
  # set-alias d 'delta' # -> diff


  # set-alias ai 'tgpt' # openai's chatGPT
  # set-alias chatgpt 'tgpt'


  # dev
  # set-alias hx 'haxe' # used by helix :(
  set-alias rb 'ruby'
  # set-alias cr 'crystal'
  set-alias ex 'elixir'

}



# naming convention
# $my_ prefix
# MyInvocation comes first :(

# store paths here

# my paths
# $home is set by default

$my_paths = @{
my_stuff = "$home\my-stuff"
stuff = "$home\my-stuff"
repos = "$home\my-stuff\repos"
my_programming_stuff = "$home\my-stuff\repos\my-programming-stuff"
programming = "$home\my-stuff\repos\my-programming-stuff"
configs = "$home\my-stuff\repos\my-programming-stuff\configs\windows" # NOTE: not cross-platform, can use $iswindows
}

# put most commonly-used paths in session-level vars
# this allows you to use simple string subsitution as opposed to verbose string interpolation: "$my_stuff" vs $($my_paths['my_stuff'])"
$my_stuff = $my_paths['my_stuff']
$stuff = $my_paths['my_stuff']
$my_repos = $my_paths['repos']
$repos = $my_paths['repos']
$my_programming_stuff = $my_paths['my_programming_stuff']
$programming = $my_paths['my_programming_stuff']
$configs = $my_paths['configs']
$my_configs = $my_paths['configs']

# store in a data structure for scoping and easy auto-complete? (although, $[tab] does provide auto-complete)
$config_paths = @{
# paths to config files
# use: fetch hash-table with $my_configs['text_editor']

shell = $profile # $profile is set by default
terminal = "$home\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
text_editor = "$home\AppData\Roaming\helix\config.toml"
}

# end

# have yazi (file manager) change directory (cd) upon exit
function yazi_cd {
  $tmp = [System.IO.Path]::GetTempFileName()
  yazi $args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp
  if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
      Set-Location -LiteralPath $cwd
  }
  Remove-Item -Path $tmp
}






# main script
load_aliases
# load_paths # TODO: if you put it in a function, then liekly have to use '-scope global' flag








# powershell comes with a bunch of aliases for linux users
# Get-Alias | select name, definition
#
# Name    Definition
# ----    ----------
# ?       Where-Object
# %       ForEach-Object
# ac      Add-Content
# cat     Get-Content
# cd      Set-Location
# chdir   Set-Location
# clc     Clear-Content
# clear   Clear-Host
# clhy    Clear-History
# cli     Clear-Item
# clp     Clear-ItemProperty
# cls     Clear-Host
# clv     Clear-Variable
# cnsn    Connect-PSSession
# compare Compare-Object
# copy    Copy-Item
# cp      Copy-Item
# cpi     Copy-Item
# cpp     Copy-ItemProperty
# cvpa    Convert-Path
# dbp     Disable-PSBreakpoint
# del     Remove-Item
# diff    Compare-Object
# dir     Get-ChildItem
# dnsn    Disconnect-PSSession
# ebp     Enable-PSBreakpoint
# echo    Write-Output
# epal    Export-Alias
# epcsv   Export-Csv
# erase   Remove-Item
# etsn    Enter-PSSession
# exsn    Exit-PSSession
# fc      Format-Custom
# fhx     Format-Hex
# fl      Format-List
# foreach ForEach-Object
# ft      Format-Table
# fw      Format-Wide
# gal     Get-Alias
# gbp     Get-PSBreakpoint
# gc      Get-Content
# gcb     Get-Clipboard
# gci     Get-ChildItem
# gcm     Get-Command
# gcs     Get-PSCallStack
# gdr     Get-PSDrive
# gerr    Get-Error
# ghy     Get-History
# gi      Get-Item
# gin     Get-ComputerInfo
# gjb     Get-Job
# gl      Get-Location
# gm      Get-Member
# gmo     Get-Module
# gp      Get-ItemProperty
# gps     Get-Process
# gpv     Get-ItemPropertyValue
# group   Group-Object
# gsn     Get-PSSession
# gsv     Get-Service
# gtz     Get-TimeZone
# gu      Get-Unique
# gv      Get-Variable
# h       Get-History
# history Get-History
# icm     Invoke-Command
# iex     Invoke-Expression
# ihy     Invoke-History
# ii      Invoke-Item
# ipal    Import-Alias
# ipcsv   Import-Csv
# ipmo    Import-Module
# irm     Invoke-RestMethod
# iwr     Invoke-WebRequest
# kill    Stop-Process
# ls      Get-ChildItem
# man     help
# md      mkdir
# measure Measure-Object
# mi      Move-Item
# mount   New-PSDrive
# move    Move-Item
# mp      Move-ItemProperty
# mv      Move-Item
# nal     New-Alias
# ndr     New-PSDrive
# ni      New-Item
# nmo     New-Module
# nsn     New-PSSession
# nv      New-Variable
# ogv     Out-GridView
# oh      Out-Host
# popd    Pop-Location
# ps      Get-Process
# pushd   Push-Location
# pwd     Get-Location
# r       Invoke-History
# rbp     Remove-PSBreakpoint
# rcjb    Receive-Job
# rcsn    Receive-PSSession
# rd      Remove-Item
# rdr     Remove-PSDrive
# ren     Rename-Item
# ri      Remove-Item
# rjb     Remove-Job
# rm      Remove-Item
# rmdir   Remove-Item
# rmo     Remove-Module
# rni     Rename-Item
# rnp     Rename-ItemProperty
# rp      Remove-ItemProperty
# rsn     Remove-PSSession
# rv      Remove-Variable
# rvpa    Resolve-Path
# sajb    Start-Job
# sal     Set-Alias
# saps    Start-Process
# sasv    Start-Service
# sbp     Set-PSBreakpoint
# scb     Set-Clipboard
# select  Select-Object
# set     Set-Variable
# shcm    Show-Command
# si      Set-Item
# sl      Set-Location
# sleep   Start-Sleep
# sls     Select-String
# sort    Sort-Object
# sp      Set-ItemProperty
# spjb    Stop-Job
# spps    Stop-Process
# spsv    Stop-Service
# start   Start-Process
# stz     Set-TimeZone
# sv      Set-Variable
# tee     Tee-Object
# type    Get-Content
# where   Where-Object
# wjb     Wait-Job
# write   Write-Output





# linux equivalents and basics

# linux to powershell cheat-sheet
# ...clearly, powershell is a better-made shell language and library
# https://threatpicture.com/blog/linux-to-powershell/
# No.	Linux Command	PowerShell Equivalent	Linux Example	PowerShell Example
# 1	ls	Get-ChildItem	ls /home/user	Get-ChildItem C:\Users\User
# 2	pwd	Get-Location	pwd	Get-Location
# 3	cd	Set-Location	cd /home/user	Set-Location C:\Users\User
# 4	mkdir	New-Item	mkdir new_directory	New-Item -ItemType Directory -Path new_directory
# 5	touch	New-Item	touch new_file.txt	New-Item -ItemType File -Path new_file.txt
# 6	cp	Copy-Item	cp file1.txt file2.txt	Copy-Item file1.txt file2.txt
# 7	mv	Move-Item	mv file1.txt dir1/	Move-Item file1.txt dir1\
# 8	rm	Remove-Item	rm file.txt	Remove-Item file.txt
# 9	cat	Get-Content	cat file.txt	Get-Content file.txt
# 10	grep	Select-String	grep ‘word’ file.txt	Select-String -Path file.txt -Pattern ‘word’
# 11	echo	Write-Output	echo “Hello, World!”	Write-Output “Hello, World!”
# 12	wc	Measure-Object	wc -l file.txt	Get-Content file.txt | Measure-Object -Line
# 13	chmod	Set-Acl	chmod 755 file.txt	N/A (Permissions are set differently in Windows)
# 14	chown	Set-Owner	chown user:group file.txt	N/A (Ownership is set differently in Windows)
# 15	sudo	Start-Process	sudo apt-get update	Start-Process -Verb RunAs PowerShell
# 16	kill	Stop-Process	kill -9 12345	Stop-Process -Id 12345 -Force
# 17	ps	Get-Process	ps	Get-Process
# 18	tail	Get-Content	tail -n 10 file.txt	Get-Content -Path file.txt -Tail 10
# 19	sort	Sort-Object	sort file.txt	Get-Content file.txt | Sort-Object
# 20	head	Get-Content	head -n 10 file.txt	Get-Content -Path file.txt -Head 10
# 21	date	Get-Date	date	Get-Date
# 22	uname	Get-CimInstance	uname -a	Get-CimInstance -ClassName Win32_OperatingSystem
# 23	df	Get-PSDrive	df -h	Get-PSDrive -PSProvider FileSystem
# 24	du	Get-ChildItem	du -sh /home/user	Get-ChildItem -Path C:\Users\User -Recurse -Force | Measure-Object -Property Length -Sum
# 25	tar	Compress-Archive	tar -czvf archive.tar.gz folder	Compress-Archive -Path folder -DestinationPath archive.zip
# 26	gzip	Compress-Archive	gzip file.txt	Compress-Archive -Path file.txt -DestinationPath file.txt.gz
# 27	gunzip	Expand-Archive	gunzip file.txt.gz	Expand-Archive -Path file.txt.gz -DestinationPath .
# 28	wget	Invoke-WebRequest	wget https://example.com/file.txt	Invoke-WebRequest -Uri https://example.com/file.txt -OutFile file.txt
# 29	alias	Set-Alias	alias ll=’ls -la’	Set-Alias -Name ll -Value “Get-ChildItem -Force”
# 30	curl	Invoke-WebRequest	curl -O https://example.com/file.txt	Invoke-WebRequest -Uri https://example.com/file.txt -OutFile file.txt
# 31	env	Get-ChildItem	env	Get-ChildItem -Path Env:
# 32	export	Set-Variable	export VAR=value	Set-Variable -Name VAR -Value “value” -Scope Global
# 33	history	Get-History	history	Get-History
# 34	ifconfig	Get-NetIPAddress	ifconfig	Get-NetIPAddress
# 35	man	Get-Help	man ls	Get-Help Get-ChildItem
# 36	ping	Test-NetConnection	ping example.com	Test-NetConnection -ComputerName example.com
# 37	sed	ForEach-Object	sed ‘s/old/new/g’ file.txt	Get-Content file.txt | ForEach-Object { $_ -replace ‘old’, ‘new’ } | Set-Content file.txt
# 38	awk	ForEach-Object	awk ‘{print $1}’ file.txt	Get-Content file.txt | ForEach-Object { ($_ -split ‘\s+’)[0] }
# 39	top	Get-Process	top	Get-Process | Sort-Object -Descending CPU
# 40	crontab	Task Scheduler	crontab -e	N/A (Use Windows Task Scheduler)
# 41	scp	Copy-Item	scp file.txt user@host:/path/	Copy-Item -Path file.txt -Destination \hostname\path\ -ToSession (New-PSSession -ComputerName hostname)
# 42	ssh	Enter-PSSession	ssh user@host	Enter-PSSession -ComputerName hostname -Credential (Get-Credential)
# 43	diff	Compare-Object	diff file1.txt file2.txt	Compare-Object (Get-Content file1.txt) (Get-Content file2.txt)
# 44	passwd	Set-LocalUser	passwd	Set-LocalUser -Name “username” -Password (Read-Host -AsSecureString)
# 45	uptime	Get-CimInstance	uptime	(Get-CimInstance -ClassName Win32







#set-alias -name find -value find-file
#set-alias -name grep -value find-text

# basic functions to re-create common linux programs
# function Find-File {
#  param ([string]$file_name, [string]$path = ".") # default to current directory

#   Get-ChildItem -Path $path -Recurse -Filter $file_name  -ErrorAction SilentlyContinue
#     #| Where-Object { $_.Name -eq $file_name }
# }

# function Find-Text {
#   param (
#     [Parameter(Mandatory=$true)] [string]$pattern,
#     [string]$path = "."
#   )

#     process {
#         if (!Test-Path -Path $path) {
#             Write-Error "The specified path '$path' does not exist."
#         }
        
#         Get-ChildItem -Path $path -Recurse -File
#             | Select-String -Pattern $pattern
#    }
# }


