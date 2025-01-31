{lib, config, pkgs, inputs, ...}:
let
  btusb-mt7922-fix = pkgs.callPackage ../patches/btusb-mt7922-fix.nix {
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [
      "amdgpu.abmlevel=0"
      "amdgpu.dcdebugmask=0x10"
      "amdgpu.ppfeaturemask=0xffffffff"
      "rcutree.enable_rcu_lazy=1"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [
      (btusb-mt7922-fix.overrideAttrs (_: {
        patches = [../patches/mt7922-bluetooth-patch];
      }))
    ];
  };
}
