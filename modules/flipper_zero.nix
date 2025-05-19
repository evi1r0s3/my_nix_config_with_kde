{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [
    qFlipper
  ];
  hardware.flipperzero.enable = true;
}
