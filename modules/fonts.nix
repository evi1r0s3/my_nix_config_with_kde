{ pkgs-default, pkgs-nur, inputs,... }:
{
  fonts = {
    packages = [
      # After 25.05 必须使用nerd-fonts.下面的字体
      # nerd-fonts.intone-mono
      # nerd-fonts.comic-shanns-mono
      # nerd-fonts.jetbrains-mono
      # 24.11
      #(pkgs-default.nerdfonts.override { fonts = [ "IntelOneMono" "JetBrainsMono" "ComicShannsMono"];})
      ###
      # 25.05
      # vista-fonts-chs
      pkgs-default.nerd-fonts.intone-mono
      pkgs-default.nerd-fonts.jetbrains-mono
      pkgs-default.nerd-fonts.comic-shanns-mono
      pkgs-default.vistafonts-chs
      pkgs-default.ubuntu-sans-mono
      pkgs-default.noto-fonts-cjk-sans
      pkgs-default.unifont
      pkgs-default.maple-mono.NF-CN
      pkgs-default.sarasa-gothic
      # emojione #
      # wps fonts #
      pkgs-nur.repos.rewine.ttf-wps-fonts
      pkgs-nur.repos.rewine.ttf-ms-win10
      #inputs.wpsFonts.packages.${pkgs-default.system}.default
    ];
    fontDir.enable = true;
    fontconfig = {
     enable = true;
     includeUserConf = true;
    };
    # /run/current-system/sw/share/X11/fonts/
  };
}

