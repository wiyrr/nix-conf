{ inputs, self, ... }:
let
  inherit (self.cfg') configDir;
in
{
  perSystem =
    { pkgs, ... }:
    {
      packages.nh = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.nh;
        env = {
          "NH_FLAKE" = configDir;
        };
      };
    };
}
