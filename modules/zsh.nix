{ pkgs-default, ... }:
{
  users.defaultUserShell = pkgs-default.zsh;
  environment.systemPackages = with pkgs-default; [
    lsd
    atuin
    starship
  ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;
  };
}
