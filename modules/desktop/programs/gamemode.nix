{
  flake.modules.nixos.gamemode =
    { lib, pkgs, ... }:
    {
      user'.extraGroups = [ "gamemode" ];
      programs.gamemode = {
        enable = true;
        settings = {
          general = {
            renice = 19;
          };
          gpu = {
            apply_gpu_optimisations = "accept-responsibility";
            gpu_device = 0;
            amd_performance_level = "high";
          };
          custom = {
            start = "${lib.getExe pkgs.libnotify} -u low 'GameMode started'";
            end = "${lib.getExe pkgs.libnotify} -u low 'GameMode ended'";
          };
        };
      };
    };
}
