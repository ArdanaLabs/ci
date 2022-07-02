{

  imports = [
    ./hardware-configuration.nix
    ./modules/users.nix
    ./modules/deployUser.nix
    ./modules/hercules-ci-agent.nix
    ./modules/common.nix
  ];

  networking = {
    # hostId needs to be set for ZFS
    hostId = "00000000";
    hostName = "ardana-ax101";
  };

  boot = {
    supportedFilesystems = [ "zfs" ];
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        efiInstallAsRemovable = true;
        mirroredBoots = [
          {
            devices = [ "/dev/disk/by-uuid/9EBA-2A9F" ];
            path = "/boot-fallback";
          }
        ];
      };
    };
  };

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };

  system.stateVersion = "22.11"; # Did you read the comment?

}

