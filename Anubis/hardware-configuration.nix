{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "uas" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/ubuntu--vg-ubuntu--lv";
      fsType = "ext4";
    };

  fileSystems."/media/usb-stick" =
    { device = "systemd-1";
      fsType = "autofs";
    };

  fileSystems."/snap/core20/2682" =
    { device = "/var/lib/snapd/snaps/core20_2682.snap";
      fsType = "squashfs";
      options = [ "loop" ];
    };

  fileSystems."/snap/core20/2686" =
    { device = "/var/lib/snapd/snaps/core20_2686.snap";
      fsType = "squashfs";
      options = [ "loop" ];
    };

  fileSystems."/snap/lxd/36918" =
    { device = "/var/lib/snapd/snaps/lxd_36918.snap";
      fsType = "squashfs";
      options = [ "loop" ];
    };

  fileSystems."/snap/snapd/25577" =
    { device = "/var/lib/snapd/snaps/snapd_25577.snap";
      fsType = "squashfs";
      options = [ "loop" ];
    };

  fileSystems."/snap/snapd/25935" =
    { device = "/var/lib/snapd/snaps/snapd_25935.snap";
      fsType = "squashfs";
      options = [ "loop" ];
    };

  fileSystems."/snap/lxd/36558" =
    { device = "/var/lib/snapd/snaps/lxd_36558.snap";
      fsType = "squashfs";
      options = [ "loop" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/6679ded4-522e-4a5c-942f-5951be55f5df";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/C1E3-2FE5";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  fileSystems."/var/lib/docker/overlay2/5e2b7846bc9c843c600c934f25b4e2440af085c5dc1fd4cacfe6b96a461a4c1d/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/55386a274329651b11e16099dc55b40ecc261ebf7192d158a87c2efca8c394c1/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/bbc4edb345f62bc51e6d635d89c2f7491b635a94573e3e4a1ee7507543d44175/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/4000d06f182b7364430ecb2352365b22b94e8735abc86ad252452e6dc0291f19/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/00bc52d694d85d98777ba7fb99131b2200efde0090be13ba4fb60d3797de71cd/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/68802a2059647d935e886efa7c559499597c2b2a439b33fc8697bf7f5f33c756/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/d0b8dc00ce2ae635f350f3467bbeb19f77127473aac616ee85ec57b7b8bbced5/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/0b16f48392703af0638d6888dd3d011cd3c33a5b68e917e089b4cc6039a85d42/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/68bca255cce96165b45d6160e3dcf4826c69d5598e5d871e28d357cda289d0bb/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/a3a500317216bf411074c880f50b913dd705284400822e64d6cfec7e04d890f9/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/var/lib/docker/overlay2/e08ce90ea4a26a4f03de05e829103efade374e25cdab03e46e51515564a47985/merged" =
    { device = "overlay";
      fsType = "overlay";
    };

  fileSystems."/media/usb-stick" =
    { device = "/dev/disk/by-uuid/d2b6f782-b633-4e70-b0d6-5f85056621ef";
      fsType = "ext4";
    };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

