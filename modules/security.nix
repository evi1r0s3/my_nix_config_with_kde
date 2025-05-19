{
  security.sudo.extraConfig = "Defaults env_reset,timestamp_timeout=-1";
  networking.firewall = {
    allowedTCPPorts = [
      1337
      1338
      4444
    ];
  };
}
