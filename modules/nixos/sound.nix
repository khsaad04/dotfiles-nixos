{ lib, config, ... }:
{
  options.local.sound.enable = lib.mkEnableOption "Enable sound on the host using pipewire";
  config = lib.mkIf config.local.sound.enable {
    security.rtkit.enable = true;
    services = {
      pipewire = {
        enable = lib.mkDefault true;
        jack.enable = true;
        wireplumber.enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        pulse.enable = true;
      };
    };
  };
}
