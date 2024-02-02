{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    settings = {
      monitor = [
        ",preferred,auto,auto"
      ];
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "${pkgs.wl-clipboard}/bin/wl-clipboard"
        "${pkgs.networkmanagerapplet}/bin/nm-applet"
        "${pkgs.swww}/bin/swww init"
        "${pkgs.swww}/bin/swww img ${./wallpaper}/wp.png"
      ];
      env = [ "XCURSOR_SIZE,24" ];
      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 0;
        layout = "dwindle";
      };
      decoration = {
        rounding = 8;
        drop_shadow = "no";
        blur = { enabled = false; };
      };
      animations = {
        enabled = 1;
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
      misc = { disable_hyprland_logo = true; };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
        force_split = 2;
      };
      master = { new_is_master = true; };
      windowrule = [
        "workspace 2 silent, ^(firefox)$"
        "workspace 3 silent, ^(Spotify)$"
        "workspace 4 silent, ^(discord)$"
      ];

      #KEYBINDS
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, RETURN, exec, foot"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, F, fullscreen,"
        "$mainMod, SPACE, exec, pkill wofi || wofi -I --show drun"
        "$mainMod, T, exec, pkill waybar || waybar"
        "$mainMod, X, exec, pkill wofi || powermenu"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"

        "$mainMod SHIFT, h, movefocus, r"
        "$mainMod SHIFT, j, movefocus, d"
        "$mainMod SHIFT , k, movefocus, u"
        "$mainMod SHIFT, l, movefocus, l"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod SHIFT CTRL, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT CTRL, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT CTRL, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT CTRL, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT CTRL, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT CTRL, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT CTRL, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT CTRL, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT CTRL, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT CTRL, 0, movetoworkspacesilent, 10"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindr = [
        ", Print, exec, screenshot"
        "SHIFT, Print, exec, screenshot select"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, changevolume up"
        ", XF86AudioLowerVolume, exec, changevolume down"
        ", XF86AudioMute, exec, changevolume mute"
      ];
    };
  };
}
