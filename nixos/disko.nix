{
  disko.devices = {
    disk = {
      sda = {
        type = "disk";
        device = "/dev/disk/by-id/ata-HS-SSD-C100_120G_30056630062";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = ["-f"]; # Override existing partition
                # Subvolumes must set a mountpoint in order to be mounted,
                # unless their parent is mounted
                subvolumes = {
                  "/root" = {
                    mountOptions = ["compress=zstd" "noatime"];
                    mountpoint = "/";
                  };

                  "/home" = {
                    mountOptions = ["compress=zstd" "noatime"];
                    mountpoint = "/home";
                  };

                  "/nix" = {
                    mountOptions = ["compress=zstd" "noatime"];
                    mountpoint = "/nix/store";
                  };

                  "/swap" = {
                    mountOptions = ["noatime"];
                    mountpoint = "/.swapvol";
                    swap = {
                      swapfile.size = "12288M";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
