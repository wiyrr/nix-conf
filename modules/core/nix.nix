{ inputs, lib, ... }:
{
  flake.modules.nixos.core = {
    nixpkgs.config = {
      allowBroken = lib.mkDefault false;
      allowUnfree = lib.mkDefault true;
    };

    nix = {
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
        trusted-users = [
          "@wheel"
        ];
      };
    };
  };
}
