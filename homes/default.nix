{ inputs, ... }:
let
  mkHome = homeName:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./${homeName}/home.nix
        ../modules/home-manager
      ];
    };
in
{
  flake.homeConfigurations = {
    khsaad = mkHome "khsaad";
  };
}
