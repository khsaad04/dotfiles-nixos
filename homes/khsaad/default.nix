{ inputs, ... }: {
  flake.homeConfigurations = {
    khsaad =
      let
        username = "khsaad";
      in
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs username; };
        modules = [
          ./home.nix
          ../../modules/home-manager
        ];
      };
  };
}
