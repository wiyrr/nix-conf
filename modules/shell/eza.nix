{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        eza = inputs.wrappers.lib.wrapPackage {
          inherit pkgs;
          package = pkgs.eza;
          flags = {
            "--icons" = true;
            "--group-directories-first" = true;
            "--header" = true;
            "--octal-permissions" = true;
            "--hyperlink" = true;
          };
        };
      };
    };

  flake.modules.nixos.shell =
    { pkgs, ... }:
    {
      environment = {
        shellAliases = {
          t = "eza --all --long --tree";
          tree = "eza --all --long --tree";
          ls = "eza";
          ll = "eza -l";
          la = "eza -a";
          lt = "eza --tree";
          lla = "eza -la";
        };
        systemPackages = [ self.packages."${pkgs.stdenv.hostPlatform.system}".eza ];
      };
    };
}
