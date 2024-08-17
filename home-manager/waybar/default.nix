{
  pkgs,
  inputs,
  config,
  ...
}:
let
  css_vars = {
    "@font" = config.local.theming.font;
    "@radius" = "2px";
    "@padding" = "0px 4px";
    "@spacing" = "2px";
    "@margin" = "2px 2px";
  };
  onChange = ''
    ${
      inputs.hyprland.packages.${pkgs.hostPlatform.system}.default
    }/bin/hyprctl dispatch exec "pkill waybar;waybar &" || true
  '';
in
{
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
    enable = true;
  };
}
