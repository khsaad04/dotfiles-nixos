{ pkgs
, config
, ...
}:
let
  clr = config.colorScheme.palette;
  radius = "8px";
  bg = "#${clr.base01}";
  widget_bg = "#${clr.base02}";
  fg = "#${clr.base05}";
  blue = "#${clr.base0D}";
  green = "#${clr.base0B}";
  peach = "#${clr.base09}";
  lavender = "#${clr.base07}";
  flamingo = "#${clr.base0F}";
in
{
  home.packages = [ pkgs.playerctl ];
  programs.waybar = {
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "left";
        "margin" = "0 0 0 0";
        "spacing" = 0;
        "modules-left" = [
          "hyprland/workspaces"
          "sway/workspaces"
          "mpris#player"
          "mpris#prev"
          "mpris#status"
          "mpris#next"
        ];
        "modules-right" = [
          "network"
          "pulseaudio"
          "cpu"
          "memory"
          "clock"
          "tray"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          "on-click" = "activate";
        };
        "mpris#player" = {
          "format" = "{player_icon}";
          "tooltip-format" = "{dynamic}";
          "interval" = 1;
          "player-icons" = {
            "spotify" = " ";
            "firefox" = " ";
          };
          "justify" = "center";
        };
        "mpris#prev" = {
          "format" = "";
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
          "format" = "";
          "on-click" = "playerctl next";
          "interval" = 1;
          "tooltip" = false;
          "justify" = "center";
        };
        "network" = {
          "format-wifi" = "󰖩 \n{signalStrength}%";
          "format-ethernet" = "󰈀 \n{bandwidthTotalBytes}";
          "tooltip-format" = "{essid}";
          "tooltip-format-disconnected" = "";
          "interval" = 1;
          "justify" = "center";
        };
        "pulseaudio" = {
          "format" = "{icon}\n{volume}%";
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
          "format" = " \n{usage}%";
          "tooltip" = false;
          "interval" = 1;
          "justify" = "center";
        };
        "memory" = {
          "format" = " \n{}%";
          "interval" = 1;
          "justify" = "center";
        };
        "clock" = {
          "format" = "{:%I\n%M\n%p}";
          "format-alt" = " {:%A, %B %d, %Y (%r)}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "interval" = 1;
          "calendar" = {
            "mode" = "month";
            "mode-mon-col" = 3;
            "on-scroll" = 1;
            "on-click-right" = "mode";
            "format" = {
              "months" = "<span color='#${clr.base0D}'><b>{}</b></span>";
              "days" = "<span color='#${clr.base05}'><b>{}</b></span>";
              "weekdays" = "<span color='#${clr.base0C}'><b>{}</b></span>";
              "today" = "<span color='#${clr.base08}'><b>{}</b></span>";
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
          "icon-size" = 15;
          "spacing" = 2;
          "justify" = "center";
        };
        "custom/power" = {
          "format" = "";
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
          font-family: Symbols Nerd Font, ${config.local.theme.font};
          font-size: 10px;
          font-weight: bold;
          border-radius: ${radius};
      }

      window#waybar {
          color: ${fg};
          background: ${bg};
          border-radius: 0px;
      }

      tooltip {
          background: ${widget_bg};
          border: 1px solid ${blue};
      }

      #workspaces button label {
          color: ${fg};
      }

      #workspaces button.active label {
          color: ${widget_bg};
      }

      #workspaces button.focused label {
          color: ${widget_bg};
      }

      #workspaces {
          background-color: ${widget_bg};
          border-radius: ${radius};
          margin-left: 5px;
      }

      #workspaces button {
          background: transparent;
          padding: 0px 6px;
          color: ${blue};
          transition: all 0.3s ease;
          border: 0;
      }

      #workspaces button.active {
          background-color: ${fg};
          transition: all 0.3s ease;
      }

      #workspaces button.focused {
          background-color: ${fg};
          transition: all 0.3s ease;
      }

      #mpris {
          color: ${bg};
          font-size: 13px;
          padding: 0px 5px;
      }

      #mpris.player {
          margin-bottom: 0px;
          margin-top: 5px;
          border-radius: ${radius} ${radius} 0 0 ;
          padding-right: 0px;
      }

      #mpris.prev {
          margin-bottom: 0px;
          border-radius: 0;
      }

      #mpris.status {
          font-size: 9px;
          margin-bottom: 0px;
          border-radius: 0;
      }

      #mpris.next {
          border-radius: 0 0 ${radius} ${radius};
          margin-bottom: 5px;
      }

      #mpris.spotify {
          background-color: #1ed760;
      }

      #mpris.firefox {
          background-color: #ee8424;
      }

      #network,
      #pulseaudio,
      #cpu,
      #memory,
      #clock,
      #tray,
      #custom-power {
          color: ${lavender};
          padding: 0px 6px;
          background-color: ${widget_bg};
          margin: 2px 0px;
          border-radius: ${radius};
      }

      #pulseaudio {
          color: ${peach};
          border-radius: ${radius} ${radius} 0 0;
          margin-bottom: 0px;
      }

      #cpu {
          color: ${green};
          border-radius: 0;
          margin: 0;
      }

      #memory {
          color: ${blue};
          border-radius: 0 0 ${radius} ${radius};
          margin-top: 0px;
      }

      #clock {
         color: ${flamingo};
      }

      #tray {
          background-color: ${widget_bg};
          border-radius: ${radius} ${radius} 0 0;
          margin-bottom: 0;
          margin-top: 5px;
      }

      #custom-power {
          font-size: 14px;
          color: ${bg};
          background-color: #${clr.base08};
          border-radius: 0 0 ${radius} ${radius};
          margin-bottom: 5px;
          margin-top: 0px;
          padding: 0px 10px 0px 6px;
      }

      #workspaces,
      #mpris,
      #network,
      #pulseaudio,
      #cpu,
      #memory,
      #clock,
      #tray,
      #custom-power {
        padding: 2px 2px;
        margin-right: 3px;
        margin-left: 3px;
      }
    '';
  };
}
