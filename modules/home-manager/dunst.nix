{ pkgs, config, ... }:
let
  clr = config.local.theme.colorPalette;
in
{
  home.packages = [ pkgs.libnotify ];
  services.dunst = {
    settings = {
      global = {
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x10";
        notification_limit = 4;
        frame_width = 0;
        frame_color = "${clr.base0D}";
        corner_radius = 8;
        font = "${config.local.theme.font} 10";
      };
      urgency_low = {
        background = "${clr.base01}";
        foreground = "${clr.base05}";
        highlight = "${clr.base0D}";
        timeout = 10;
      };
      urgency_normal = {
        background = "${clr.base01}";
        foreground = "${clr.base05}";
        highlight = "${clr.base0D}";
        timeout = 10;
      };
      urgency_critical = {
        background = "${clr.base08}";
        foreground = "${clr.base00}";
        frame_color = "${clr.base00}";
        timeout = 0;
      };
    };
    iconTheme.name = config.local.theme.iconTheme.name;
    iconTheme.package = config.local.theme.iconTheme.package;
  };
}
