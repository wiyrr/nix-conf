{
  flake.modules.nixos.thunar =
    { pkgs, ... }:
    {
      programs = {
        thunar = {
          enable = true;
          plugins = with pkgs; [
            thunar-volman
            thunar-archive-plugin
            thunar-media-tags-plugin
          ];
        };
      };

      services = {
        tumbler.enable = true;
        gvfs = {
          enable = true;
          package = pkgs.gvfs;
        };
      };

      environment.systemPackages = with pkgs; [
        thud
        file-roller
      ];
    };
}
