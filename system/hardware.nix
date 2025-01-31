{lib, inputs, ...}:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  powerManagement = {
    cpuFreqGovernor = "schedutil";
  };
}
