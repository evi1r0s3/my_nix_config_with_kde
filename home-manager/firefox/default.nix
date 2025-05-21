{ pkgs-default, inputs,... }:
{
  #home.file.".mozilla/firefox/evi1_f4iry/chrome".source = ./userChrome.css;
  #programs.firefox.enable = true;
  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [ pkgs-default.kdePackages.plasma-browser-integration ];
    profiles = {
      evi1_f4iry = {
        userChrome = (builtins.readFile ./userChrome.css);
        search = {
          force = true;
          default = "DuckDuckGo";
        };
        settings = {
          # 使用自定义css
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          # 初始页面
          "browser.startup.homepage" = "about:blank";
          # 语言
          "intl.locale.requested" = "zh-CN";
          # Updates
          "app.update.auto" = false; # Do not auto-update
          "app.update.service.enabled" = false; # Do not update on background
          "app.update.silent" = false; # Alert if an update happens
          "extensions.update.autoUpdateDefault" = false; # Do not auto-update by default
          # disable Network Connectivity checks
          # [1] https://bugzilla.mozilla.org/1460537
          "network.connectivity-service.enabled" = false;
          # 插件
          extensions = with inputs.firefox-addons.packages.${pkgs-default.stdenv.system}; [
            foxyproxy-standard
            (immersive-translate.overrideAttrs (oldAttrs: { meta.unfree = false; })) # Dirty workaround since nixpkgs.config.allowUnfree does not work with firefox-addons flake
            cookie-quick-manager
            sidebery
            user-agent-string-switcher
            proton-pass
            offline-qr-code-generator
            privacy-badger
          ];
        };
      };
    };
  };
}
