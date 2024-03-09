{inputs, ...}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nur.hmModules.nur
    ./desktops
    ./terminals
    ./browsers
    ./editors
    ./programs
    ./shell
  ];
}
