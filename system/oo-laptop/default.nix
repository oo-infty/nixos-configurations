{ config, lib, pkgs, constants, ... }:

{
  imports = [
    # Common modules
    ../../modules/flags
    ../../modules/nixos

    # System-specific modules
    ./hardware.nix
    ./virtualization.nix
    ./secrets.nix
  ];

  networking.hostName = "oo-laptop";

  time.timeZone = "Asia/Shanghai";

  users.users.${constants.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "dialout" ];
  };
 
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";

    # this sets the default vendor to integrated video card, which fixes slow
    # startup time of EGL-based softwares in machines with hybrid graphics
    # under Wayland.
    __EGL_VENDOR_LIBRARY_FILENAMES =
      "${pkgs.mesa_drivers}/share/glvnd/egl_vendor.d/50_mesa.json";
  };

  system.stateVersion = "24.05";
}

