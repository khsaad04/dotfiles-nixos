{ lib, rustPlatform }:
let
  toml = (lib.importTOML ./Cargo.toml).package;
  pname = toml.name;
  inherit (toml) version;
in
rustPlatform.buildRustPackage {
  inherit pname version;
  cargoLock.lockFile = ./Cargo.lock;
  src = lib.cleanSource ./.;
}
