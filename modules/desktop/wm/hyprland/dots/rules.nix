{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      # Base Rules
      "float on, match:tag float"
      "float on, match:tag float_md"
      "float on, match:tag float_pin"
      "float on, match:tag float_side"

      "size 1280 720, match:tag float_md"

      "tag +float, match:title ^(.*Open Folder.*)$|^(.*Open File.*)$|^(.*Save File.*)$|^(.*Save Folder.*)$|^(.*Save Image.*)$|^(.*Save As.*)$|^(.*Open As.*)$|^(.*File Operation.*)$|^(.*File Upload.*)$|(.*Extract.*)$|(.*Extension.)$"
      "tag +float_md, match:class ^(mpv)$|^(pqiv)$"
      "tag +float_pin, match:title ^(.*Picture-in-Picture.*)$"

      "tag +browser, match:class ^(.*firefox.*)$|^(.*librewolf.*)$|^(.*zen-beta.*)$"
      "tag +game, match:class ^(.*steam_app.*)$|^(.*gamescope.*)$|^(cs2)$"
      "tag +music, match:class ^(spotify)$|^(feishin)$"

      "tag +game_launcher, match:class ^([Ss]team)$|^(net.lutris.Lutris)$"
      "tag +game_launcher, match:title ^([Ss]team)$"

      # Workspace Rules
      "workspace 5 silent, match:tag game"
      "workspace 6 silent, match:tag game_launcher"
      "workspace 7 silent, match:tag music"
      "workspace 8 silent, match:class ^(obsidian)$"
      "workspace 9 silent, match:class ^(thunderbird)$"

      "immediate on, match:tag game"
      "no_blur on, match:tag game"
      "rounding 0, match:tag game"
      "rounding 0, match:class ^([Ss]team)$"

      "no_dim on, match:tag browser"
      "no_dim on, match:pin 1"
      "opacity 1.0 1.0 override, match:tag browser"
      "opacity 1.0 1.0 override, match:class ^(.*steam.*)$"

      # Prevent suspend when a fullscreen app is open
      # "idle_inhibit fullscreen class:^(*)$"
      # "idle_inhibit fullscreen title:^(*)$"
      # "idle_inhibit fullscreen fullscreen:1"
    ];

    layerrule = [
      "no_anim on,match:namespace launcher"
      "blur on, ignore_alpha 0, match:namespace waybar"
      "blur on, ignore_alpha 0, animation slide bottom, match:namespace rofi"
      "blur on, ignore_alpha 0, animation slide bottom, match:namespace ^(.*noctalia.*)$"
      "blur on, ignore_alpha 0, animation slide right, match:namespace notifications"
      "animation fade, match:namespace hyprlock"
    ];

    #Gaming Workspace
    # workspace = "5, rounding:false, decorate:false, gapsin:0, gapsout:0, border:false, decorate:false";
  };
}
