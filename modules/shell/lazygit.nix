{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      conf = pkgs.writeText "config.yml" /* yaml */ ''
        gui:
          border: single

        promptToReturnFromSubprocess: true
      '';
    in
    {
      packages.lazygit = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.lazygit;
        flags = {
          "--use-config-file" = "${conf}";
        };
      };
    };
}
