{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
    nur.url = "github:nix-community/NUR";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    hostname = "nixos";
    username = "khsaad";
    pkgs = import nixpkgs {inherit system;};
    pkgs-stable = import nixpkgs {inherit system;};
  in {
    formatter = pkgs.alejandra;
    nixosConfigurations = {
      ${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit username inputs pkgs-stable;};
        inherit system;
        modules = [./nixos/configuration.nix];
      };
    };

    homeConfigurations = {
      "${username}@${hostname}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit username inputs pkgs-stable;};
        modules = [./home-manager/home.nix];
      };
    };

    devShells.${system}.default = pkgs.mkShell {};
  };
}
