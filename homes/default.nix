{inputs, ...}: {
  flake.homeConfigurations = {
    khsaad = let
      pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
      username = "khsaad";
    in
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit inputs pkgs-stable username;};
        modules = [
          ./khsaad/home.nix
          ../modules/home-manager
        ];
      };
  };
}
