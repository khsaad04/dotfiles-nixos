{
  pkgs,
  inputs,
  ...
}: {
  xdg.configFile."lf/icons".source = "${inputs.lf-icons}/etc/icons.example";
  programs.lf = let
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
    enable = true;
    settings = {
      preview = true;
      drawbox = true;
      hidden = true;
      icons = true;
      ignorecase = true;
      sixel = true;
    };
    previewer = {
      keybinding = "i";
      source = "${previewer}/bin/previewer";
    };
  };
}
