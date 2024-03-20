{ inputs, ... }: {
  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        ../../modules/nixos
        ../../homes/khsaad/configuration.nix
      ];
    };
  };
}
