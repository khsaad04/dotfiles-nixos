{ inputs, ... }:
let
  mkHome =
    homeName:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = {
        inherit inputs;
      };
      modules = [
        ./${homeName}/home.nix
        ../modules/home-manager
        inputs.nur.hmModules.nur
        {
          home = {
            username = "${homeName}";
            homeDirectory = "/home/${homeName}";
            stateVersion = "23.11";
          };
        }
      ];
    };
in
{
  flake.homeConfigurations = {
    khsaad = mkHome "khsaad";
  };
}
