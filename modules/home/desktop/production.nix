{ config, lib, pkgs, inputs, ... }:

let
  flags = config.flags.packages.desktop.production;
in {
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      calibre
      logseq
      newsflash
    ];
  };
}
