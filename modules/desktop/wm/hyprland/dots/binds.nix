{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$left" = "a";
    "$down" = "e";
    "$up" = "i";
    "$right" = "c";
    bind = [
      # Apps
      "$mod, Return, exec, uwsm-app -- $terminal"
      "$mod, Space, exec, $launcher"
      "$mod, Backspace, exec, uwsm-app -- $editor"
      "$mod, J, exec, uwsm-app -- $browser"
      # "$mod, M, exec, uwsm-app -- $explorer"
      ", Print, exec, $screenshot"

      # Noctalia-shell
      "$mod, K, exec, $clipboard"
      "$mod SHIFT, K, exec, $emoji"
      "$mod CTRL, L, exec, $logout"
      "$mod CTRL, N, exec, $notify"
      "$mod SHIFT, w, exec, $wallpaper"
      "$mod CTRL, w, exec, $randomwal"
      "$mod ALT, w, exec, $togglewal"

      "$mod CTRL,  B, exec, $bar-reload"
      "$mod SHIFT, B, exec, $bar-toggle"

      # Misc
      "$mod, Q, killactive"
      "$mod SHIFT, Q, forcekillactive"

      "$mod, V, togglefloating"
      "$mod CTRL, V, exec, hyprctl dispatch centerwindow 1"
      "$mod SHIFT, F, fullscreen"
      "$mod CTRL, F, fullscreen, 1"
      # "$mod, PERIOD, cyclenext"
      "$mod, b, togglesplit"
      "$mod, comma, pseudo"

      # Group Control
      "$mod, G, togglegroup"
      "$mod SHIFT, G, lockactivegroup, toggle"
      "ALT, TAB, changegroupactive"

      # Set sticky
      "$mod, W, pin"
      "$mod SHIFT, W, cyclenext"

      # Moving focus
      "$mod, $left, movefocus, l"
      "$mod, $up, movefocus, d"
      "$mod, $down, movefocus, u"
      "$mod, $right, movefocus, r"

      # "$mod, Left,  movefocus, l"
      # "$mod, Down,  movefocus, d"
      # "$mod, Up,    movefocus, u"
      # "$mod, Right, movefocus, r"

      # Moving windows
      # "$mod SHIFT, $left, swapwindow, l"
      # "$mod SHIFT, $up, swapwindow, d"
      # "$mod SHIFT, $down, swapwindow, u"
      # "$mod SHIFT, $right, swapwindow, r"

      "$mod SHIFT, COMMA, swapwindow, l"
      "$mod SHIFT, PERIOD, swapwindow, r"

      "$mod, N, workspace, 1"
      "$mod, T, workspace, 2"
      "$mod, H, workspace, 3"
      "$mod, P, workspace, 4"
      "$mod, D, workspace, 5"
      "$mod, SEMICOLON, workspace, 6"
      "$mod, U, workspace, 7"
      "$mod, O, workspace, 8"
      "$mod, Y, workspace, 9"

      # Moving windows to workspaces
      # "$mod SHIFT, N, movetoworkspace, 1"
      # "$mod SHIFT, T, movetoworkspace, 2"
      # "$mod SHIFT, H, movetoworkspace, 3"
      # "$mod SHIFT, P, movetoworkspace, 4"
      # "$mod SHIFT, D, movetoworkspace, 5"
      # "$mod SHIFT, SEMICOLON, movetoworkspace, 6"
      # "$mod SHIFT, U, movetoworkspace, 7"
      # "$mod SHIFT, O, movetoworkspace, 8"
      # "$mod SHIFT, Y, movetoworkspace, 9"

      # Moving windows to workspaces (silent)
      "$mod SHIFT, N, movetoworkspacesilent, 1"
      "$mod SHIFT, T, movetoworkspacesilent, 2"
      "$mod SHIFT, H, movetoworkspacesilent, 3"
      "$mod SHIFT, P, movetoworkspacesilent, 4"
      "$mod SHIFT, D, movetoworkspacesilent, 5"
      "$mod SHIFT, SEMICOLON, movetoworkspacesilent, 6"
      "$mod SHIFT, U, movetoworkspacesilent, 7"
      "$mod SHIFT, O, movetoworkspacesilent, 8"
      "$mod SHIFT, Y, movetoworkspacesilent, 9"

      # Switching workspaces
      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"

      # Moving windows to workspaces
      # "$mod SHIFT, 1, movetoworkspace, 1"
      # "$mod SHIFT, 2, movetoworkspace, 2"
      # "$mod SHIFT, 3, movetoworkspace, 3"
      # "$mod SHIFT, 4, movetoworkspace, 4"
      # "$mod SHIFT, 5, movetoworkspace, 5"
      # "$mod SHIFT, 6, movetoworkspace, 6"
      # "$mod SHIFT, 7, movetoworkspace, 7"
      # "$mod SHIFT, 8, movetoworkspace, 8"
      # "$mod SHIFT, 9, movetoworkspace, 9"

      # Moving windows to workspaces (silent)
      "$mod SHIFT, 1, movetoworkspacesilent, 1"
      "$mod SHIFT, 2, movetoworkspacesilent, 2"
      "$mod SHIFT, 3, movetoworkspacesilent, 3"
      "$mod SHIFT, 4, movetoworkspacesilent, 4"
      "$mod SHIFT, 5, movetoworkspacesilent, 5"
      "$mod SHIFT, 6, movetoworkspacesilent, 6"
      "$mod SHIFT, 7, movetoworkspacesilent, 7"
      "$mod SHIFT, 8, movetoworkspacesilent, 8"
      "$mod SHIFT, 9, movetoworkspacesilent, 9"
    ];

    binde = [
      "$mod, Minus,      resizeactive, -40 0"
      "$mod, Period,     resizeactive,  0  60"
      "$mod, APOSTROPHE, resizeactive,  0 -60"
      "$mod, Equal,      resizeactive,  40 0"

      # Moving floating windows       X  Y
      "$mod, Left,   moveactive, -40 0"
      "$mod, Down,   moveactive,  0  60"
      "$mod, Up,     moveactive,  0 -60"
      "$mod, Right,  moveactive,  40 0"

      # Switching workspaces
      "$mod, mouse_down, workspace, m-1"
      "$mod, mouse_up, workspace, m+1"
      # "$mod, Down, workspace, m-1"
      # "$mod, Up, workspace, m+1"
    ];

    bindel = [
      ", XF86AudioRaiseVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute,      exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      # ", XF86AudioRaiseVolume,  exec, noctalia-shell ipc call volume increase"
      # ", XF86AudioLowerVolume,  exec, noctalia-shell ipc call volume decrease"
      # ", XF86AudioMute,         exec, noctalia-shell ipc call volume muteOutput"
      # ", XF86AudioMicMute,      exec, noctalia-shell ipc call volume muteInput"
    ];

    # Audio playback
    bindl = [
      ", XF86AudioNext,  exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay,  exec, playerctl play-pause"
      ", XF86AudioPrev,  exec, playerctl previous"
      # ", XF86AudioNext,  exec, noctalia-shell ipc call media next"
      # ", XF86AudioPause, exec, noctalia-shell ipc call media playPause"
      # ", XF86AudioPlay,  exec, noctalia-shell ipc call media playPause"
      # ", XF86AudioPrev,  exec, noctalia-shell ipc call media previous"
    ];

    bindm = [
      "SUPER, mouse:272, movewindow"
      "SUPER, mouse:273, resizewindow"
    ];
  };
}
