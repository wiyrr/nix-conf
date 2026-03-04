{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      conf = pkgs.writeText "config.conf" ''
        ${builtins.readFile ./config.conf}
      '';
    in
    {
      packages.mangowc = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.mangowc.override { enableXWayland = false; };
        flags = {
          "-c" = "${conf}";
        };
      };
    };

  flake.modules.nixos.mango =
    { pkgs, ... }:
    {
      programs.mangowc = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.mangowc;
      };
    };
}
