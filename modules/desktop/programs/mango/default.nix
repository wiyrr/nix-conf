{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      inherit (self.cfg')
        borderRadius
        repeatRate
        repeatDelay
        cursorName
        cursorSize
        ;

      conf = pkgs.writeText "config.conf" ''
        ${builtins.readFile ./config.conf}

        repeat_rate=${toString repeatRate}
        repeat_delay=${toString repeatDelay}
        # border_radius=${toString borderRadius}

        cursor_theme=${cursorName}
        cursor_size=${toString cursorSize}

      '';
    in
    {
      packages.mangowc = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        # package = inputs.mangowm.packages."${pkgs.stdenv.hostPlatform.system}".default;
        package = pkgs.mangowc.override { enableXWayland = false; };
        flags = {
          "-c" = "${conf}";
        };
      };
    };

  flake.modules.nixos.mango =
    { pkgs, ... }:
    {
      # imports = [ inputs.mangowm.nixosModules.mango ];
      programs.mangowc = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.mangowc;
      };
    };
}
