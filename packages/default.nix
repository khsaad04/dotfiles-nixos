{
  systems = [ "x86_64-linux" ];

  perSystem =
    { pkgs, ... }:
    {
      packages = {
        formatter = pkgs.callPackage ./formatter { };
      };
    };
}
