{
  lib,
  pkgs,
  config,
  ...
}:
let
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  options.programs.walker.enable = lib.mkEnableOption "Enable walker launcher";
  config = lib.mkIf config.programs.walker.enable {
    home.packages = [ pkgs.walker ];
    xdg.configFile = {
      "walker/config.json".text = ''
        {
          "theme": "custom"
        }
      '';
      "walker/themes/custom.json".text = ''
        {
          "ui": {
            "anchors": {
              "top": true
            },
            "window": {
              "box": {
                "h_align": "center",
                "margins": {
                  "top": 200
                },
                "scroll": {
                  "list": {
                    "item": {
                      "activation_label": {
                        "width": 20,
                        "x_align": 1
                      },
                      "icon": {
                        "theme": "Kanagawa"
                      },
                      "spacing": 5
                    },
                    "max_height": 300,
                    "max_width": 400,
                    "min_width": 400,
                    "width": 400
                  }
                },
                "search": {
                  "spacing": 10,
                  "width": 400
                },
                "v_align": "start",
                "width": 400
              },
              "v_align": "start"
            }
          }
        }
      '';
      "walker/themes/custom.css".text = ''
        * {
          all: initial;
          font-family: ${config.local.theming.font.name}, Symbols Nerd Font;
          font-size: 14px;
          color: ${matu.on_surface};
          border-radius: 8px;
          margin: 2px;
          padding: 2px;
          border: 0px;
          background: none;
        }

        #box {
          background: ${matu.surface};
          border: 2px solid ${matu.primary};
        }

        #input > *:first-child,
        #typeahead > *:first-child {
          margin-right: 12px;
        }

        #input placeholder {
          opacity: 0.5;
        }

        child:selected,
        child:hover {
          background: ${matu.surface_container};
        }

        #sub {
          font-size: 12px;
          opacity: 0.5;
        }
      '';
    };
  };
}
