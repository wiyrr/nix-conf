{
  flake.modules.nixos.shell =
    { pkgs, ... }:
    {
      cfg'.yaziPlugins = {
        # jump-to-char.enable = true;
        mediainfo.enable = true;
        # mount.enable = true;
        # ouch.enable = true;
        restore.enable = true;
      };

      programs.yazi = {
        enable = true;
        plugins = with pkgs.yaziPlugins; {
          inherit
            full-border
            git
            starship
            ;
        };

        settings = {
          yazi = {
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
          theme = fromTOML (builtins.readFile ./theme.toml);
        };

        initLua = pkgs.writeText "init.lua" /* lua */ ''
          require("git"):setup({
            order = 1500,
          })
          require("starship"):setup()
          require("full-border"):setup({
            type = ui.Border.PLAIN,
          })
          require("session"):setup({
            sync_yanked = true,
          })
        '';
      };

      # shell integrations
      programs.bash.interactiveShellInit = /* sh */ ''
        function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
          fi
          rm -f -- "$tmp"
        }
      '';

      programs.fish.interactiveShellInit = /* fish */ ''
        function y
          set -l tmp (mktemp -t "yazi-cwd.XXXXX")
          command yazi $argv --cwd-file="$tmp"
          if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
          end
          rm -f -- "$tmp"
        end
      '';
    };
}
