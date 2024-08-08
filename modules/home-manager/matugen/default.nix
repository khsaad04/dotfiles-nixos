{
  pkgs,
  inputs,
  config,
  ...
}:
{
  home.packages = [ inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default ];
  imports = [ inputs.matugen.nixosModules.default ];
  programs.matugen = {
    enable = true;
    package = inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default;
    inherit (config.local.theming) wallpaper;
    jsonFormat = "hex";
    templates = {
      waybar = {
        input_path = "${./templates/waybar-colors.css}";
        output_path = "~/.config/waybar/colors.css";
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
