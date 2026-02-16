{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs'.yazi;
in
{
  options.programs'.yazi.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [
        # ./plugins/jump-to-char.nix
        ./plugins/mediainfo.nix
        # ./plugins/mount.nix
        # ./plugins/ouch.nix
        ./plugins/restore.nix
      ];
      home.packages = with pkgs; [
        fd
        ffmpeg
        ffmpegthumbnailer
        fzf
        imagemagick
        jq
        p7zip
        resvg
        ripgrep
        zoxide
      ];
      programs.yazi = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
        shellWrapperName = "y";
        plugins = with pkgs.yaziPlugins; {
          inherit
            full-border
            git
            starship
            ;
        };
        keymap = import ./binds.nix;
        # theme = import ./theme.nix;
        settings = {
          mgr = {
            layout = [
              1
              4
              3
            ];
            sort_by = "natural";
            sort_sensitive = false;
            sort_reverse = false;
            sort_dir_first = true;
            linemode = "none";
            show_hidden = false;
            show_symlink = true;
          };
          preview = {
            tab_size = 2;
            max_width = 600;
            max_height = 900;
          };
          plugin = {
            prepend_fetchers = [
              {
                id = "git";
                url = "*";
                run = "git";
              }
              {
                id = "git";
                url = "*/";
                run = "git";
              }
            ];
          };
        };
        initLua =
          # lua
          ''
            require("git"):setup({
              order = 1500,
            })
            require("starship"):setup()
            require("full-border"):setup({
              type = ui.Border.PLAIN,
            })
            -- require("zoxide"):setup({
            --   update_db = false,
            -- })
            require("session"):setup({
              sync_yanked = true,
            })
          '';
      };
    };
  };
}
