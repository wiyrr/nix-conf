{
  config,
  lib,
  ...
}:
let
  cfg = config.desktop.uwsm;
  inherit (config.globals) defaultWM;
in
{
  options.desktop.uwsm.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    programs.uwsm.enable = true;
    hm' = {
      home.shellAliases = {
        hyp = "uwsm start hyprland-uwsm.desktop";
        ugo = "uwsm start mango-uwsm.desktop";
        uws = "uwsm stop";
      };
    };
  };
}
