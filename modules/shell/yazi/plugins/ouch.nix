{ lib, ... }:
{
  flake.modules.nixos.shell =
    { config, pkgs, ... }:
    let
      cfg = config.cfg'.yaziPlugins.ouch;
    in
    {
      options.cfg'.yaziPlugins.ouch.enable = lib.mkEnableOption { };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ pkgs.ouch ];
        programs.yazi = {
          plugins = with pkgs.yaziPlugins; {
            inherit ouch;
          };
          settings = {
            yazi = {
              opener.extract = [
                {
                  run = "ouch d -y %*";
                  desc = "Extract here with ouch";
                  for = "windows";
                }
                {
                  run = ''ouch d -y "$@"'';
                  desc = "Extract here with ouch";
                  for = "unix";
                }
              ];

              plugin = {
                prepend_previewers = [
                  {
                    mime = "application/*zip";
                    run = "ouch";
                  }
                  {
                    mime = "application/x-tar";
                    run = "ouch";
                  }
                  {
                    mime = "application/x-bzip2";
                    run = "ouch";
                  }
                  {
                    mime = "application/x-7z-compressed";
                    run = "ouch";
                  }
                  {
                    mime = "application/x-rar";
                    run = "ouch";
                  }
                  {
                    mime = "application/vnd.rar";
                    run = "ouch";
                  }
                  {
                    mime = "application/x-xz";
                    run = "ouch";
                  }
                  {
                    mime = "application/xz";
                    run = "ouch";
                  }
                  {
                    mime = "application/x-zstd";
                    run = "ouch";
                  }
                  {
                    mime = "application/zstd";
                    run = "ouch";
                  }
                  {
                    mime = "application/java-archive";
                    run = "ouch";
                  }
                ];
              };
            };

            keymap.mgr.prepend_keymap = [
              {
                run = "plugin ouch";
                on = [ "C" ];
                desc = "Compress with ouch";
              }
            ];
          };
        };
      };
    };
}
