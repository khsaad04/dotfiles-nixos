{ inputs, ... }:
let
  mkHost =
    hostName:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./${hostName}/configuration.nix
        ../modules/nixos
        ./${hostName}/hardware-configuration.nix
        inputs.disko.nixosModules.disko
        ./${hostName}/disko.nix
        { networking.hostName = "${hostName}"; }
      ];
    };
in
{
  flake.nixosConfigurations = {
    desktop = mkHost "desktop";
  };
}
