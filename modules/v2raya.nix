{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ v2raya ];

  services.v2raya.enable = true;
  networking.firewall = {
    allowedTCPPorts = [
      20170
      20171
      20172
    ];
  };
}
