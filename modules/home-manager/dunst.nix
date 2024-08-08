{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.local.services.dunst;
  matu = config.programs.matugen.theme.colors.colors.dark;
in
{
  options.local.services.dunst.enable = lib.mkEnableOption "Enable dunst configuration";
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.libnotify ];
    services.dunst = {
      inherit (cfg) enable;
      settings = {
        global = {
          width = 300;
          height = 300;
          origin = "top-right";
          offset = "10x10";
          notification_limit = 4;
          frame_width = 0;
          frame_color = matu.outline;
          corner_radius = 8;
          font = "${config.local.theming.font} 10";
          icon_path = "${./theming/icons}";
        };
        urgency_low = {
          background = matu.primary;
          foreground = matu.on_primary;
          highlight = matu.on_primary;
          timeout = 10;
        };
        urgency_normal = {
          background = matu.primary;
          foreground = matu.on_primary;
          highlight = matu.on_primary;
          timeout = 10;
        };
        urgency_critical = {
          background = matu.error;
          foreground = matu.on_error;
          timeout = 0;
          # default_icon = "${config.local.theming.icons.package}/share/icons/${config.local.theming.icons.name}/22x22/status/dialog-warning.svg";
          default_icon = "dialog-warning";
        };
      };
      iconTheme.name = config.local.theming.icons.name;
      iconTheme.package = config.local.theming.icons.package;
    };
  };
}
