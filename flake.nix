{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur. 
      url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    disko,
    ...
  } @ inputs: {
    nixosConfigurations = {
      pc = let
        pkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
      in
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs pkgs-stable;};
          system = "x86_64-linux";
          modules = [
            ./hosts/pc
            ./modules/nixos
          ];
        };
    };

    homeConfigurations = {
      khsaad = let
        pkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
        username = "khsaad";
      in
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs pkgs-stable username;};
          modules = [
            ./users/khsaad/home.nix
            ./modules/home-manager
          ];
        };
    };

    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {};
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
