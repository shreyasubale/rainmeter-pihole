# Pi-hole Manager for Rainmeter

A compact Rainmeter widget to monitor and control multiple Pi-hole instances from your desktop. Quickly disable ad-blocking for preset durations or re-enable it with a single click.

![Rainmeter](https://img.shields.io/badge/Rainmeter-4.5%2B-blue) ![Pi-hole](https://img.shields.io/badge/Pi--hole-v5-green) ![License](https://img.shields.io/badge/license-MIT-lightgrey)

## Features

- Monitor up to **4 Pi-hole instances** simultaneously
- **Live status indicators** — green (enabled), red (disabled), grey (unreachable)
- **Preset disable durations** — 4 configurable time buttons (default: 5m, 15m, 30m, 60m)
- **Per-instance controls** — disable or re-enable each Pi-hole independently
- **Bulk actions** — Disable All / Enable All buttons
- **Auto-refresh** — status updates every ~30 seconds
- Fully configurable colors, fonts, and layout

## Prerequisites

- [Rainmeter 4.5+](https://www.rainmeter.net/)
- One or more Pi-hole v5 instances with API access enabled
- API token for each instance (found in Pi-hole Admin > Settings > API > Show API token)

## Installation

1. **Download or clone** this repository.

2. **Copy** the `PiholeManager` folder into your Rainmeter skins directory:
   ```
   Documents\Rainmeter\Skins\PiholeManager\
   ```
   Your folder structure should look like:
   ```
   PiholeManager/
   ├── @Resources/
   │   └── PiholeAPI.ps1
   ├── PiholeManager.ini
   └── PiholeVariables.inc
   ```

3. **Edit `PiholeVariables.inc`** with your Pi-hole details:
   ```ini
   PiholeCount=2

   PiholeName1=Primary
   PiholeURL1=http://192.168.1.2
   PiholeToken1=your_api_token_here

   PiholeName2=Secondary
   PiholeURL2=http://192.168.1.3
   PiholeToken2=your_api_token_here
   ```

4. **Load the skin** — open Rainmeter, refresh skins, and activate `PiholeManager\PiholeManager.ini`.

## Configuration

All settings live in `PiholeVariables.inc`:

### Pi-hole Instances

| Variable | Description |
|---|---|
| `PiholeCount` | Number of active instances (1–4) |
| `PiholeNameN` | Display name for instance N |
| `PiholeURLN` | Base URL (e.g., `http://192.168.1.2`) |
| `PiholeTokenN` | API authentication token |

### Disable Durations

| Variable | Default | Description |
|---|---|---|
| `DisableTime1` | 5 | First preset (minutes) |
| `DisableTime2` | 15 | Second preset (minutes) |
| `DisableTime3` | 30 | Third preset (minutes) |
| `DisableTime4` | 60 | Fourth preset (minutes) |

### Appearance

| Variable | Default | Description |
|---|---|---|
| `BackgroundColor` | `20,20,25,230` | Widget background (RGBA) |
| `EnabledColor` | `100,220,100` | Color for enabled status |
| `DisabledColor` | `220,80,80` | Color for disabled status |
| `AccentColor` | `100,140,255` | Button hover highlight |
| `FontFace` | `Segoe UI` | Font family |
| `SkinWidth` | `280` | Widget width in pixels |

## How It Works

The skin uses Rainmeter's `RunCommand` plugin to execute a PowerShell script (`PiholeAPI.ps1`) that communicates with the Pi-hole Admin API:

- **Status check** — `GET /admin/api.php?status&auth=<token>`
- **Disable** — `GET /admin/api.php?disable=<seconds>&auth=<token>`
- **Enable** — `GET /admin/api.php?enable&auth=<token>`

Status is polled automatically. Disable/enable actions trigger an immediate status refresh on completion.

## Troubleshooting

| Problem | Solution |
|---|---|
| Status shows "error" or grey dot | Verify the URL is reachable and the API token is correct |
| Buttons do nothing | Ensure PowerShell execution policy allows scripts (`Set-ExecutionPolicy RemoteSigned`) |
| Widget doesn't resize | Confirm `PiholeCount` matches the number of configured instances |
| Slow response | The Pi-hole or network may be slow; the 5-second timeout per request is configurable in `PiholeAPI.ps1` |

## Pi-hole v6

This widget targets the **Pi-hole v5 API**. Pi-hole v6 uses a different REST API structure. If you're running v6, the PowerShell script will need to be updated to use the new endpoints.

## License

MIT
