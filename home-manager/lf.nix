{
  pkgs,
  inputs,
  ...
}: {
  xdg.configFile."lf/icons".source = "${inputs.lf-icons}/etc/icons.example";
  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      drawbox = true;
      hidden = true;
      icons = true;
      ignorecase = true;
      sixel = true;
    };
    previewer = let
      previewer = pkgs.writeShellScriptBin "previewer" ''
        case "$(${pkgs.file}/bin/file -Lb --mime-type -- "$1")" in
            image/*)
                ${pkgs.chafa}/bin/chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
                exit 1
                ;;
            *)
                ${pkgs.pistol}/bin/pistol "$1"
                ;;
        esac
      '';
    in {
      keybinding = "i";
      source = "${previewer}/bin/previewer";
    };
    commands = {
      open = ''        ''${{
                case $(${pkgs.file}/bin/file --mime-type -Lb $f) in
                    text/*) lf -remote "send $id \$$EDITOR \$fx";;
                    *) for f in $fx; do $OPENER "$f" > /dev/null 2> /dev/null & done;;
                esac
              }}'';
    };
    keybindings = {
      "<enter>" = "open";
    };
  };
}
