# http://stackoverflow.com/a/9949105
$ErrorActionPreference = "Stop"

# http://networkerslog.blogspot.com.br/2013/09/how-to-enable-remote-desktop-remotely.html
set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
