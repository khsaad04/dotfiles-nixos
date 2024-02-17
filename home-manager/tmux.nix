{
  pkgs,
  config,
  ...
}: let
  clr = config.colorScheme.palette;
in {
  home.packages = [pkgs.tmux-sessionizer];
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    prefix = "C-space";
    baseIndex = 1;
    sensibleOnTop = true;

    extraConfig = ''
      # Fix colors for terminal
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Renumber windows when they are closed
      set -g renumber-windows on

      # Set pane border style
      set -g pane-border-lines heavy

      # Making things sense
      set -g focus-events on

      # Reloading .conf file
      bind r source-file ~/.config/tmux/tmux.conf \; display " Sourced config "

      # Split Windows
      bind -n M-h split-window -h
      bind -n M-v split-window -v

      # Close Windows
      bind -n M-x kill-pane

      # Panes Navigation
      bind -n M-H select-pane -L
      bind -n M-J select-pane -D
      bind -n M-K select-pane -U
      bind -n M-L select-pane -R

      # Swap Pane Navigation:
      bind -n M-] swap-pane -D
      bind -n M-[ swap-pane -U

      # Window Manipulation
      bind -n -r C-t new-window
      bind -n -r M-. next-window
      bind -n -r M-, previous-window

      # Rename Windows
      bind -n F2 command-prompt -p " 󰑕 Rename window:" "rename-window '%%'"

      # Resize Windows
      bind -n M-Left  resize-pane -L 2
      bind -n M-Right resize-pane -R 2
      bind -n M-Down  resize-pane -D 2
      bind -n M-Up    resize-pane -U 2

      # Navigation: Windows
      bind -n M-0 select-window -t 0
      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9

      # Break a pane and move it to a new window
      bind -n M-q break-pane \; display "Moved pane to a new window "


      bind -n M-o display-popup -E "${pkgs.tmux-sessionizer}/bin/tms"
      bind -n M-j display-popup -E "${pkgs.tmux-sessionizer}/bin/tms switch"

      # Clipbaord Integration
      set -g set-clipboard on

      # Status bar
      set -g status-style "bg=#${clr.base01},fg=#${clr.base05}"
      set -g status-left "#[fg=#${clr.base00},bold,bg=#${clr.base0D}] #S "
      set -g status-left-length 20
      set -g status-right "#[fg=#${clr.base00},bold,bg=#${clr.base0D}] #{pane_current_path} "
    '';
  };
}
