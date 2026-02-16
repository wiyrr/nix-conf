{
  programs.tmux = {
    # keyMode = "vi";
    # prefix = "M-Space";
    extraConfig = ''
      # Set new prefix (Alt+Space)
      unbind C-b
      set -g prefix M-Space
      bind Space send-prefix

      # Vim mode
      setw -g mode-keys vi
      set -g status-keys vi

      bind 'v' copy-mode
      # bind -n M-v copy-mode
      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      bind -T copy-mode-vi Escape send-keys -X copy-pipe-and-cancel "wl-copy"
      bind p paste-buffer
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"

      # Config reload
      bind -n M-r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded"

      # General configs
      bind -n M-q kill-pane
      bind -n M-Q kill-window

      bind -n M-Enter split-window -v -c "#{pane_current_path}" \; select-layout
      bind -n C-S-M-Enter break-pane -a
      bind -n C-S-w kill-pane \; select-layout

      # Split windows
      bind | split-window -hc "#{pane_current_path}"
      bind "\\" split-window -fh -c "#{pane_current_path}"
      bind - split-window -vc "#{pane_current_path}"

      bind-key Z select-pane -l \; resize-pane -Z

      bind -n M-n if-shell 'tmux list-windows | grep -q "^1:"' 'select-window -t 1' 'new-window -t 1 -c "#{pane_current_path}"'
      bind -n M-t if-shell 'tmux list-windows | grep -q "^2:"' 'select-window -t 2' 'new-window -t 2 -c "#{pane_current_path}"'
      bind -n M-h if-shell 'tmux list-windows | grep -q "^3:"' 'select-window -t 3' 'new-window -t 3 -c "#{pane_current_path}"'
      bind -n M-p if-shell 'tmux list-windows | grep -q "^4:"' 'select-window -t 4' 'new-window -t 4 -c "#{pane_current_path}"'
      bind -n M-d if-shell 'tmux list-windows | grep -q "^5:"' 'select-window -t 5' 'new-window -t 5 -c "#{pane_current_path}"'

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

      # Swap windows
      bind -n M-"<" swap-window -d -t -1
      bind -n M-">" swap-window -d -t +1

      # Session and Window Switcher
      unbind s
      bind s choose-tree -Z -s -f '#{&&:#{!=:#{session_name},opencode},#{!=:#{session_name},notes},#{!=:#{session_name},news},#{!=:#{session_name},music},#{!=:#{session_name},mail},#{!=:#{session_name},tasks}}'
      unbind w
      bind-key -r -T prefix w run-shell 'tmux choose-tree -Nwf"##{==:##{session_name},#{session_name}}"'

      # Toggle Bar
      bind-key -n M-b set -g status
    '';
  };
}
