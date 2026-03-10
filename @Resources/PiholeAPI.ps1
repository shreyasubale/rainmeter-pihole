# PiholeAPI.ps1 — Called by Rainmeter to interact with Pi-hole instances
# Usage:
#   PiholeAPI.ps1 -Action status -URL <base_url> -Token <api_token>
#   PiholeAPI.ps1 -Action disable -URL <base_url> -Token <api_token> -Minutes <int>
#   PiholeAPI.ps1 -Action enable -URL <base_url> -Token <api_token>

param(
    [Parameter(Mandatory)][string]$Action,
    [Parameter(Mandatory)][string]$URL,
    [Parameter(Mandatory)][string]$Token,
    [int]$Minutes = 5
)

# Normalize URL — strip trailing slash
$URL = $URL.TrimEnd('/')

function Get-Status {
    try {
        $response = Invoke-RestMethod -Uri "$URL/admin/api.php?status&auth=$Token" -TimeoutSec 5
        if ($response.status -eq "enabled") {
            Write-Output "enabled"
        } elseif ($response.status -eq "disabled") {
            Write-Output "disabled"
        } else {
            Write-Output "unknown"
        }
    } catch {
        Write-Output "error"
    }
}

function Disable-Blocking {
    $seconds = $Minutes * 60
    try {
        $response = Invoke-RestMethod -Uri "$URL/admin/api.php?disable=$seconds&auth=$Token" -TimeoutSec 5
        if ($response.status -eq "disabled") {
            Write-Output "disabled"
        } else {
            Write-Output "error"
        }
    } catch {
        Write-Output "error"
    }
}

function Enable-Blocking {
    try {
        $response = Invoke-RestMethod -Uri "$URL/admin/api.php?enable&auth=$Token" -TimeoutSec 5
        if ($response.status -eq "enabled") {
            Write-Output "enabled"
        } else {
            Write-Output "error"
        }
    } catch {
        Write-Output "error"
    }
}

switch ($Action) {
    "status"  { Get-Status }
    "disable" { Disable-Blocking }
    "enable"  { Enable-Blocking }
    default   { Write-Output "error" }
}
