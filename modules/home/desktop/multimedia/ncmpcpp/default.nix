{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.multimedia;
in {
  config = lib.mkIf flags.enable {
    programs.ncmpcpp = {
      enable = true;
  
      package = pkgs.ncmpcpp.override {
        visualizerSupport = true;
      };
  
      settings = {
        visualizer_output_name = "MPD Visualizer Data FIFO";
        visualizer_data_source = "/tmp/mpd-visualizer-data.fifo";
        visualizer_in_stereo = "yes";
        visualizer_type = "spectrum";
        visualizer_look = "+|";
      };
    };
  };
}
