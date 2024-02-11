{ config, lib, pkgs, flags, ... }:

lib.optionalAttrs
  (flags.ui.theme.icon == "Reversal")
  {
    gtk.iconTheme.name = lib.mkForce "Reversal-blue";
    gtk.iconTheme.package = lib.mkForce (pkgs.reversal-icon-theme.override {
      colorVariants = [ "-blue" ];
    });
  }
