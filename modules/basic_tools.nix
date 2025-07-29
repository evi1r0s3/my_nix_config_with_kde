{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ 
    wget
    git
    git-lfs
    curl
    openssh
    neofetch
    btop
    iotop
    iftop
    strace
    lsof
    ethtool
    which
    file
    gnutar
    zip
    unzip
    xz
    linux-wifi-hotspot
    iw
    youtube-music
    yazi
    zed-editor
    vscode
    vim
    kitty
    zellij
  ];
}

