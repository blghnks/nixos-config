{ config, pkgs, ... }:

let
  btusb-mt7922-fix = pkgs.callPackage ../patches/btusb-mt7922-fix.nix {
    kernel = config.boot.kernelPackages.kernel;
  };
  tether-fix = pkgs.callPackage ../patches/tether-fix.nix {
    kernel = config.boot.kernelPackages.kernel;
  };
in {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "amdgpu.abmlevel=0"
      # "amdgpu.dcdebugmask=0x10"
      "rcutree.enable_rcu_lazy=1"
    ];
    extraModulePackages = [
      (btusb-mt7922-fix.overrideAttrs (_: {
        patches = [ ../patches/mt7922-bluetooth-patch ];
      }))
      (tether-fix.overrideAttrs (_: {
        patches = [ ../patches/rndis-patch ];
      }))
    ];
  };
}
