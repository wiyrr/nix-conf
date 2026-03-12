{
  inputs,
  lib,
  self,
  ...
}:
{
  perSystem =
    { pkgs, ... }:
    let
      # implementation for loading plugins from home-manager:
      # https://github.com/nix-community/home-manager/blob/master/modules/programs/tmux.nix
      tmuxPlugin = p: "run-shell ${if lib.types.package.check p then p.rtp else p.plugin.rtp}";
      tmuxConf = pkgs.writeText "tmux.conf" ''
          # start with defaults from the Sensible plugin
          # ${tmuxPlugin pkgs.tmuxPlugins.sensible}
          set -g xterm-keys on
          setw -g extended-keys on

          set -g default-terminal "tmux-256color"
          set -ga terminal-overrides ",*:RGB"

          set -s focus-events on
          set -sg escape-time 0
          setw -g mode-keys vi
          set -gq allow-passthrough on

          set -g status-position top
          set -g status-style "bg=default"
          set -g status-justify "absolute-centre"

          set -g status-left-length 0
          set -g status-left "#[fg=#{@thm_fg} bold][#S] "
          set -ga status-left "#{?client_prefix,#[fg=#f38ba8 bold]PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[fg=#f9e2af bold]COPY ,#[fg=#a6e3a1 bold]NORMAL }}"
          set -g status-right ""

          set -g window-status-current-style "bg=default,fg=#b4befe,bold"
          set -g pane-active-border-style "bg=default fg=#b4befe"

          # Start windows and panes at 1, not 0
          set -g base-index 1
          set -g pane-base-index 1
          set-window-option -g pane-base-index 1
          set-option -g renumber-windows on

        set  -g default-terminal "tmux-256color"
        set  -g base-index      1
        setw -g pane-base-index 1

        set -g status-keys vi
        set -g mode-keys   vi


        # load plugins
        ${lib.concatMapStringsSep "\n" tmuxPlugin (
          with pkgs.tmuxPlugins;
          [
            # vim-tmux-navigator
            # yank
            # fingers
          ]
        )}

        # Allow true color support
        set -ga terminal-overrides ",*:RGB"
        # Allow changing cursor shape
        set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'

        # Activity
        setw -g monitor-activity off
        set -g visual-activity off

        # Automatically set window title
        setw -g automatic-rename on
        set -g set-titles on

        # Transparent tmux background
        set -g window-style "bg=terminal"
        set -g window-active-style "bg=terminal"

        # Set new prefix (Alt+Space)
        unbind C-b
        set -g prefix M-Space
        bind Space send-prefix

        bind -n M-n select-window -t 1
        bind -n M-t select-window -t 2
        bind -n M-h select-window -t 3
        bind -n M-p select-window -t 4
        bind -n M-d select-window -t 5

        # Move to each pane
        bind -n M-a select-pane -L
        bind -n M-e select-pane -U
        bind -n M-i select-pane -D
        bind -n M-c select-pane -R

        # Resize each pane
        bind -n M-"-" resize-pane -L 5
        bind -n M-"=" resize-pane -R 5
        bind -n M-"'" resize-pane -U 2
        bind -n M-"." resize-pane -D 2

        # Split windows
        bind | split-window -hc "#{pane_current_path}"
        bind - split-window -vc "#{pane_current_path}"

        # Swap windows
        bind -n M-"<" swap-window -d -t -1
        bind -n M-">" swap-window -d -t +1

        # Session and Window Switcher
        unbind s
        bind s choose-tree -Z -s -f '#{&&:#{!=:#{session_name},opencode},#{!=:#{session_name},notes},#{!=:#{session_name},news},#{!=:#{session_name},music},#{!=:#{session_name},mail},#{!=:#{session_name},tasks}}'
        unbind w
        bind-key -r -T prefix w run-shell 'tmux choose-tree -Nwf"##{==:##{session_name},#{session_name}}"'

        # Toggle Bar
        bind-key -n M-B set -g status

        # Fingers
        bind h run -b "#{@fingers-cli} start #{pane_id}"
        bind u run -b "#{@fingers-cli} start #{pane_id} --patterns url"
      '';
    in
    {
      packages.tmux = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.tmux;
        flags = {
          "-f" = "${tmuxConf}";
        };
      };
    };
}
