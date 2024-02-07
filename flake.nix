{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    { nixpkgs
    , home-manager
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
      username = "khsaad";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit username inputs; };
          inherit system;
          modules = [ ./nixos/configuration.nix ];
        };
      };

      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit username inputs; };
          modules = [ ./home-manager ];
        };
      };
    };
}
