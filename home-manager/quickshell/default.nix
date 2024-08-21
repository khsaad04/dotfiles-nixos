{
  pkgs,
  config,
  inputs,
  ...
}:
let
  configs = pkgs.runCommandLocal "copy-config" { } ''
    mkdir -p $out
    cd $out
    export HOME=$(pwd)

    cp -r ${./src}/* $out 
    cp ${config.programs.matugen.theme.files}/.config/quickshell/Colors.qml $out
  '';
in
{
  home.packages = [ inputs.quickshell.packages.${pkgs.system}.default ];
  xdg.configFile."quickshell" = {
    source = "${configs}";
    recursive = true;
  };
}
