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
  home.packages = lib.mkIf config.services.dunst.enable [ pkgs.libnotify ];
  services.dunst = {
    settings = {
      global = {
        origin = "bottom-right";
        offset = "10x10";
        frame_width = 0;
        frame_color = matu.outline;
        corner_radius = 8;
        font = "${config.local.theming.font.name} ${toString config.local.theming.font.size}";
        icon_path = "${config.local.theming.icon.extra_path}";
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
    iconTheme.name = config.local.theming.icon.name;
    iconTheme.package = config.local.theming.icon.package;
  };
}
