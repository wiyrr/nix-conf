{
  flake =
    { lib, ... }:
    let
      inherit (lib) mkOption types;
    in
    {
      options.cfg' = {
        userName = mkOption {
          type = types.str;
          default = "tsubaki";
          example = "tsubaki";
          description = "Default user name";
        };

        homeDir = mkOption {
          type = types.str;
          default = "/home/tsubaki";
          example = "/home/tsubaki";
          description = "Path of user home directory";
        };

        configDir = mkOption {
          type = types.str;
          default = "/home/tsubaki/dots";
          example = "/home/tsubaki/dots";
          description = "Path of config directory";
        };

        defaultShell = mkOption {
          type = types.str;
          default = "fish";
          example = "bash";
          description = "Default Command-line shell";
        };

        defaultEditor = mkOption {
          type = types.str;
          default = "nvim";
          example = "nano";
          description = "Default Editor";
        };

        defaultWM = mkOption {
          type = types.str;
          default = "";
          example = "sway";
          description = "Default Window Manager";
        };

        defaultTerminal = mkOption {
          type = types.str;
          default = "foot";
          example = "foot";
          description = "Default Terminal Emulator";
        };

        defaultBrowser = mkOption {
          type = types.str;
          default = "librewolf";
          example = "firefox";
          description = "Default browser";
        };

        defaultExplorer = mkOption {
          type = types.str;
          default = "thunar";
          example = "thunar";
          description = "Default explorer";
        };
      };
    };
}
