{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.mango;
in
{
  imports = [ inputs.mango.nixosModules.mango ];

  options.programs'.mango = {
    enable = lib.mkEnableOption { };
    isDefault = lib.mkEnableOption { };
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm.waylandCompositors.mango = {
      prettyName = "Mango";
      comment = "A streamlined but feature-rich Wayland compositor";
      binPath = "/run/current-system/sw/bin/mango";
    };

    programs.mango = {
      enable = true;
    };

    xdg.portal.config.mango.default = lib.mkForce [
      "wlr"
      "gtk"
    ];

    environment.systemPackages = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];

    hm' = {
      imports = [ inputs.mango.hmModules.mango ];
      home.packages = with pkgs; [
      ];
    };
  };
}
