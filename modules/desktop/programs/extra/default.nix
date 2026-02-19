{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs'.extraPackages;
in
{
  options.programs'.extraPackages.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm'.home.packages = with pkgs; [
      OVMF
      bluetui
      gowall
      libnotify
      microfetch
      qemu
      scdl
      tealdeer
      tmux
      wiremix
      yt-dlp

      ## gtk
      d-spy # dbus gui
      easyeffects
      easytag
      # gimp3
      # pavucontrol
      librewolf

      ## qt
      # kdePackages.kdenlive
      # krita
      # puddletag
      jellyfin-desktop
      qbittorrent

      ## electron
      # obsidian
      # vesktop
      legcord
      feishin

      ## other
      # blender
      # grayjay
      # vpkedit
      # melonDS
      # mgba
      anki
      thunderbird
      picard
      calibre
      grayjay

      foot
      vpkedit

      (pkgs.symlinkJoin {
        name = "vlc";
        paths = [ pkgs.vlc ];
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/vlc \
            --unset DISPLAY
          mv $out/share/applications/vlc.desktop{,.orig}
          substitute $out/share/applications/vlc.desktop{.orig,} \
            --replace-fail Exec=${pkgs.vlc}/bin/vlc Exec=$out/bin/vlc
        '';
      })
    ];
  };
}
