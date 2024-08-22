{
  writeShellApplication,
  nixfmt-rfc-style,
  deadnix,
  statix,
  stylua,
  fd,
}:
writeShellApplication {
  name = "formatter";
  runtimeInputs = [
    nixfmt-rfc-style
    deadnix
    statix
    stylua
    fd
  ];
  text = ''
    fd '.*\.nix' . -x statix fix -- {} \;
    fd '.*\.nix' . -X deadnix -e -- {} \; -X nixfmt {} \;
    fd '.*\.lua' . -X stylua --indent-type Spaces --indent-width 4 {} \;
  '';
}
