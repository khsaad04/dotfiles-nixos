{
  lib,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [swww networkmanagerapplet grimblast];
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    extraConfigEarly = ''
      include ${pkgs.sway}/etc/sway/config.d/*
    '';
    config = {
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
      terminal = "${pkgs.foot}/bin/foot";
      menu = "${pkgs.wofi}/bin/wofi -I --show drun | ${pkgs.findutils}/bin/xargs swaymsg exec --";
      input = {
        "type:mouse" = {accel_profile = "flat";};
      };
      keybindings = let
        cfg = config.wayland.windowManager.sway;
        modifier = cfg.config.modifier;
      in
        lib.mkOptionDefault {
          "${modifier}+space" = "exec ${cfg.config.menu}";
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
    };
    extraConfig = ''
      default_border none

      # Status Bar:
      bar {
          swaybar_command ${pkgs.waybar}/bin/waybar
          position top
      }
    '';
  };
}
