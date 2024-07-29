function Do-Something {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]$user_input
    )

    if (-not(Test-Path $user_input)) {
        Write-Host "i'm sorry, there's no such path"
    }

    process { # TODO: process?
        Get-ChildItem -Path $user_input -Recurse -Directory | Where-Object { $_.Name -match '\s' }
    }
}

# Example usage:
# Get folders with spaces under C:\MyFolder
#Do-Something -input_to_pass "C:\MyFolder"
