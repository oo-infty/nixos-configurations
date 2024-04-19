{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.core;
in {
  config = lib.mkIf flags.enable {
    environment.packages = with pkgs; [
      curl
      helix
      zsh
    ];
  };
}
