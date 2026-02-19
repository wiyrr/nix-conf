{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.desktop.wayland;
  sessionVariables = {
    # Force GTK to use wayland
    GDK_BACKEND = "wayland,x11,*";
    CLUTTER_BACKEND = "wayland";
    SDL_VIDEODRIVER = "wayland";
    # Force QT to use wayland
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = lib.mkDefault "wayland";
    NIXOS_OZONE_WL = "1";
  };
in
{
  options.desktop.wayland.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      xdg = {
        mimeApps.enable = true;
        portal = {
          enable = true;
          config.common.default = "gtk";
          extraPortals = [
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-wlr
          ];
          xdgOpenUsePortal = true;
        };
      };

      home = {
        inherit sessionVariables;
        packages =
          let
            screenshot = pkgs.writeShellScriptBin "screenshot" ''
              #!/usr/bin/env sh
              mkdir -p /home/tsubaki/Pictures/screenshots && grim "/home/tsubaki/Pictures/screenshots/$(date +'%m-%d-%Y-%H%M%S').png"
            '';
            screenshotsel = pkgs.writeShellScriptBin "screenshotsel" ''
              #!/usr/bin/env sh
              mkdir -p /home/tsubaki/Pictures/screenshots && grim -g "$(slurp)" "/home/tsubaki/Pictures/screenshots/$(date +'%m-%d-%Y-%H%M%S').png"
            '';
            screenshotselcopy = pkgs.writeShellScriptBin "screenshotselcopy" ''
              #!/usr/bin/env sh
              grim -g "$(slurp)" - | wl-copy
            '';
          in
          [
            pkgs.grim
            pkgs.slurp
            pkgs.wev
            # pkgs.wl-clipboard-rs

            screenshot
            screenshotsel
            screenshotselcopy
          ];
      };
    };
  };
}
