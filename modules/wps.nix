{ pkgs-stable, pkgs-nur, ... }:
{
  environment.systemPackages = [ 
    pkgs-stable.wpsoffice-cn
    #pkgs-nur.repos.novel2430.wpsoffice-365
  ];
}
