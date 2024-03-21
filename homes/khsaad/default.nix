{ inputs, ... }: {
  flake.homeConfigurations = {
    khsaad =
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
          ../../modules/home-manager
        ];
      };
  };
}
