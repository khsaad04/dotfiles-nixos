{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
    rycee-expressions = {
      url = "gitlab:rycee/nur-expressions";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    username = "khsaad";
    pkgs = import nixpkgs {inherit system;};
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit username inputs;};
        inherit system;
        modules = [./nixos/configuration.nix];
      };
    };

    homeConfigurations = let
      inherit (import "${inputs.rycee-expressions}" {inherit pkgs;}) firefox-addons;
    in {
      "${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit username inputs firefox-addons;};
        modules = [./home-manager/home.nix];
      };
    };
  };
}
