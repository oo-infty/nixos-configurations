{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.services.ssh;
in {
  config = lib.mkIf flags.enable {
    services.openssh.enable = true;
  };
}
