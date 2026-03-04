{
  flake.modules.nixos.mullvad-vpn =
    { pkgs, ... }:
    {
      # https://wiki.nixos.org/wiki/Mullvad_VPN
      services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn; # GUI client
      };
    };
}
