{ lib, config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./system/boot.nix
    ./system/gui.nix
    ./system/hardware.nix
    ./system/locales.nix
    ./system/network.nix
    ./system/nvidia.nix
    ./system/programs.nix
    ./system/services.nix
    ./system/sound.nix
    ./system/system.nix
  ];
}
