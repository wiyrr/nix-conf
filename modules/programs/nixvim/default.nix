{
  config,
  inputs,
  lib,
  ...
}:
let
  cfg = config.programs'.nixvim;
in
{
  options.programs'.nixvim.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [ inputs.nixvim.homeModules.nixvim ];
      stylix.targets.nixvim = {
        enable = false;
        plugin = "base16-nvim";
      };

      programs.nixvim = {
        enable = true;
        imports = lib.filesystem.listFilesRecursive ./plugins ++ [
          inputs.nixvim.homeModules.nixvim
          ./binds.nix
          ./options.nix
        ];

        plugins = {
          lualine.enable = true;
          lsp.enable = true;
        };
      };
    };
  };
}
