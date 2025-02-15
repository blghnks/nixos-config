{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./boot.nix
    ./gui.nix
    ./hardware.nix
    ./locales.nix
    ./network.nix
    ./nix.nix
    ./nvidia.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./system.nix
  ];
}
