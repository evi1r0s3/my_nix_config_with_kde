{ pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    sing-box
  ];
}
