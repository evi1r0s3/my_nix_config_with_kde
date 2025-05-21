# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs-default , ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  boot = {
    loader = { 
      efi = {
        canTouchEfiVariables = false;
        #efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = false;
        useOSProber = false;
        efiInstallAsRemovable = true;
        #gfxmodeEfi = "1920x1200";
        #gfxmodeBios = "1920x1200";
        font = "${pkgs-default.nerdfonts}/share/fonts/truetype/NerdFonts/IntoneMonoNerdFont-Medium.ttf";
        fontSize = 24;
      };
    };
    supportedFilesystems = [ 
      "btrfs"
      "fat" "vfat" "exfat" "ntfs" # Microsoft 
      "cifs"                      # Windows Network Share
    ];
  };

  

  networking = {
    hostName = "ZenNix0s"; # Define your hostname.
    networkmanager.enable = true;
  };
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
  hardware.bluetooth.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
     enable = true;
     pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  #services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.evi1_f4iry = {
    description = "Xenon Evil Fairy";
    createHome = true;
    home = "/home/evi1_f4iry";
    group = "users";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
  };
   
  #programs.firefox.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  ###########################
  #systemd.services = {
    #create-swapfile = {
    #  serviceConfig.Type = "oneshot";
    #  wantedBy = [ "swap-swapfile.swap" ];
    #  script = ''
    #    swapfile="/swap/swapfile"
    #    if [ -f "$swapfile" ]; then
    #        echo "Swap file $swapfile already exists, taking no action"
    #    else
    #        echo "Setting up swap file $swapfile"
    #        ${pkgs.coreutils}/bin/truncate -s 0 "$swapfile"
    #        ${pkgs.e2fsprogs}/bin/chattr +C "$swapfile"
    #    fi
    #  '';
    #};
  #};

  services = {
    btrbk = {
      instances."btrbak" = {
        onCalendar = "*-*-* *:00:00";
        settings = {
          timestamp_format = "long";
          snapshot_preserve_min = "2d";
          preserve_day_of_week = "sunday" ;
          preserve_hour_of_day = "0" ;
          target_preserve = "48h 10d 4w 12m 10y" ;
          volume."/home" = {
            snapshot_create = "always";
            subvolume = ".";
            snapshot_dir = ".snapshots";
          };
          volume."/var/local" = {
            snapshot_create = "always";
            subvolume = ".";
            snapshot_dir = ".snapshots";
          };
        };  
      };
    };
  };

  ##########################



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

