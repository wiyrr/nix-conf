{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.goldendict-ng = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.goldendict-ng;
        env = {
          GOLDENDICT_FORCE_WAYLAND = 1;
        };
      };
    };
}
