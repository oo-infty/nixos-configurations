{ config, lib, pkgs, ... }:

{
  age.secrets = {
    "github-cli-auth-oo-laptop.age".rekeyFile = ./github-cli-auth-oo-laptop.age;
    "github-cli-auth-oo-matepad.age".rekeyFile = ./github-cli-auth-oo-matepad.age;
  };
}
