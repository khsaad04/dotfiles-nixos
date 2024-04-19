{ mkHome, ... }: {
  flake.homeConfigurations = {
    khsaad = mkHome "khsaad";
  };
}
