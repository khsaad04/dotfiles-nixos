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
  onChange = ''
    ${pkgs.procps}/bin/pgrep quickshell && ${
      inputs.hyprland.packages.${pkgs.hostPlatform.system}.default
    }/bin/hyprctl dispatch exec "pkill quickshell;quickshell &" || true
  '';
in
{
  home.packages = [ inputs.quickshell.packages.${pkgs.system}.default ];
  xdg.configFile."quickshell" = {
    inherit onChange;
    source = "${configs}";
    recursive = true;
  };
}
