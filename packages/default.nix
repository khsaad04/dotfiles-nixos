{
  systems = [ "x86_64-linux" ];

  perSystem =
    { pkgs, ... }:
    {
      packages = {
        formatter = pkgs.callPackage ./formatter.nix { };
        changevolume = pkgs.callPackage ./changevolume.nix { };
        powermenu = pkgs.callPackage ./powermenu.nix { };
      };
    };
}
