{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services'.swww;
in
{
  options.services'.swww.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ swww ];
    systemd.user.services.swww = {
      after = [ "graphical-session.target" ];
      wantedBy = [ "graphical-session.target" ];
      description = "swww, a Solution to your Wayland Wallpaper Woes";
      serviceConfig = {
        Type = "exec";
        ExecStart = "${lib.getExe pkgs.swww}";
        ExecReload = "kill -SIGUSR2 $MAINPID";
        Restart = "on-failure";
        ExecCondition = [
          ''
            ${pkgs.systemd}/lib/systemd/systemd-xdg-autostart-condition "Hyprland" ""
          ''
        ];
      };
    };
    # hm'.services.swww.enable = true;
  };
}
