{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.bat = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.bat;
        flags = {
          "--theme" = "Catppuccin Mocha";
        };
      };
    };
}
