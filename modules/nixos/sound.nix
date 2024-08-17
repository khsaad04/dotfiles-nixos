{ lib, ... }:
{
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
}
