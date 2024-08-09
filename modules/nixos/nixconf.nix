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
      settings = {
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

    nix.registry = (lib.mapAttrs (_: flake: { inherit flake; })) (
      (lib.filterAttrs (_: lib.isType "flake")) inputs
    );

    nix.nixPath = [ "/etc/nix/path" ];
    environment.etc = lib.mapAttrs' (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    }) config.nix.registry;
  };
}
