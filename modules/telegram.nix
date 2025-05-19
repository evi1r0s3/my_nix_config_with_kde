{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ telegram-desktop ];
}
