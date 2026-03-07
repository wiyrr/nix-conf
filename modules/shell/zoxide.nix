{ lib, ... }:
{
  flake.modules.nixos.shell =
    { pkgs, ... }:
    let
      flags = "--cmd cd";
    in
    {
      # environment = {
      #   systemPackages = [ pkgs.zoxide ];
      #   shellAliases = {
      #     z = "zoxide query -i";
      #   };
      # };
      # programs.fish.interactiveShellInit = lib.mkAfter ''
      #   ${lib.getExe pkgs.zoxide} init fish ${flags} | source
      # '';

      programs.zoxide = {
        enable = true;
        flags = [ "--cmd cd" ];
      };
      environment.shellAliases = {
        z = "cdi";
      };
    };
}
