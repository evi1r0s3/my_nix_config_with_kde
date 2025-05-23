{ ... }:
{
  imports = [
    ./kitty
    ./Pictures
    ./fcitx5
    ./helix
    ./direnv
    ./shell
    ./virt_manager
    ./firefox
    ./kitty
    ./zellij
  ];

  home.username = "evi1_f4iry";
  home.homeDirectory = "/home/evi1_f4iry";

  programs.git = {
    enable = true;
    userName = "evi1r0s3";
    userEmail = "evi1_r0s3_a0f4r@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
