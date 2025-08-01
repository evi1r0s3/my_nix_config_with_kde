{
  description = "Make from A template that shows all standard flake outputs";
   
  inputs = {
    # 默认分支设置是unstable
    nixpkgs-unstable.url = "github:Nixos/nixpkgs/nixos-unstable";
    # 然后将stable的分支设置为一个参数，用来回退个别软件包版本为使用stable版
    nixpkgs-stable.url = "github:Nixos/nixpkgs/nixos-25.05";
    
    # homemanager 使用unstable,这样保证在配置一些软件时和pkgs用的分支一致
    home-manager = {
      # unstable
      # url = "github:nix-community/home-manager";
      # stable
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    nur = {
      url = "github:nix-community/NUR";
    };

    # binary-ninja.url = "github:jchv/nix-binary-ninja";

    # firefox插件，密避免使用nur的简单方法，
    # 浏览https://gitlab.com/rycee/nur-expressions/-/blob/master/pkgs/firefox-addons/addons.json，查找插件名称。
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    firefox-addons.inputs.nixpkgs.follows = "nixpkgs-stable";
    wpsFonts.url = "github:hypercrusher/wpsfonts";
  };

  outputs = inputs@{ self, nixpkgs-stable, nixpkgs-unstable, home-manager, nur, ... }: 
  let
    systemSettings = {
      system = "x86_64-linux";
    };
    lib = nixpkgs-stable.lib;
    pkgs-stable = import nixpkgs-stable {
      system = systemSettings.system;
      config.allowUnfree = true;
      config.joypixels.acceptLicense = true;
      config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
    };
    pkgs-unstable = import nixpkgs-unstable {
      system = systemSettings.system;
      config.allowUnfree = true;
      config.joypixels.acceptLicense = true;
      config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
    };
    pkgs-default = pkgs-stable;
    pkgs-nur = import nur { pkgs = pkgs-unstable; nurpkgs = pkgs-unstable; };
    in {
      nixosConfigurations = {
        ZenNix0s = lib.nixosSystem {
          # 架构
          system = systemSettings.system;
          # 参数传递
	      specialArgs = {
            inherit pkgs-default;
            inherit pkgs-stable;
            inherit pkgs-unstable;
            inherit pkgs-nur;
            inherit inputs;
	      };
          # 模块
	      modules = [
            ./hosts/Asus_UX8402Z
	        home-manager.nixosModules.home-manager {
	          home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.evi1_f4iry = import ./home-manager/evi1_f4iry.nix;
	          home-manager.extraSpecialArgs = {
              inherit pkgs-default;
              inherit pkgs-stable;
              inherit pkgs-unstable;
              inherit pkgs-nur;
	            inherit inputs;
              };
	        }
            ./unfree.nix
            ./modules/plasma.nix
            ./modules/basic_tools.nix
            ./modules/security.nix
            ./modules/garbage_collect.nix
            ./modules/fcitx5.nix
            ./modules/fonts.nix
            ./modules/zsh.nix
            ./modules/virt_manager.nix
            ./modules/offsec_tools.nix
            ./modules/wireshark.nix
            ./modules/flipper_zero.nix
            ./modules/offsec_SDR.nix
            ./modules/udev_rules.nix
            ./modules/android.nix
            ./modules/docker.nix
            ./modules/telegram.nix
            ./modules/gdb.nix
            ./modules/wechat-uos.nix
            ./modules/nur_basic_tools.nix
            ./modules/wps.nix
            ./modules/obsidian.nix
            ./modules/sing-box.nix
            ./modules/v2raya.nix
            ./modules/zen_kernel.nix
#            ./modules/remnote.nix
        ];
      };
    };
  };
}

