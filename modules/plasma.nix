{ pkgs-default, ... }:
{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;
  environment.systemPackages = with pkgs-default; [
    kdePackages.konsole
  ];
}

