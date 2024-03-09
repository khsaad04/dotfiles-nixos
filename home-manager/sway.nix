{
  lib,
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.sway = {
    config = {
      defaultWorkspace = "workspace number 1";
      startup = [
        {command = "${pkgs.wl-clipboard}/bin/wl-clipboard &";}
        {command = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &";}
        {command = "${pkgs.firefox}/bin/firefox &";}
        {command = "${pkgs.swww}/bin/swww init && ${pkgs.swww}/bin/swww img ${./wallpaper}/wp.png &";}
      ];
      fonts = {
        names = ["FiraCode Nerd Font"];
        style = "Regular";
        size = 10.0;
      };
      gaps = {
        inner = 2;
        outer = 5;
      };
      modifier = "Mod4";
      left = "h";
      down = "j";
      up = "k";
      right = "l";
      terminal = "${config.terminals.defaultTerminal}";
      menu = "${pkgs.wofi}/bin/wofi -I --show drun | ${pkgs.findutils}/bin/xargs swaymsg exec --";
      input = {
        "*" = {accel_profile = "flat";};
      };
      keybindings = let
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
        "2" = [{app_id = "firefox";}];
      };
      bars = [];
    };
    extraConfig = ''
      corner_radius 8
      default_border none

      # Status Bar:
      bar {
          swaybar_command ${pkgs.waybar}/bin/waybar
          position top
      }
    '';
  };
}
