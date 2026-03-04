{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.starship =
        (inputs.wrappers.wrapperModules.starship.apply {
          inherit pkgs;
          settings = {
            character = {
              success_symbol = "[➜](bold green)";
              error_symbol = "[➜](bold red)";
              vimcmd_symbol = "[v](bold green)";
              vimcmd_visual_symbol = "[v](bold yellow)";
              vimcmd_replace_symbol = "[v](bold purple)";
              vimcmd_replace_one_symbol = "[v](bold purple)";
            };
          };
        }).wrapper;
    };

  flake.modules.nixos.shell =
    { lib, pkgs, ... }:
    {
      programs.fish.interactiveShellInit = lib.mkAfter ''
        ${lib.getExe self.packages."${pkgs.stdenv.hostPlatform.system}".starship} init fish | source
      '';
    };
}
