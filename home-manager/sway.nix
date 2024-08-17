{
  lib,
  pkgs,
  config,
  ...
}:
{
  home.packages = [
    pkgs.networkmanagerapplet
    pkgs.wl-clip-persist
    pkgs.autotiling-rs
    pkgs.findutils
    pkgs.grimblast
  ];
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    config = {
      defaultWorkspace = "workspace number 1";
      startup = [
        { command = "wl-clipboard &"; }
        { command = "wl-clip-persist --clipboard regular &"; }
        { command = "nm-applet --indicator &"; }
        { command = "firefox &"; }
        { command = "autotiling-rs &"; }
      ];
      fonts = {
        names = [ "${config.local.theming.font}" ];
        style = "Regular";
        size = 10.0;
      };
      seat."*" = {
        xcursor_theme = "${config.local.theming.cursor.name} ${toString config.local.theming.cursor.size}";
      };
      gaps = {
        inner = 2;
        outer = 2;
      };
      output = {
        "*" = {
          bg = "${config.local.theming.wallpaper} fill";
        };
      };
      modifier = "Mod4";
      left = "h";
      down = "j";
      up = "k";
      right = "l";
      terminal = "wezterm";
      menu = "wofi -I --show drun | xargs swaymsg exec --";
      input = {
        "type:pointer" = {
          accel_profile = "flat";
          pointer_accel = "0";
        };
        "type:keyboard" = {
          xkb_options = "caps:escape";
        };
      };
      keybindings =
        let
          cfg = config.wayland.windowManager.sway;
          inherit (cfg.config) modifier;
        in
        lib.mkOptionDefault {
          "${modifier}+space" = "exec ${cfg.config.menu}";
          "${modifier}+q" = "kill";
          "${modifier}+x" = "exec powermenu";
          "Print" = "exec grimblast --notify copysave";
          "Shift+Print" = "exec grimblast --notify copysave area";
          "XF86AudioRaiseVolume" = "exec changevolume up";
          "XF86AudioLowerVolume" = "exec changevolume down";
          "XF86AudioMute" = "exec changevolume mute";
        };
      assigns = {
        "2" = [ { app_id = "firefox"; } ];
      };
      bars = [ ];
    };
    extraConfig = ''
      corner_radius 8
      blur enable
      default_border none
      smart_gaps on
      bar {
        swaybar_command waybar
      }
    '';
  };
}
