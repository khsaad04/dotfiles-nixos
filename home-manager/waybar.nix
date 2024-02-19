{config, ...}: let
  clr = config.colorScheme.palette;
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "top";
        "margin" = "5 5 0 5";
        "spacing" = 0;
        "modules-left" = [
          "hyprland/workspaces"
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
        };
        "mpris#prev" = {
          "format" = "󰒮";
          "on-click" = "playerctl previous";
          "interval" = 1;
          "tooltip" = false;
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
        };
        "mpris#next" = {
          "format" = "󰒭";
          "on-click" = "playerctl next";
          "interval" = 1;
          "tooltip" = false;
        };
        "network" = {
          "format-wifi" = "󰖩 {signalStrength}% 󰕒 {bandwidthUpBytes} 󰇚 {bandwidthDownBytes}";
          "format-ethernet" = "󰈀 {bandwidthTotalBytes}";
          "tooltip-format" = "{essid}";
          "tooltip-format-disconnected" = "";
          "interval" = 1;
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
        };
        "cpu" = {
          "format" = " {usage}%";
          "tooltip" = false;
          "interval" = 1;
        };
        "memory" = {
          "format" = " {}%";
          "interval" = 1;
        };
        "clock" = {
          "format" = "󰥔 {:%I:%M %p}";
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
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 10;
        };
        "custom/power" = {
          "format" = "";
          "on-click" = "/$HOME/.nix-profile/bin/powermenu";
          "tooltip" = false;
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
          font-family: FiraCode Nerd Font;
          font-size: 11px;
          font-weight: 800;
          border-radius: 8px;
      }

      window#waybar {
          color: #${clr.base05};
          background: transparent;
      }

      tooltip {
          background: #${clr.base02};
          border: 1px solid #${clr.base0D};
      }

      #workspaces button label {
          color: #${clr.base05};
      }

      #workspaces button.active label {
          color: #${clr.base02};
      }

      #workspaces {
          background-color: #${clr.base02};
          border-radius: 10px;
      }

      #workspaces button {
          background: transparent;
          padding: 4px 8px;
          color: #${clr.base0D};
          transition: all 0.3s ease;
          border: 0;
      }

      #workspaces button.active {
          background-color: #${clr.base05};
          transition: all 0.3s ease;
      }

      #mpris {
          color: #${clr.base00};
          font-size: 13px;
          padding: 0px 5px;
      }

      #mpris.player {
          margin-right: 0px;
          margin-left: 5px;
          border-radius: 8px 0 0 8px;
          padding-right: 0px;
      }

      #mpris.prev {
          margin-right: 0px;
          border-radius: 0;
      }

      #mpris.status {
          font-size: 9px;
          margin-right: 0px;
          border-radius: 0;
      }

      #mpris.next {
          margin-right: 0px;
          border-radius: 0 8px 8px 0;
          margin-right: 5px;
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
          color: #${clr.base00};
          padding: 0px 6px;
          background-color: #${clr.base05};
          margin: 0px 2px;
          border-radius: 8px;
      }

      #pulseaudio {
          border-radius: 8px 0 0 8px;
          margin-right: 0px;
      }

      #cpu {
          border-radius: 0;
          margin: 0;
      }

      #memory {
          border-radius: 0 8px 8px 0;
          margin-left: 0px;
      }

      #tray {
          background-color: #${clr.base02};
          border-radius: 8px 0 0 8px;
          margin-right: 0;
          margin-left: 5px;
      }

      #custom-power {
          font-size: 16px;
          color: #${clr.base00};
          background-color: #${clr.base08};
          border-radius: 0 8px 8px 0;
          margin-right: 0px;
          margin-left: 0px;
          padding: 0px 10px 0px 6px;
      }
    '';
  };
}
