{ self, ... }:

{
  flake.modules.nixos.core =
    { lib, ... }:
    {
      imports = [
        self.modules.nixos.doas
        self.modules.nixos.mullvad-vpn
        self.modules.nixos.openssh
        self.modules.nixos.shell
      ];

      zramSwap.enable = lib.mkDefault true;
      time.timeZone = lib.mkDefault "Asia/Tokyo";
      system.stateVersion = lib.mkDefault "25.05";
    };
}
