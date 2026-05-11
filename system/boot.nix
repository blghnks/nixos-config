{ config, pkgs, ... }:

let
  acpi-override = ../patches/s3-sleep-acpi-override;
in
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.prepend = [ "${acpi-override}" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "mem_sleep_default=deep"
    ];
  };
}