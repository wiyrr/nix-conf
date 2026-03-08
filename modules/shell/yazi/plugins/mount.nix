{ lib, ... }:
{
  flake.modules.nixos.shell =
    { config, pkgs, ... }:
    let
      cfg = config.cfg'.yaziPlugins.mount;
    in
    {
      options.cfg'.yaziPlugins.mount.enable = lib.mkEnableOption { };
      config = lib.mkIf cfg.enable {
        services.udisks2.enable = true;
        programs.yazi = {
          plugins = with pkgs.yaziPlugins; {
            inherit mount;
          };
          settings.keymap.mgr.prepend_keymap = [
            {
              on = [ "M" ];
              run = "plugin mount";
              desc = "";
            }
          ];
        };
      };
    };
}
