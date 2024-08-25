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
