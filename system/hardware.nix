{
  hardware = {
    amdgpu = {
      overdrive = {
        enable = true;
        ppfeaturemask = "0xfff7ffff";
      };
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

  powerManagement.cpufreq = {
    min = 200000;
#     max = 4000000;
  };

  services.hardware.bolt.enable = true;
}
