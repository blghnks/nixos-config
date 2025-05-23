{ config, pkgs, inputs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      dynamicBoost.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      prime = {
        amdgpuBusId = "PCI:69:0:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };

  services = {
    xserver = {
      videoDrivers = ["nvidia"];
    };
  };

  systemd = {
    services = {
      nvidia-oc = {
        script = ''
          ${pkgs.nix}/bin/nix-shell -I nixpkgs=${inputs.nixpkgs} /etc/nixos/scripts/nvidia-oc.nix
        '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };
}
