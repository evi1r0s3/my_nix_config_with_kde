{ pkgs-unstable, ... }:
{
  environment.systemPackages = [ 
    pkgs-unstable.remnote
  ];
}
