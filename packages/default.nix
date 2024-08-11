pkgs: {
  sysinfoprint = pkgs.callPackage ./sysinfoprint { };
  lint = pkgs.callPackage ./lint { };
}
