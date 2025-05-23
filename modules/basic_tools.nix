{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ 
    wget
    git
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
    remnote
    youtube-music
    yazi
    zed-editor
    vscode
    vim
    kitty
    zellij
  ];
}

