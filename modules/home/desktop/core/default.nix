{ config, lib, pkgs, inputs, ... }:

let
  flags = config.flags.packages.desktop;
in {
  imports = [
    ./alacritty
    ./fontconfig
    ./gtk
    ./qt
    ./scripts
    ./waybar

    ./mako.nix
    ./tofi.nix
    ./xdg.nix
  ];
  
  config = lib.mkIf flags.enable {
    home.packages = with pkgs; [
      keepassxc
      libnotify
    ] ++ (with inputs.nur-self.packages.${pkgs.system}; [
      fcitx5-fluent-dark
    ]);
  };
}
