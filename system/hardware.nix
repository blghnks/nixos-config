{
  services.hardware.bolt.enable = true;

  powerManagement.cpuFreqGovernor = "ondemand";

  hardware = {
    cpu.amd.ryzen-smu.enable = true;
    sensor.iio.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
