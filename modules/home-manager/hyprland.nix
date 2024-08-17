{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
let
  cfg = config.local.DE.hyprland;
in
{
  imports = [ inputs.hyprland.homeManagerModules.default ];
  options.local.DE.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.swaybg
      pkgs.grimblast
      pkgs.networkmanagerapplet
      pkgs.wl-clip-persist
    ];
    wayland.windowManager.hyprland = {
      inherit (cfg) enable;
      systemd.variables = [ "--all" ];
      extraConfig = ''

        monitor = , preferred, auto, 1

        exec-once = wl-clipboard &
        exec-once = wl-clip-persist --clipboard regular &
        exec-once = waybar &
        exec-once = nm-applet --indicator &
        exec-once = firefox &

        exec = swaybg -i ${config.local.theming.wallpaper} &

        general {
          border_size = 0
          gaps_in = 2
          gaps_out = 2
        }

        decoration {
          drop_shadow = false
          rounding = 8
        }

        animations {
          animation = windows, 1, 3, default, popin 80%
          animation = layers, 1, 3, default
          animation = fade, 1, 3, default
          animation = workspaces, 1, 3, default
        }

        input {
          accel_profile = flat
          follow_mouse = true
          kb_options = caps:escape
          sensitivity = 0
        }

        misc {
          disable_hyprland_logo = true
        }

        dwindle {
          force_split = 2
          preserve_split = true
          pseudotile = true
          no_gaps_when_only = 1
        }

        windowrule = workspace 2 silent, ^(firefox)$
        windowrule = workspace 3 silent, ^(Spotify)$
        windowrule = workspace 4 silent, ^(discord)$

        #KEYBINDS

        ${lib.concatMapStringsSep "\n" (n: "bind=SUPER, ${toString n}, workspace, ${toString n}") (
          lib.range 1 9
        )}
        bind=SUPER, 0, workspace, 10

        ${lib.concatMapStringsSep "\n" (
          n: "bind=SUPER SHIFT, ${toString n}, movetoworkspace, ${toString n}"
        ) (lib.range 1 9)}
        bind=SUPER SHIFT, 0, movetoworkspace, 10

        ${lib.concatMapStringsSep "\n" (
          n: "bind=SUPER SHIFT CTRL, ${toString n}, movetoworkspacesilent, ${toString n}"
        ) (lib.range 1 9)}
        bind=SUPER SHIFT CTRL, 0, movetoworkspacesilent, 10

        bindm=SUPER, mouse:272, movewindow
        bindm=SUPER, mouse:273, resizewindow

        bind=SUPER, RETURN, exec, [float;tile] wezterm start --always-new-process
        bind=SUPER, Q, killactive,
        bind=SUPER, M, exit,
        bind=SUPER, V, togglefloating,
        bind=SUPER, F, fullscreen,
        bind=SUPER, SPACE, exec, pkill wofi || wofi -I --show drun
        bind=SUPER, T, exec, pkill waybar || waybar
        bind=SUPER, X, exec, pkill wofi || powermenu
        bind=SUPER, P, pseudo, # dwindle
        bind=SUPER, J, togglesplit, # dwindle
        bind=SUPER SHIFT, h, movefocus, r
        bind=SUPER SHIFT, j, movefocus, d
        bind=SUPER SHIFT , k, movefocus, u
        bind=SUPER SHIFT, l, movefocus, l
        bind=SUPER, mouse_down, workspace, e+1
        bind=SUPER, mouse_up, workspace, e-1

        binde=, XF86AudioRaiseVolume, exec, changevolume up
        binde=, XF86AudioLowerVolume, exec, changevolume down
        binde=, XF86AudioMute, exec, changevolume mute

        bindr=, Print, exec, grimblast --notify copysave
        bindr=SHIFT, Print, exec, grimblast --notify copysave area
      '';
    };
  };
}
