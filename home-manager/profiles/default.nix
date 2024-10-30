{ self, inputs, ... }:
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
        ../.
        self.nixosModules.theming
        inputs.nur.hmModules.nur
        {
          home = {
            username = "${homeName}";
            homeDirectory = "/home/${homeName}";
            stateVersion = "23.11";
          };
          xdg.userDirs.enable = true;
        }
      ];
    };
in
{
  flake.homeConfigurations = {
    khsaad = mkHome "khsaad";
  };
}
