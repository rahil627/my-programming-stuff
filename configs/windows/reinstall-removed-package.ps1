# a possible solution, in case you deleted the wrong windows package

# https://www.reddit.com/r/Windows11/comments/ozu33m/windows_widgets_processes_active_for_no_reason_i/

param (
	# example: MicrosoftWindows.Client.WebExperience
	[Parameter(Mandatory=$true)][string]$package_name
)

$flags = @{
	Register                  = $true
	ForceApplicationShutdown  = $true
	ForceUpdateFromAnyVersion = $true
	DisableDevelopmentMode    = $true
	Verbose                   = $true
}

# AllUsers seems to have the complete package list, even if you delete it (at a user level)
# get package info (id) from there, then use that to add it back
"$((Get-AppxPackage -Name $package_name -AllUsers).InstallLocation)\AppxManifest.xml" | Add-AppxPackage @flags
