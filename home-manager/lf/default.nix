{
  lib,
  pkgs,
  config,
  ...
}:
{
  xdg.configFile = lib.mkIf config.programs.lf.enable { "lf/icons".source = ./icons; };
  home.packages = lib.mkIf config.programs.lf.enable [
    pkgs.chafa
    pkgs.file
    pkgs.pistol
  ];
  programs.lf = {
    enable = false;
    settings = {
      drawbox = true;
      hidden = true;
      icons = true;
      sixel = true;
      incsearch = true;
      number = true;
      relativenumber = true;
      scrolloff = 999;
    };
    previewer =
      let
        previewer = pkgs.writeShellScriptBin "previewer" ''
          case "$(file -Lb --mime-type -- "$1")" in
            image/*)
              chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
              exit 1
              ;;
            *)
              pistol "$1"
              ;;
          esac
        '';
      in
      {
        keybinding = "i";
        source = "${previewer}/bin/previewer";
      };
    commands = {
      open = ''
        ''${{
          case $(file --mime-type -Lb $f) in
          text/*) lf -remote "send $id \$$EDITOR \$fx";;
          *) for f in $fx; do $OPENER "$f" > /dev/null 2> /dev/null & done;;
          esac
        }}'';
      delete = ''
        ''${{
          set -f
          printf "$fx\n"
          printf "delete?[y/n]"
          read ans
          [ "$ans" = "y" ] && rm -rf $fx
        }}
      '';
    };
    keybindings = {
      "<enter>" = "open";
      "<delete>" = "delete";
    };
  };
}
