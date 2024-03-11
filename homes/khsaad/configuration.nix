{pkgs, ...}: {
  users = {
    users = {
      khsaad = {
        isNormalUser = true;
        initialPassword = "khsaad";
        description = "KH Saad";
        extraGroups = ["networkmanager" "wheel"];
        shell = pkgs.fish;
      };
    };
  };
}
