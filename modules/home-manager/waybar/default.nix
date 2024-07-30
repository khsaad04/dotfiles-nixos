{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.local.programs.waybar;
  clr = config.local.theming.colorPalette;

  css_vars = {
    "@font" = config.local.theming.font;
    "@radius" = "2px";
    "@padding" = "0px 4px";
    "@spacing" = "2px";
    "@margin" = "2px 2px";
    "@widget_bg" = "${clr.base00}";
    "@bg" = "${clr.base01}";
    "@fg" = "${clr.base05}";
    "@blue" = "${clr.base0D}";
    "@surface2" = "${clr.base04}";
  };
in
{
  options.local.programs.waybar.enable = lib.mkEnableOption "Enable waybar configuration";
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.playerctl ];
    programs.waybar = {
      inherit (cfg) enable;
      settings = {
        mainBar = {
          "layer" = "top";
          "position" = "top";
          "margin" = "0 0 0 0";
          "spacing" = 0;
          "modules-left" = [
            "custom/power"
            "hyprland/workspaces"
            "sway/workspaces"
            "mpris#player"
            "mpris#prev"
            "mpris#status"
            "mpris#next"
            "hyprland/window"
            "sway/window"
          ];
          "modules-right" = [
            "network"
            "pulseaudio"
            "cpu"
            "memory"
            "clock"
            "tray"
          ];
          "hyprland/workspaces" = {
            "on-click" = "activate";
            "on-scroll-up" = "hyprctl dispatch workspace e+1";
            "on-scroll-down" = "hyprctl dispatch workspace e-1";
          };
          "mpris#player" = {
            "format" = "{player_icon}";
            "tooltip-format" = "{dynamic}";
            "interval" = 1;
            "player-icons" = {
              "spotify" = "";
              "firefox" = "󰈹";
            };
            "justify" = "center";
          };
          "mpris#prev" = {
            "format" = "󰒮";
            "on-click" = "playerctl previous";
            "interval" = 1;
            "tooltip" = false;
            "justify" = "center";
          };
          "mpris#status" = {
            "format" = "{status_icon}";
            "status-icons" = {
              "playing" = "";
              "paused" = "";
            };
            "on-click" = "playerctl play-pause";
            "interval" = 1;
            "tooltip" = false;
            "justify" = "center";
          };
          "mpris#next" = {
            "format" = "󰒭";
            "on-click" = "playerctl next";
            "interval" = 1;
            "tooltip" = false;
            "justify" = "center";
          };
          "network" = {
            "format-wifi" = "󰖩 {signalStrength}%";
            "format-ethernet" = "󰈀 {bandwidthTotalBytes}";
            "tooltip-format" = "{essid}";
            "tooltip-format-disconnected" = "";
            "interval" = 1;
            "justify" = "center";
          };
          "pulseaudio" = {
            "format" = "{icon} {volume}%";
            "format-muted" = "󰝟";
            "tooltip" = false;
            "format-icons" = {
              "headphone" = "󰋋";
              "default" = [
                ""
                ""
                ""
              ];
            };
            "on-scroll-up" = "changevolume up";
            "on-scroll-down" = "changevolume down";
            "on-click" = "changevolume mute";
            "justify" = "center";
          };
          "cpu" = {
            "format" = " {usage}%";
            "tooltip" = false;
            "interval" = 1;
            "justify" = "center";
          };
          "memory" = {
            "format" = " {}%";
            "interval" = 1;
            "justify" = "center";
          };
          "clock" = {
            "format" = "{:%A, %B %d, %Y (%r)}";
            "tooltip-format" = "";
            "interval" = 1;
            "justify" = "center";
          };
          "tray" = {
            "icon-size" = 12;
            "spacing" = 5;
            "justify" = "center";
          };
          "custom/power" = {
            "format" = "󱄅";
            "on-click" = "powermenu";
            "tooltip" = false;
            "justify" = "center";
          };
        };
      };
      style = builtins.replaceStrings (builtins.attrNames css_vars) (builtins.attrValues css_vars) ''
        ${builtins.readFile ./style.css}
      '';
    };
  };
}
