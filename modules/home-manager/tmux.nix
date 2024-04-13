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
        
        # Change prefix
        set -g prefix C-space

        # Increase tmux messages display duration from 750ms to 2s
        set -g display-time 2000

        # Vi key bindings in tmux command prompt (prefix + :)
        set -g status-keys vi

        # Reloading .conf file
        bind r source-file ~/.config/tmux/tmux.conf \; display "Config file has be reloaded "
        
        # Disable confirmation prompt
        bind-key -N "Kill the current window" & kill-window
        bind-key -N "Kill the current pane" x kill-pane

        # Clipbaord Integration
        set -g set-clipboard on

        # Start indexing windows at 1
        set -g base-index 1

        # Tmux-sessionizer
        bind C-o display-popup -E "${pkgs.tmux-sessionizer}/bin/tms"
        bind C-j display-popup -E "${pkgs.tmux-sessionizer}/bin/tms switch"

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
