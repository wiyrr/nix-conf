{ inputs, self, ... }:
{
  flake.modules.nixos.core =
    { config, pkgs, ... }:
    let
      inherit (self.cfg') userName;
    in
    {
      imports = [
        inputs.hjem.nixosModules.default
        (inputs.nixpkgs.lib.mkAliasOptionModule [ "hj'" ] [ "hjem" "users" userName ]) # hj' -> hjem.users.<primary user>
        (inputs.nixpkgs.lib.mkAliasOptionModule [ "user'" ] [ "users" "users" userName ]) # user' -> users.users.<primary user>
        # (inputs.nixpkgs.lib.mkAliasOptionModule [ "hj'" ] [ "hjem" "users" "tsubaki" ]) # hj' -> hjem.users.<primary user>
        # (inputs.nixpkgs.lib.mkAliasOptionModule [ "user'" ] [ "users" "users" "tsubaki" ]) # user' -> users.users.<primary user>
      ];

      user' = {
        initialPassword = "123";
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.fish;
      };

      hjem = {
        clobberByDefault = true;
        linker = inputs.hjem.packages.${pkgs.stdenv.hostPlatform.system}.smfh;
      };
    };
}
