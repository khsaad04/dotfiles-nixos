{ mkHost, ... }: {
  flake.nixosConfigurations = {
    desktop = mkHost "desktop";
  };
}
