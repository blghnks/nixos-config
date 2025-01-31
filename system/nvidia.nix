{lib, config, pkgs, inputs, ...}:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      dynamicBoost.enable = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:105:0:0";
        nvidiaBusId = "PCI:1:0:0";
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
