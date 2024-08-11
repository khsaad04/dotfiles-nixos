{
  lib,
  config,
  inputs,
  ...
}:
{
  options.local.nixConfig.enable = lib.mkEnableOption "Enable nix configurations";
  config = lib.mkIf config.local.nixConfig.enable {
    nix = {
      channel.enable = false;
      registry.nixpkgs.flake = inputs.nixpkgs;
      nixPath = [ "nixpkgs=flake:nixpkgs" ];
      settings = {
        flake-registry = "";
        nix-path = config.nix.nixPath;
        warn-dirty = false;
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [ "khsaad" ];
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      };
    };
  };
}
