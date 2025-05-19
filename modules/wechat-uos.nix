{ pkgs-default, ... }:
{
  environment.systemPackages = with pkgs-default; [ wechat-uos ];
}
