{
  lib,
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
  onChange = ''
    ${pkgs.procps}/bin/pgrep quickshell && ${pkgs.hyprland}/bin/hyprctl dispatch exec "pkill quickshell;quickshell &" || true
  '';
in
{
  options.programs.quickshell.enable = lib.mkEnableOption "Enable Quickshell";
  config = lib.mkIf config.programs.quickshell.enable {
    home.packages = [ inputs.quickshell.packages.${pkgs.system}.default ];
    xdg.configFile."quickshell" = {
      inherit onChange;
      source = "${configs}";
      recursive = true;
    };
  };
}
