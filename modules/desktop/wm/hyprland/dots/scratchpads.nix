{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  opacity =
    if config.wayland.windowManager.hyprland.settings.decoration.blur.enabled then "0.0" else "1.0";

  inherit (osConfig.globals) defaultShell;
  hyprland-scratchpad = pkgs.writeScriptBin "hyprland-scratchpad" (
    builtins.readFile ../scripts/hyprland-scratchpad.sh
  );
in
{
  home.packages = [ hyprland-scratchpad ];
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, X, exec, hyprland-scratchpad --toggle"
      "$mod, L, exec, hyprland-scratchpad --raise-or-run-uwsm io.github.xiaoyifang.goldendict_ng goldendict"
    ]
    ++ lib.optionals osConfig.programs'.foot.isDefault [
      "$mod, F, exec, hyprland-scratchpad --raise-or-run-uwsm foot-scratch 'footclient --app-id foot-scratch'"
      "$mod CTRL, S, exec, hyprland-scratchpad --raise-or-run-uwsm wiremix-scratch 'footclient --app-id wiremix-scratch -e wiremix -v output'"
    ]
    ++ lib.optionals osConfig.programs'.kitty.isDefault [
      "$mod, F, exec, hyprland-scratchpad --raise-or-run-uwsm kitty-scratch 'kitty --class kitty-scratch --override background_opacity=${opacity}'"
    ];

    windowrule = [
      "tag +scratch_md, match:class ^(foot-scratch)$|^(kitty-scratch)$|^(wiremix-scratch)$"
      "tag +scratch_side, match:class ^(io.github.xiaoyifang.goldendict_ng)$"
      "float on, no_anim on, size 1280 720, match:tag scratch_md"
      # "float on, no_anim on, stay_focused on, move 1468 67, size 564 1068, match:tag scratch_side"
      "float on, no_anim on, stay_focused on, move 1756 66, size 787 1355, match:tag scratch_side"
    ];
  };
}
