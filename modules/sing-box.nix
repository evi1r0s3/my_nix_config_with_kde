{ pkgs-unstable, pkgs-default,... }:
{
  environment.systemPackages = with pkgs-unstable; [
    sing-box
  ];
  systemd.services."singbox" = {
    enable = true;
    after = [ "network.target" ];
    wantedBy = [ "default.target" ];
    description = "Sing-box croe Service";
    serviceConfig = {
      Type = "simple";
      User = "root";
      Restart = "always";
      RestartSec = 5;
      ExecStart = ''${pkgs-unstable.sing-box}/bin/sing-box run -c \
       /home/evi1_f4iry/sing_box/my_private.json'';
    };
  };
  # 因为要在已有singbox网络后才能更好的刷新配置，
  # 所以记得after singbox，同时也不是没有sing网络就无法刷新，所以wantBy还是选常规就好，lv3
  systemd.services."singbox_serenity" ={
    enable = true;
    after = [ "network.target" "singbox.service" "docker.service" "docker.socket" ];
    wantedBy = [ "default.target" ];
    description = "Sing-box Serenity for refresh sing-box's config";
    serviceConfig = {
      Type = "oneshot";
      User = "root";
      #Requires = [ "docker.service" "docker.socket"];
      ExecStartPre = ''${pkgs-default.systemd}/bin/systemctl stop singbox.service'';
      ExecStart = ''
        ${pkgs-default.docker}/bin/docker run \
        --rm \
        -v /home/evi1_f4iry/sing_box:/etc/serenity \
        --name=serenity \
        ghcr.io/sagernet/serenity \
        -D /etc/serenity \
        export private -c my_serenity.json
      '';
      StandardOutput = "file:/home/evi1_f4iry/sing_box/my_private.json";
      StandardError = "append:/home/evi1_f4iry/sing_box/serenity_err.json";
      ExecStartPost = ''${pkgs-default.bash}/bin/bash /home/evi1_f4iry/sing_box/mk_config.sh'';
    };
  };
  # 定时更新
  systemd.timers."singbox_serenity" = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
      Unity = "singbox_serenity.service";
    };
  };
}
