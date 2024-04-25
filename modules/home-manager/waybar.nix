{ pkgs, config, ... }:
let
  clr = config.local.theme.colorPalette;

  radius = "2px";
  padding = "0px 4px";
  margin = "2px 2px";
  margin_raw = "2px";

  widget_bg = "${clr.base00}";
  bg = "${clr.base01}";
  fg = "${clr.base05}";
in
{
  home.packages = [ pkgs.playerctl ];
  programs.waybar = {
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
          "on-scroll-up" = "$HOME/.nix-profile/bin/changevolume up";
          "on-scroll-down" = "/$HOME/.nix-profile/bin/changevolume down";
          "on-click" = "/$HOME/.nix-profile/bin/changevolume mute";
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
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "interval" = 1;
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='${clr.base0D}'><b>{}</b></span>";
              "days" = "<span color='${clr.base05}'><b>{}</b></span>";
              "weekdays" = "<span color='${clr.base0C}'><b>{}</b></span>";
              "today" = "<span color='${clr.base08}'><b>{}</b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
          "justify" = "center";
        };
        "tray" = {
          "icon-size" = 12;
          "spacing" = 5;
          "justify" = "center";
        };
        "custom/power" = {
          "format" = "󱄅";
          "on-click" = "/$HOME/.nix-profile/bin/powermenu";
          "tooltip" = false;
          "justify" = "center";
        };
      };
    };
    style = ''
      window#waybar,
      tooltip,
      #workspaces,
      #workspaces button,
      #workspaces button label,
      #mpris,
      #network,
      #pulseaudio,
      #cpu,
      #memory,
      #clock,
      #custom-power {
          all: initial;
          font-family: ${config.local.theme.font} Regular, Symbols Nerd Font Mono, Noto Sans Bengali;
          font-size: 10px;
      }

      window#waybar {
          color: ${fg};
          background-color: ${bg};
      }

      tooltip {
          background-color: ${bg};
          border: 1px solid ${clr.base0D};
          border-radius: ${radius};
      }

      #workspaces {
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
      }

      #workspaces button {
          background: transparent;
          border-radius: ${radius};
          padding: ${padding};
          margin: ${margin};
          transition: all 0.3s ease;
          border: 0;
      }

      #workspaces button label {
          color: ${clr.base04};
      }

      #workspaces button.active label {
          color: ${fg};
      }

      #workspaces button.focused label {
          color: ${fg};
      }

      #mpris {
          color: ${bg};
          font-size: 12px;
          margin-top: ${margin_raw};
          margin-bottom: ${margin_raw};
          padding: ${padding};
      }

      #mpris.player {
          margin-right: 0px;
          margin-left: ${margin_raw};
          border-radius: ${radius} 0 0 ${radius};
      }

      #mpris.prev {
          font-size: 9px;
          margin-right: 0px;
          border-radius: 0;
      }

      #mpris.status {
          font-size: 9px;
          margin-right: 0px;
          border-radius: 0;
      }

      #mpris.next {
          font-size: 9px;
          border-radius: 0 ${radius} ${radius} 0;
          margin-right: ${margin_raw};
      }

      #mpris.spotify {
          background-color: #1ed760;
      }

      #mpris.firefox {
          background-color: #ee8424;
      }

      #window {
          margin: ${margin};
      }

      #network {
          color: ${fg};
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
          padding: ${padding};
      }

      #pulseaudio {
          color: ${fg};
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
          padding: ${padding};
      }

      #cpu {
          color: ${fg};
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
          padding: ${padding};
      }

      #memory {
          color: ${fg};
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
          padding: ${padding};
      }

      #clock {
          color: ${fg};
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
          padding: ${padding};
      }

      #tray {
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
          padding: ${padding};
      }

      #custom-power {
          font-size: 12px;
          font-weight: 400;
          color: ${clr.base0D};
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin: ${margin};
          padding: ${padding};
      }
    '';
  };
}
