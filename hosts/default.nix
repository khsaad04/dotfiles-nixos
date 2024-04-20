{ inputs, ... }:
let
  mkHost = hostName: inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      ./${hostName}/configuration.nix
      ../modules/nixos
      ../homes/khsaad/configuration.nix
    ];
  };
in
{
  flake.nixosConfigurations = {
    desktop = mkHost "desktop";
  };
}
