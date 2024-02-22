{
  pkgs,
  config,
  ...
}: let
  clr = config.colorScheme.palette;
in {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x10";
        notification_limit = 4;
        frame_width = 2;
        frame_color = "89b4fa";
        font = "FiraCode Nerd Font 10";
      };
      urgency_low = {
        background = "#${clr.base00}";
        foreground = "#${clr.base05}";
        highlight = "#${clr.base0D}";
        timeout = 10;
      };
      urgency_normal = {
        background = "#${clr.base00}";
        foreground = "#${clr.base05}";
        highlight = "#${clr.base0D}";
        timeout = 10;
      };
      urgency_critical = {
        background = "#${clr.base08}";
        foreground = "#${clr.base00}";
        frame_color = "#${clr.base00}";
        timeout = 0;
      };
    };
    iconTheme.name = "Papirus";
    iconTheme.package = pkgs.papirus-icon-theme;
  };
}
