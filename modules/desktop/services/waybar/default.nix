{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services'.waybar;
in
{
  options.services'.waybar.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    # systemd.user.services.waybar = {
    #   after = [ "graphical-session.target" ];
    #   wantedBy = [ "graphical-session.target" ];
    #   description = "Highly customizable Wayland bar for Sway and Wlroots based compositors.";
    #   serviceConfig = {
    #     Type = "exec";
    #     ExecStart = "${lib.getExe pkgs.waybar}";
    #     ExecReload = "kill -SIGUSR2 $MAINPID";
    #     Restart = "on-failure";
    #     ExecCondition = [
    #       ''
    #         ${pkgs.systemd}/lib/systemd/systemd-xdg-autostart-condition "sway:Hyprland" ""
    #       ''
    #     ];
    #   };
    # };
    hm' = {
      imports = lib.filesystem.listFilesRecursive ./modules ++ [ ./style.nix ];
      programs.waybar = {
        enable = true;
        settings.main = {
          layer = "top";
          height = 30;
          margin-top = 0;
          margin-left = 0;
          margin-bottom = 0;
          margin-right = 0;
          reload_style_on_change = true;

          modules-left = [
            "idle_inhibitor"
            "hyprland/workspaces"
            "sway/workspaces"
          ];

          modules-center = [
            "mpris"
          ];

          modules-right = [
            "clock"
            "pulseaudio"
            "tray"
          ];
        };
      };
      # style = lib.mkAfter (builtins.readFile ./style.css);
    };
  };
}
