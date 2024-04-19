{ inputs, ... }: {
  imports = [
    ./desktop
  ];
  _module.args.mkHost = hostName: inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      ./${hostName}/configuration.nix
      ../modules/nixos
      ../homes/khsaad/configuration.nix
    ];
  };
}
