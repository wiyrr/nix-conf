{ lib, ... }:
{
  flake.modules.nixos.shell =
    { config, pkgs, ... }:
    let
      cfg = config.cfg'.yaziPlugins.jump-to-char;
    in
    {
      options.cfg'.yaziPlugins.jump-to-char.enable = lib.mkEnableOption { };
      config = lib.mkIf cfg.enable {
        programs.yazi = {
          plugins = with pkgs.yaziPlugins; {
            inherit jump-to-char;
          };
          settings.keymap.mgr.prepend_keymap = [
            {
              on = [ "f" ];
              run = "plugin jump-to-char";
              desc = "Jump to char";
            }
          ];
        };
      };
    };
}
