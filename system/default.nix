{ lib, config, pkgs, inputs, ... }:
{
  imports = [
    ./boot.nix
    ./gui.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./locales.nix
    ./network.nix
    ./nix.nix
    ./nvidia.nix
    ./programs.nix
    ./services.nix
    ./sound.nix
    ./system.nix
  ];
}
