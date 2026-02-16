{
  lib,
  osConfig,
  ...
}:
let
  inherit (osConfig.globals)
    defaultTerminal
    defaultBrowser
    defaultExplorer
    defaultLauncher
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "${defaultTerminal}";
    "$editor" = "$terminal -e nvim";
    "$screenshot" = "pkill rofi || uwsm-app -- screenshot";
    "$bar" = "waybar";
    "$bar-toggle" = "killall -SIGUSR1 .waybar-wrapped";
    "$bar-reload" = "killall .waybar-wrapped; $bar";
    "$explorer" = "${defaultExplorer}";
    "$browser" = "${defaultBrowser}";

    "$clipboard" =
      "cliphist-rofi | rofi -dmenu -theme .config/rofi/theme/cliphist.rasi | cliphist decode | wl-copy";

    "$launcher" = "rofi -show drun -run-command 'uwsm app -- {cmd}'";
    # "$clipboard" =
    #   "stash list | rofi -dmenu -theme .config/rofi/theme/cliphist.rasi | stash decode | wl-copy";
    "$wallpaper" = "wallpaper";
  }
  // lib.optionalAttrs osConfig.programs'.noctalia-shell.enable {
    "$launcher" = "noctalia-shell ipc call launcher toggle";
    "$wallpaper" = "noctalia-shell ipc call wallpaper toggle";
    "$randomwal" = "noctalia-shell ipc call wallpaper random";
    # "$togglewal" = "";
    "$clipboard" = "noctalia-shell ipc call launcher clipboard";
    "$emoji" = "noctalia-shell ipc call launcher emoji";
    "$logout" = "noctalia-shell ipc call sessionMenu toggle";
    "$notify" = "noctalia-shell ipc call notifications toggleHistory";
    "$bar-toggle" = "noctalia-shell ipc call bar toggle";
  };
}
