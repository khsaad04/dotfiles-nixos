{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.DE.hyprland;
in
{
  options.local.DE.hyprland = {
    enable = lib.mkEnableOption "hyprland";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.swaybg
      pkgs.grimblast
      pkgs.networkmanagerapplet
    ];
    wayland.windowManager.hyprland = {
      inherit (cfg) enable;
      package = pkgs.hyprland;
      extraConfig = ''

        monitor = , preferred, auto, 1

        exec-once = wl-clipboard &
        exec-once = waybar &
        exec-once = nm-applet --indicator &
        exec-once = firefox &

        exec = swaybg -i ${config.local.theming.wallpaper} &
        exec = pkill waybar && waybar

        general {
          allow_tearing = true
          border_size = 0
          gaps_in = 2
          gaps_out = 2
        }

        decoration {
          blur {
            enabled = true
          }
          drop_shadow = false
          rounding = 8
        }

        animations {
          bezier = in, 0.5, 1.2, 0.4, 1
          bezier = wss, 0.5, 1.15, 0.4, 1
          bezier = fader, 0.33, 1, 0.68, 1
          bezier = out, 0, 1, 0.6, 1

          animation = windows, 1, 4, in
          animation = border, 1, 10, default
          animation = fade, 1, 7, fader
          animation = workspaces, 1, 5, wss, slide
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
        }

        windowrule = workspace 2 silent, ^(firefox)$
        windowrule = workspace 3 silent, ^(Spotify)$
        windowrule = workspace 4 silent, ^(discord)$
        windowrulev2 = immediate, class:^(Minecraft* 1.21)$

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
