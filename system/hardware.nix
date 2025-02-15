{ lib, inputs, ... }:

{
  hardware = {
    cpu.amd.ryzen-smu.enable = true;

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
