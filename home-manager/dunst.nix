{ pkgs, ... }:
{
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
        font = "FiraCode Nerd Font 11";
      };
      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        highlight = "#89b4fa";
        timeout = 10;
      };
      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        highlight = "#89b4fa";
        timeout = 10;
      };
      urgency_critical = {
        background = "#900000";
        foreground = "#ffffff";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
    iconTheme.name = "Papirus";
    iconTheme.package = pkgs.papirus-icon-theme;
  };
}
