{ pkgs, config, ... }:
let
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  home.packages = [ pkgs.libnotify ];
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        origin = "top-right";
        offset = "10x10";
        frame_width = 0;
        frame_color = matu.outline;
        corner_radius = 8;
        font = "${config.local.theming.font} 10";
        icon_path = "${./theming/icons}";
        markup = "full";
        format = ''<b>%a</b>\n%s <i>%b</i>'';
      };
      urgency_low = {
        background = matu.surface_container_highest;
        foreground = matu.primary;
        highlight = matu.primary;
        timeout = 10;
      };
      urgency_normal = {
        background = matu.surface_container_highest;
        foreground = matu.primary;
        highlight = matu.primary;
        timeout = 10;
      };
      urgency_critical = {
        background = matu.error;
        foreground = matu.on_error;
        timeout = 0;
      };
    };
    iconTheme.name = config.local.theming.icons.name;
    iconTheme.package = config.local.theming.icons.package;
  };
}
