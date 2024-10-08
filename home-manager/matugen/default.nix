{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.matugen.nixosModules.default ];
  home.packages = lib.mkIf config.programs.matugen.enable [
    inputs.matugen.packages.${pkgs.hostPlatform.system}.default
  ];
  programs.matugen = {
    inherit (config.local.theming) wallpaper;
    jsonFormat = "hex";
    templates = {
      waybar = {
        input_path = "${./templates/waybar-colors.css}";
        output_path = "~/.config/waybar/colors.css";
      };
      quickshell = {
        input_path = "${./templates/quickshell-colors.qml}";
        output_path = "~/.config/quickshell/Colors.qml";
      };
      nvim = {
        input_path = "${./templates/nvim-colors.lua}";
        output_path = "~/.config/nvim/lua/plugins/colorscheme.lua";
      };
      gtk3 = {
        input_path = "${./templates/gtk-colors.css}";
        output_path = "~/.config/gtk-3.0/gtk.css";
      };
      gtk4 = {
        input_path = "${./templates/gtk-colors.css}";
        output_path = "~/.config/gtk-4.0/gtk.css";
      };
    };
  };
}
