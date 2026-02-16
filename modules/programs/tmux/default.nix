{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.programs'.tmux;
  inherit (config.globals) defaultShell;
  shell = "${lib.getExe pkgs.${defaultShell}}";
in
{
  options.programs'.tmux.enable = lib.mkEnableOption { };
  config = lib.mkIf cfg.enable {
    hm' = {
      imports = [
        ./plugins/fingers.nix
      ];
      programs.tmux = {
        enable = true;
        tmuxp.enable = true;
        inherit shell;
        extraConfig = ''
          ${builtins.readFile ./dots/tmux.conf}
        '';
        plugins = with pkgs.tmuxPlugins; [
          sensible
        ];
      };

      programs.fzf.tmux.enableShellIntegration = true;

      programs.fish.shellAbbrs = {
        t = "tmux";
        ta = "tmux attach";
        tl = "tmux list-sessions";
        tk = "tmux kill-session -t";
        tn = "tmux new-session -s";
        tks = "tmux kill-server";

        tasks = "tmuxp load -y tasks";
        notes = "tmuxp load -y notes";
      };
    };
  };
}
