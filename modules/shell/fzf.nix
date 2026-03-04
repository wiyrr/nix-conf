{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.fzf = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.fzf;
        flags = {
          "--border" = "sharp";
          "--layout" = "reverse";
          "--height" = "40%";
          "--color" =
            "bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8,fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC,marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8,selected-bg:#45475A,border:#6C7086,label:#CDD6F4";
        };
      };
    };

  flake.modules.nixos.shell = {
    # environment.variables.FZF_DEFAULT_OPTS = "--layout=reverse --height=40% --border=sharp";
    programs.fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
  };
}
