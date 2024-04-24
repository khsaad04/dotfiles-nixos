{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    flake-parts.url = "github:hercules-ci/flake-parts";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./hosts
        ./homes
      ];
      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = [
              pkgs.stylua
              pkgs.home-manager
            ];
          };
          # Took this from https://github.com/gerg-l/nixos :)
          formatter = pkgs.writeShellApplication {
            name = "lint";
            runtimeInputs = [
              pkgs.nixfmt-rfc-style
              pkgs.deadnix
              pkgs.statix
              pkgs.stylua
              pkgs.fd
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
              fi
            '';
          };
        };
    };
}
