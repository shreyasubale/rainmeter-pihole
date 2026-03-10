[Variables]
; ============================================================
; Pi-hole Manager Configuration
; ============================================================

; --- Preset disable durations (in minutes) ---
DisableTime1=5
DisableTime2=15
DisableTime3=30
DisableTime4=60

; --- Number of Pi-hole instances (1 to 4 supported) ---
PiholeCount=2

; --- Pi-hole Instance 1 ---
PiholeName1=Primary
PiholeURL1=http://192.168.1.2
PiholeToken1=YOUR_API_TOKEN_HERE

; --- Pi-hole Instance 2 ---
PiholeName2=Secondary
PiholeURL2=http://192.168.1.3
PiholeToken2=YOUR_API_TOKEN_HERE

; --- Pi-hole Instance 3 (optional) ---
PiholeName3=Tertiary
PiholeURL3=http://192.168.1.4
PiholeToken3=YOUR_API_TOKEN_HERE

; --- Pi-hole Instance 4 (optional) ---
PiholeName4=Quaternary
PiholeURL4=http://192.168.1.5
PiholeToken4=YOUR_API_TOKEN_HERE

; --- Appearance ---
BackgroundColor=20,20,25,230
HeaderColor=180,180,200
EnabledColor=100,220,100
DisabledColor=220,80,80
ButtonColor=60,60,75
ButtonHoverColor=80,80,100
TextColor=200,200,210
DimTextColor=120,120,140
AccentColor=100,140,255
FontFace=Segoe UI
FontSize=11
FontSizeSmall=9
FontSizeLarge=14
SkinWidth=280
RowHeight=90
