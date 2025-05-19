{ pkgs-default, ... }:
{
  programs.wireshark = {
    enable = true;
    package = pkgs-default.wireshark;
  };
  users.users.evi1_f4iry.extraGroups = [ "wireshark" ];
}
