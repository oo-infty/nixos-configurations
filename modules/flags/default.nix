{ config, lib, pkgs, constants, ... }:

{
  imports = [
    ./declaration.nix
    ./${constants.hostname}.nix
  ];

  flags = {
    ui = {
      colorscheme = "One Dark";

      theme = {
        window = "Orchis";
        icon = "Reversal";
        cursor = "Vimix";
        mode = "Dark";
      };
    };

    packages = {
      core = {
        enable = true;
      };

      cli = {
        enable = true;
      };

      desktop = {
        environment = {
          gnome = {
            enable = false;
          };
  
          hyprland = {
            enable = false;
            dev = false;
          };
        };

        communication.enable = false;
        i18n.enable = false;
        multimedia.enable = false;
        network.enable = false;
        production.enable = false;
      };

      development = {
        enable = false;
      };

      services = {
        enable = false;
        bluetooth.enable = false;
        network.enable = false;
        proxy.enable = false;
        sound.enable = false;
      };
    };
  };
}
