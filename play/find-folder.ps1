function Get-FoldersWithSpaces {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$RootPath
    )

    process {
        Get-ChildItem -Path $RootPath -Recurse -Directory | Where-Object { $_.Name -match '\s' }
    }
}

# Example usage:
# Get folders with spaces under C:\MyFolder
Get-FoldersWithSpaces -RootPath "C:\MyFolder"
