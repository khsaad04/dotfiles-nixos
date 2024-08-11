{
  writeShellApplication,
  nixfmt-rfc-style,
  deadnix,
  statix,
  stylua,
  fd,
}:
writeShellApplication {
  name = "lint";
  runtimeInputs = [
    nixfmt-rfc-style
    deadnix
    statix
    stylua
    fd
  ];
  text = ''
    if [ -z "''${1:-""}" ] || [ "$1" == "." ]; then
      fd '.*\.nix' . -x statix fix -- {} \;
      fd '.*\.nix' . -X deadnix -e -- {} \; -X nixfmt {} \;
      fd '.*\.lua' . -X stylua --indent-type Spaces --indent-width 2 {} \;
    else
      statix fix -- "$1"
      deadnix -e "$1"
      nixfmt "$1"
      stylua --indent-type Spaces --indent-width 2 "$1"
    fi
  '';
}
