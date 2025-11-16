{ lib, ... }:
{
  hardware = {
    cpu = {
      amd.ryzen-smu.enable = true;
    };
    amdgpu = {
      overdrive = {
        enable = true;
      };
      opencl.enable = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  powerManagement = {
    cpufreq = {
      min = 200000;
      max = 4000000;
    };
  };

  services = {
    hardware.bolt.enable = true;
  };
}
