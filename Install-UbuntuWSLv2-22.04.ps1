Param (
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$wslName,
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$wslInstallationPath,
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$username,
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$installAllSoftware
)

# create staging directory if it does not exists
if (-Not (Test-Path -Path .\staging)) { $dir = mkdir .\staging }

curl.exe -L -o .\staging\ubuntuLTS.appx https://aka.ms/wslubuntu2204

Move-Item .\staging\ubuntuLTS.appx .\staging\$wslName.zip
#Copy-Item .\staging\ubuntuLTS.appx .\staging\$wslName.zip
Expand-Archive .\staging\$wslName.zip .\staging\$wslName

# Updated for multi-arch builds

$x64BuildAppx = $(Get-ChildItem .\staging\$wslName -Filter "*x64.appx")

New-Item -ItemType Directory -Path ".\staging\$wslName\$($x64BuildAppx.BaseName)" -Force

Move-Item $x64BuildAppx.FullName ".\staging\$wslName\$($x64BuildAppx.BaseName)\$wslName.zip"
Expand-Archive ".\staging\$wslName\$($x64BuildAppx.BaseName)\$wslName.zip" ".\staging\$wslName\$($x64BuildAppx.BaseName)\$wslName"

if (-Not (Test-Path -Path $wslInstallationPath)) {
    mkdir $wslInstallationPath
}
# wsl --import $wslName $wslInstallationPath .\staging\$wslName\$x64Build\install.tar.gz
wsl --import $wslName $wslInstallationPath ".\staging\$wslName\$($x64BuildAppx.BaseName)\$wslName\install.tar.gz"

Remove-Item .\staging\$wslName.zip
Remove-Item -r .\staging\$wslName\

# Update the system
wsl -d $wslName -u root bash -ic "apt update; apt upgrade -y"

# create your user and add it to sudoers
wsl -d $wslName -u root bash -ic "./scripts/config/system/createUser.sh $username ubuntu"

# ensure WSL Distro is restarted when first used with user account
wsl -t $wslName

#if ($installAllSoftware -ieq $true) {
#    wsl -d $wslName -u root bash -ic "./scripts/config/system/sudoNoPasswd.sh $username"
#    wsl -d $wslName -u root bash -ic ./scripts/install/installBasePackages.sh
#    wsl -d $wslName -u $username bash -ic ./scripts/install/installAllSoftware.sh
#    wsl -d $wslName -u root bash -ic "./scripts/config/system/sudoWithPasswd.sh $username"
#}
