{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox-devedition-bin
  ];
}
