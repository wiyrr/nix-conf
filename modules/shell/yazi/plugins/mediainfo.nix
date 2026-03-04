{ lib, ... }:
{
  flake.modules.nixos.shell =
    { config, pkgs, ... }:
    let
      cfg = config.cfg'.yaziPlugins.mediainfo;
    in
    {
      options.cfg'.yaziPlugins.mediainfo.enable = lib.mkEnableOption { };
      config = lib.mkIf cfg.enable {

        environment.systemPackages = with pkgs; [ mediainfo ];
        programs.yazi = {
          plugins = with pkgs.yaziPlugins; {
            inherit mediainfo;
          };
          settings.yazi.plugin = {
            prepend_preloaders = [
              {
                mime = "{audio,video,image}/*";
                run = "mediainfo";
              }
              {
                mime = "application/subrip";
                run = "mediainfo";
              }
              {
                mime = "application/postscript";
                run = "mediainfo";
              }
            ];
            prepend_previewers = [
              {
                mime = "{audio,video,image}/*";
                run = "mediainfo";
              }
              {
                mime = "application/subrip";
                run = "mediainfo";
              }
              {
                mime = "application/postscript";
                run = "mediainfo";
              }
            ];
          };
        };
      };
    };
}
