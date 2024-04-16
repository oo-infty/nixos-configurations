{ config, lib, pkgs, ... }:

{
  imports = [
    # Common modules
    ../../modules/flags
  ];

  environment.packages = with pkgs; [
    helix
    git
  ];

  environment.etcBackupExtension = ".bak";

  time.timeZone = "Asia/Shanghai";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "24.05";
}