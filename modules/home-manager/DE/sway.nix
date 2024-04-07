{ lib
, pkgs
, config
, ...
}:
let
  cfg = config.local.DE.sway;
in
{
  options.local.DE.sway = {
    enable = lib.mkEnableOption "sway";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = cfg.enable;
      package = null;
      systemd.enable = true;
      config = {
        defaultWorkspace = "workspace number 1";
        startup = [
          { command = "${pkgs.wl-clipboard}/bin/wl-clipboard &"; }
          { command = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &"; }
          { command = "firefox &"; } # So uhh read ./hyprland.nix
        ];
        fonts = {
          names = [ "FiraCode Nerd Font" ];
          style = "Regular";
          size = 10.0;
        };
        gaps = {
          inner = 2;
          outer = 5;
        };
        output = {
          "*" = {
            bg = "~/Downloads/wallhaven-l8vp7y_1366x768.png fill";
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
          "*" = { accel_profile = "flat"; };
        };
        keybindings =
          let
            cfg = config.wayland.windowManager.sway;
            modifier = cfg.config.modifier;
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
          "2" = [{ app_id = "firefox"; }];
        };
        bars = [ ];
      };
      extraConfig = ''
        corner_radius 8
        default_border none

        # Status Bar:
        bar {
            swaybar_command waybar
            position top
        }
      '';
    };

    systemd.user.services = {
      autotiling = {
        Install.WantedBy = [ "graphical-session.target" ];
        Unit.Description = "Autotiling";
        Service.ExecStart = "${pkgs.autotiling-rs}/bin/autotiling-rs";
      };
    };
  };
}
