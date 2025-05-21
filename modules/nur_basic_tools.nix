{ pkgs-nur, ... }:
{
  environment.systemPackages = with pkgs-nur.repos; [
    novel2430.wemeet-bin-bwrap-wayland-screenshare
    novel2430.wpsoffice-365
    # rewine.ttf-wps-fonts defend in fonts.nix
  ];
}

