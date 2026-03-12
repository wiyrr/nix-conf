{ inputs, self, ... }:
{
  flake =
    { lib, pkgs, ... }:
    let
      inherit (lib) mkOption types;
    in
    {
      options.cfg' = {
        cursorName = mkOption {
          type = types.str;
          default = "BreezeX-RosePine-Linux";
          description = "";
        };

        cursorSize = mkOption {
          type = types.int;
          default = 32;
          description = "";
        };

        accelProfile = mkOption {
          type = types.str;
          default = "flat";
          description = "";
        };
        sensitivity = mkOption {
          type = types.float;
          default = 0.0;
          description = "";
        };
        repeatDelay = mkOption {
          type = types.int;
          default = 175;
          description = "";
        };

        repeatRate = mkOption {
          type = types.int;
          default = 50;
          description = "";
        };

        opacity = mkOption {
          type = types.float;
          default = 1.0;
          description = "";
        };

        borderRadius = mkOption {
          type = types.int;
          default = 10;
          description = "";
        };
      };
    };
}
