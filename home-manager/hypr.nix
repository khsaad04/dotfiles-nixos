{
  config,
  pkgs,
  ...
}: let
  terminal = "${config.terminal.defaultTerminal}";
in {
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        ",preferred,auto,auto"
      ];
      exec-once = [
        "${pkgs.wl-clipboard}/bin/wl-clipboard &"
        "${pkgs.waybar}/bin/waybar &"
        "${pkgs.networkmanagerapplet}/bin/nm-applet &"
        "${pkgs.swww}/bin/swww init && ${pkgs.swww}/bin/swww img ${./wallpaper}/wp.png &"
        "${pkgs.firefox}/bin/firefox &"
      ];
      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 0;
        layout = "dwindle";
      };
      decoration = {
        rounding = 8;
        drop_shadow = "no";
        blur = {enabled = false;};
      };
      animations = {
        enabled = 0;
        bezier = [
          "in, 0.5, 1.2, 0.4, 1"
          "wss, 0.5, 1.15, 0.4, 1"
          "fader, 0.33, 1, 0.68, 1"
          "out, 0, 1, 0.6, 1"
        ];

        animation = [
          "windows, 1, 4, in"
          "border, 1, 10, default"
          "fade, 1, 7, fader"
          "workspaces, 1, 5, wss, slide"
        ];
      };
      input = {
        follow_mouse = 1;
        sensitivity = 0;
        force_no_accel = 1;
      };
      misc = {disable_hyprland_logo = true;};
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        force_split = 2;
      };
      master = {new_is_master = true;};
      windowrule = [
        "workspace 2 silent, ^(firefox)$"
        "workspace 3 silent, ^(Spotify)$"
        "workspace 4 silent, ^(discord)$"
      ];

      #KEYBINDS
      bind = let
        mod = "SUPER";
        mf = "movefocus";
        mtw = "movetoworkspace";
        mtws = "movetoworkspacesilent";
      in [
        "${mod}, RETURN, exec, ${terminal}"
        "${mod}, Q, killactive,"
        "${mod}, M, exit,"
        "${mod}, V, togglefloating,"
        "${mod}, F, fullscreen,"
        "${mod}, SPACE, exec, pkill wofi || wofi -I --show drun"
        "${mod}, T, exec, pkill waybar || waybar"
        "${mod}, X, exec, pkill wofi || powermenu"
        "${mod}, P, pseudo, # dwindle"
        "${mod}, J, togglesplit, # dwindle"

        "${mod} SHIFT, h, ${mf}, r"
        "${mod} SHIFT, j, ${mf}, d"
        "${mod} SHIFT , k, ${mf}, u"
        "${mod} SHIFT, l, ${mf}, l"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"
        "${mod}, 0, workspace, 10"

        "${mod} SHIFT, 1, ${mtw}, 1"
        "${mod} SHIFT, 2, ${mtw}, 2"
        "${mod} SHIFT, 3, ${mtw}, 3"
        "${mod} SHIFT, 4, ${mtw}, 4"
        "${mod} SHIFT, 5, ${mtw}, 5"
        "${mod} SHIFT, 6, ${mtw}, 6"
        "${mod} SHIFT, 7, ${mtw}, 7"
        "${mod} SHIFT, 8, ${mtw}, 8"
        "${mod} SHIFT, 9, ${mtw}, 9"
        "${mod} SHIFT, 0, ${mtw}, 10"

        "${mod} SHIFT CTRL, 1, ${mtws}, 1"
        "${mod} SHIFT CTRL, 2, ${mtws}, 2"
        "${mod} SHIFT CTRL, 3, ${mtws}, 3"
        "${mod} SHIFT CTRL, 4, ${mtws}, 4"
        "${mod} SHIFT CTRL, 5, ${mtws}, 5"
        "${mod} SHIFT CTRL, 6, ${mtws}, 6"
        "${mod} SHIFT CTRL, 7, ${mtws}, 7"
        "${mod} SHIFT CTRL, 8, ${mtws}, 8"
        "${mod} SHIFT CTRL, 9, ${mtws}, 9"
        "${mod} SHIFT CTRL, 0, ${mtws}, 10"

        "${mod}, mouse_down, workspace, e+1"
        "${mod}, mouse_up, workspace, e-1"
      ];
      bindm = let
        mod = "SUPER";
      in [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];
      bindr = [
        ", Print, exec, ${pkgs.grimblast}/bin/grimblast --notify copysave"
        "SHIFT, Print, exec, ${pkgs.grimblast}/bin/grimblast --notify copysave area"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, changevolume up"
        ", XF86AudioLowerVolume, exec, changevolume down"
        ", XF86AudioMute, exec, changevolume mute"
      ];
    };
  };
}
