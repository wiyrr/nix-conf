{
  lib,
  pkgs,
  ...
}:
{
  stylix.targets.waybar.addCss = false;
  home.packages = [ pkgs.nerd-fonts.noto ];
  programs.waybar.style =
    lib.mkAfter
      # css
      ''
        * { background: @base00; padding:0 7px; }
        #idle_inhibitor { font-size: 22pt; }
        #idle_inhibitor.activated { color: @base0C; }
        #workspaces * { font-size: 12px; padding: 1px; }
        #workspaces button { color: @base03; }
        #workspaces button.empty { color: @base01; }
        /* #workspaces button.active { color: @base07; } */
        /* #workspaces button.focused { color: @base07; } */
        #workspaces button.focused { color: #f5c2e7; }
        #workspaces button.active { color: #f5c2e7; }
        #network.disconnected { color: @base0E; }
        #pulseaudio { min-width: 65px; }
        #pulseaudio.muted { color: @base08; }
        #tray * { padding: 0; }
      '';
}
