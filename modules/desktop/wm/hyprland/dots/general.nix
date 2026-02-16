{
  lib,
  config,
  ...
}:
{
  wayland.windowManager.hyprland.settings.general = {
    allow_tearing = true;
    gaps_in = 10;
    gaps_out = 20;
    border_size = 2;
    layout = "dwindle";
    resize_on_border = true;

    "col.active_border" = lib.mkForce "rgb(${config.lib.stylix.colors.base07})";
    # "col.active_border" = lib.mkForce "rgba(${config.lib.stylix.colors.base07}ee)";
    # "col.active_border" = lib.mkForce "rgba(f5c2e7ee) rgba(eba0acaa) 45deg";
    # "col.active_border" = lib.mkForce "rgba(f5c2e7aa)";
    # "col.inactive_border" = lib.mkForce "rgba(1e1e2e15)";
  };
}
