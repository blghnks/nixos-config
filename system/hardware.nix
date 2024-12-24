{lib, inputs, ...}:
{
  hardware = {
    cpu.amd.ryzen-smu.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  powerManagement = {
    cpufreq.max = 3800000;
    cpuFreqGovernor = "ondemand";
  };
}
