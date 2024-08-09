{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.local.programs.waybar;

  css_vars = {
    "@font" = config.local.theming.font;
    "@radius" = "2px";
    "@padding" = "0px 4px";
    "@spacing" = "2px";
    "@margin" = "2px 2px";
  };
  onChange = ''
    pkill waybar && waybar
  '';
in
{
  options.local.programs.waybar.enable = lib.mkEnableOption "Enable waybar configuration";
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.playerctl ];
    xdg.configFile."waybar/config" = {
      inherit onChange;
      source = "${./config.json}";
    };
    xdg.configFile."waybar/colors.css" = {
      inherit onChange;
      source = "${config.programs.matugen.theme.files}/.config/waybar/colors.css";
    };
    xdg.configFile."waybar/style.css" = {
      inherit onChange;
      text = builtins.replaceStrings (builtins.attrNames css_vars) (builtins.attrValues css_vars) ''
        ${builtins.readFile ./style.css}
      '';
    };
    programs.waybar = {
      inherit (cfg) enable;
    };
  };
}
