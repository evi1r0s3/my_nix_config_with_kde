{ pkgs-nur, ... }:
{
  environment.systemPackages = with pkgs-nur.repos; [
    novel2430.wemeet-bin-bwrap-wayland-screenshare
  ];
}

