#{ pkgs-unstable, ...}:
{
  xdg.desktopEntries = {
    wps-office-prometheus = {
      comment = "Use WPS Writer to office work.";
      exec = "env XMODIFIERS=@im=fcitx GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx SDL_IM_MODULE=fcitx GLFW_IM_MODULE=ibus wps %F";
      genericName = "WPS";
      name = "WPS Office";
      startupNotify = false;
      terminal = false;
      type = "Application";
      categories = [ "Office" "WordProcessor" "Qt" ];
      icon = "wps-office2023-kprometheus";
      settings = {
        InitialPreference = "3";
        StartupWMClass = "wpsoffice";
        X-DBUS-ServiceName = "";
        X-DBUS-StartupType = "";
        X-KDE-SubstituteUID = "false";
        X-KDE-Username = "";
      };
    };
  };
}
