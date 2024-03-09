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
    self,
    nixpkgs,
    home-manager,
    disko,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    pkgs-stable = import nixpkgs {inherit system;};
  in {
    nixosConfigurations = {
      pc = let
        hostname = "pc";
      in
        nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs pkgs-stable hostname;};
          inherit system;
          modules = [
            ./hosts/pc/configuration.nix
            ./modules/nixos
          ];
        };
    };

    homeConfigurations = {
      khsaad = let
        username = "khsaad";
      in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit inputs pkgs-stable username;};
          modules = [
            ./users/khsaad/home.nix
            ./modules/home-manager
          ];
        };
    };

    devShells.${system}.default = pkgs.mkShell {};
    formatter.${system} = pkgs.alejandra;
  };
}
