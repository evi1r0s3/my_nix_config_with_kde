{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ 
    gdb
    #pwndbg
  ];
}
