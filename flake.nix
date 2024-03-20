{
  description = "KHSaad's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # woke up and saw waybar is broken
    nixpkgs-waybar.url = "github:nixos/nixpkgs/49f83b701e7939079c529f378c79fa8544f4db72";
    flake-parts.url = "github:hercules-ci/flake-parts";
    hyprland = {
      url = "github:hyprwm/Hyprland/a42b984f51a00e88a13a45e1b5e9e3d4ec470254";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:misterio77/nix-colors";
    lf-icons = {
      url = "github:gokcehan/lf";
      flake = false;
    };
  };

  outputs = { flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./hosts
        ./homes
      ];
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, ... }: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            lua-language-server
            stylua
            nil
            home-manager
          ];
        };
        formatter = pkgs.nixpkgs-fmt;
      };
    };
}
