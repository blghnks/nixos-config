{ pkgs, ... }:

let
  acpi-override = ../patches/s3-sleep-acpi-override-beta;
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
      "rcutree.enable_rcu_lazy=1"
    ];
  };
}
