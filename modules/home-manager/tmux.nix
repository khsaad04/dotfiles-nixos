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
        depth = 3

        [[search_dirs]]
        path = "/home/khsaad/Documents"
        depth = 1
      '';
      packages = [ pkgs.tmux-sessionizer ];
    };
    programs.tmux = {
      enable = cfg.enable;
      sensibleOnTop = false;
      extraConfig = ''
        # Change prefix
        set -g prefix C-space
        unbind C-b
        bind C-space send-prefix

        # Fix colors for terminal
        set -g default-terminal "tmux-256color"
        set -ag terminal-overrides ",xterm-256color:RGB"

        # Increase tmux messages display duration from 750ms to 2s
        set -g display-time 2000

        # Vi key bindings in tmux command prompt (prefix + :)
        set -g status-keys vi

        # Escape time
        set -s escape-time 0

        # Focus events enabled for terminals that support them
        set -g focus-events on

        # Super useful when using "grouped sessions" and multi-monitor setup
        setw -g aggressive-resize on

        # Easier and faster switching between next/prev window
        bind C-p previous-window
        bind C-n next-window

        # Reloading .conf file
        bind r source-file ~/.config/tmux/tmux.conf \; display "Config file has be reloaded "
        
        # Disable confirmation prompt
        bind -N "Kill the current window" & kill-window
        bind -N "Kill the current pane" x kill-pane

        # Clipbaord Integration
        set -g set-clipboard on

        # Start indexing windows at 1
        set -g base-index 1

        # Better navigation
        set -g mouse on
        set-window-option -g mode-keys vi

        # Tmux-sessionizer
        bind C-o display-popup -E "tms"
        bind C-j display-popup -E "tms switch"

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
