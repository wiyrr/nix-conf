{
  lib,
  config,
  ...
}:
let
  cfg = config.services'.hypridle;
in
{
  options.services'.hypridle.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      # systemd.user.services.hypridle.Install.WantedBy = lib.mkForce [];
      services.hypridle = {
        enable = true;
        settings = {
          general = {
            before_sleep_cmd = "loginctl lock-session";
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            # lock_cmd = "pidof hyprlock || hyprlock";
            lock_cmd = "noctalia-shell ipc call lockScreen lock";
          };

          listener = [
            {
              timeout = 300;
              on-timeout = "brightnessctl -s set 30";
              on-resume = "brightnessctl -r";
            }
            {
              timeout = 600;
              on-timeout = "loginctl lock-session";
            }
            {
              timeout = 1800;
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on";
            }
            # {
            #   timeout = 3600;
            #   on-timeout = "sysemctl suspend";
            # }
          ];
        };
      };
    };
  };
}
