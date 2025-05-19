{ pkgs-default, ... }:

{
  environment.systemPackages = with pkgs-default; [ 
    nmap
    rustscan
    socat
    metasploit
    #wireshark
    sqlmap
    hashcat
    dirb
    gobuster
    hping
    aircrack-ng
    netdiscover
    john
    netcat
    ffuf
    tcpdump
    kismet
    binwalk
    socat
    can-utils
    cve-bin-tool
    inetutils #telnent
    netcat #nc
    #ghidra
    thc-hydra
    seclists
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "segger-jlink-qt4-796s"
  ];
  networking.firewall = {
    allowedTCPPorts = [
      1337
      4444
    ];
  };
}
