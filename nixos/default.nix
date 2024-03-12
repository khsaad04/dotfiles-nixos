{inputs, ...}: {
  flake.nixosConfigurations = {
    desktop = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
        ./desktop/configuration.nix
        ../modules/nixos
        {system.stateVersion = "24.05";}
      ];
    };
  };
}
