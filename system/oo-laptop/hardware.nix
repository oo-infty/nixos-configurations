{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Kernel
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "thunderbolt" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/efi";
    };

    grub = {
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Filesystem
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/da0a89e7-d64d-48d8-a81e-13f7c02855e0";
      fsType = "btrfs";
      options = [ "subvol=@rootfs" "compress=zstd" ];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/da0a89e7-d64d-48d8-a81e-13f7c02855e0";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" ];
    };

    "/efi" = {
      device = "/dev/disk/by-uuid/54F4-0F5C";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/da0a89e7-d64d-48d8-a81e-13f7c02855e0";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/eb6c6178-6a0e-4a7e-a26e-9be4c3555d04"; } ];

  boot.tmp = {
    useTmpfs = true;
    tmpfsSize = "100%";
  };

  services.fstrim.enable = true;

  # Driver
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libva
      intel-media-driver
      linux-firmware
    ];
  };

  hardware.nvidia = {
    modesetting.enable = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = false;
      };

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Power management
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;

    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      SCHED_POWERSAVE_ON_AC = 0;
      SCHED_POWERSAVE_ON_BAT = 1;

      START_CHARGE_THRESH_BAT1 = 80;
      STOP_CHARGE_THRESH_BAT1 = 85;
    };
  };

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "nvidia-offload" ''
      export __NV_PRIME_RENDER_OFFLOAD=1
      export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export __VK_LAYER_NV_optimus=NVIDIA_only
      unset __EGL_VENDOR_LIBRARY_FILENAMES
      exec "$@"
    '')
  ];

  # Network
  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  # Platform
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
