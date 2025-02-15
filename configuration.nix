{ lib, config, pkgs, inputs, ... }:
{
  imports = [
    ./system
    ./hardware-configuration.nix
  ];
}
