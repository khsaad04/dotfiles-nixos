{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.DE.sway;
in
{
  options.local.DE.sway = {
    enable = lib.mkEnableOption "sway";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.networkmanagerapplet ];
    wayland.windowManager.sway = {
      inherit (cfg) enable;
      package = pkgs.swayfx;
      checkConfig = false;
      config = {
        defaultWorkspace = "workspace number 1";
        startup = [
          { command = "wl-clipboard &"; }
          { command = "nm-applet --indicator &"; }
          { command = "firefox &"; }
          { command = "${pkgs.autotiling-rs}/bin/autotiling-rs &"; }
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
        menu = "${pkgs.wofi}/bin/wofi -I --show drun | ${pkgs.findutils}/bin/xargs swaymsg exec --";
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
            "Print" = "exec ${pkgs.grimblast}/bin/grimblast --notify copysave";
            "Shift+Print" = "exec ${pkgs.grimblast}/bin/grimblast --notify copysave area";
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
  };
}
