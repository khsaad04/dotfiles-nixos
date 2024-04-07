{ lib
, pkgs
, config
, ...
}:
let
  clr = config.colorScheme.palette;
  cfg = config.local.programs.tmux;
in
{
  options.local.programs.tmux = {
    enable = lib.mkEnableOption "Tmux multiplexer";
    tms.enable = lib.mkEnableOption "tmux sessionizer";
  };
  config = {
    home = lib.mkIf cfg.tms.enable {
      file."./.config/tms/config.toml".text = ''
        [[search_dirs]]
        path = "/home/khsaad/ext/code"
        depth = 2

        [[search_dirs]]
        path = "/home/khsaad/Documents"
        depth = 2
      '';
      packages = [ pkgs.tmux-sessionizer ];
    };
    programs.tmux = {
      enable = cfg.enable;
      extraConfig = ''
        # Fix colors for terminal
        set -g default-terminal "tmux-256color"
        set -ag terminal-overrides ",xterm-256color:RGB"

        # Setting ctrl + a as prefix
        set -g prefix C-space
        unbind C-b

        # Start indexing windows at 1
        set -g base-index 1

        # Renumber windows when they are closed
        set -g renumber-windows on

        # Enable mouse support for TMUX
        set -g mouse on

        # Make delay shorter
        set -sg escape-time 0

        # Making things sense
        set -g history-limit 50000
        set -g focus-events on
        set-window-option -g mode-keys vi

        # Reloading .conf file
        bind r source-file ~/.config/tmux/tmux.conf \; display "Config file has be reloaded "

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

        # Tmux-sessionizer
        bind C-o display-popup -E "${pkgs.tmux-sessionizer}/bin/tms"
        bind C-j display-popup -E "${pkgs.tmux-sessionizer}/bin/tms switch"

        # Clipbaord Integration
        set -g set-clipboard on

        # Status bar
        set -g status-interval 1
        set -g status-keys vi
        set -g status-style "fg=#${clr.base05},bg=#${clr.base01}"

        set -g status-left "#[bold,bg=#${clr.base00},fg=#${clr.base0D}]#[bold,fg=#${clr.base01},bg=#${clr.base0D}]#{session_name}#[bold,bg=#${clr.base00},fg=#${clr.base0D}]"
        set -g status-left-length 20

        set -g window-status-current-format "#[bold,bg=#${clr.base00},fg=#${clr.base0D}]#[bold,fg=#${clr.base01},bg=#${clr.base0D}]#{window_index}:#{window_name}#[bold,bg=#${clr.base00},fg=#${clr.base0D}]"
        set -g window-status-format "#[bold,bg=#${clr.base00},fg=#${clr.base02}]#[fg=#${clr.base0D},bg=#${clr.base02}]#{window_index}:#{window_name}#[bold,bg=#${clr.base00},fg=#${clr.base02}]"
        set -g window-status-separator " "
        set -g status-justify centre

        set -g status-right "#[bold,bg=#${clr.base00},fg=#${clr.base0D}]#[bold,fg=#${clr.base01},bg=#${clr.base0D}]#H#[bold,bg=#${clr.base00},fg=#${clr.base0D}]"
      '';
    };
  };
}
