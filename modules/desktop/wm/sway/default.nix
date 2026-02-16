{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.sway;
in
{
  options.programs'.sway = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm.waylandCompositors.sway = {
      prettyName = "Sway";
      comment = "";
      # binPath = "${pkgs.sway}/bin/sway";
      binPath = "/run/current-system/sw/bin/sway";
    };

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      xwayland.enable = false;
      extraPackages = lib.mkForce [ pkgs.autotiling-rs ];
    };

    hm' = {
      wayland.windowManager.sway = {
        enable = true;
      };
      xdg.configFile."sway/config".source = ./dots/config;
    };
  };
}
