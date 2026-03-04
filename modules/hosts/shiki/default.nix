{
  inputs,
  lib,
  self,
  ...
}:
{
  flake.nixosConfigurations.shiki = inputs.nixpkgs.lib.nixosSystem {
    modules = [ self.modules.nixos.shiki ];
  };
  flake.modules.nixos.shiki =
    { pkgs, ... }:
    {
      imports = [
        self.modules.nixos.core
        self.modules.nixos.amdgpu
        self.modules.nixos.desktop

        self.modules.nixos.fcitx5
        self.modules.nixos.keyd

        self.modules.nixos.steam
        self.modules.nixos.gamemode

        # disko
        inputs.disko.nixosModules.disko
        self.diskoConfigurations.shiki
      ];

      networking = {
        hostName = "shiki";
        dhcpcd.enable = lib.mkForce false;
        interfaces.eno1.ipv4.addresses = [
          {
            address = "192.168.0.144";
            prefixLength = 24;
          }
        ];
        defaultGateway = "192.168.0.1";
        nameservers = [
          "192.168.0.1"
          "194.242.2.2"
          "1.1.1.1"
          "1.0.0.1"
        ];
      };

      hardware.bluetooth.enable = true;

      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
          timeout = 0;
        };
        kernelPackages = pkgs.linuxPackages_zen;
        kernelParams = [ "video=DP-2:2560x1440@144" ];
      };
    };
}
