{inputs, ...}: {
  flake.nixosConfigurations = {
    desktop = let
      pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
    in
      inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs pkgs-stable;};
        system = "x86_64-linux";
        modules = [
          ./desktop/configuration.nix
          ../modules/nixos
        ];
      };
  };
}
