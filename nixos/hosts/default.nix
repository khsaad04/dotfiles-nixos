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
        ./${hostName}/hardware-configuration.nix
        ./${hostName}/disko.nix
        inputs.disko.nixosModules.disko
        ../.
        { networking.hostName = "${hostName}"; }
      ];
    };
in
{
  flake.nixosConfigurations = {
    desktop = mkHost "desktop";
  };
}
