{ lib, ... }:
{
  hardware = {
    cpu = {
      amd.ryzen-smu.enable = true;
    };
    amdgpu = {
      overdrive.enable = true;
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
    openrazer = {
      enable = true;
      users = [  "blghn" ];
      batteryNotifier.enable = false;
    };
  };
#   services = {
#     hardware = {
#       bolt.enable = true;
#     };
#   };
}
