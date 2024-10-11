{ config, pkgs, inputs, ... }:

let
  commonPackages = import ../../common-packages.nix { inherit pkgs inputs; };
  utilityPackages = import ../../utility-packages.nix { inherit pkgs inputs; };

in
{
  imports = [
    ./hardware-configuration.nix
    ../../common-config.nix
  ];

  networking = {
    hostName = "nixos-fx13";
  };

  boot = {
    kernelParams = [
    "amd_pstate=guided"
    "amdgpu.dcdebugmask=0x10"
    "amd_prefcore=disable"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelPatches = [
      { name = "mt7922-bt";
        patch = ../../patches/mt7922-bluetooth-patch;
      }
    ];
  };

  hardware = {
    nvidia = {
      # modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      # dynamicBoost.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        # offload = {
        #   enable = true;
        #   enableOffloadCmd = true;
        # };
        reverseSync.enable = true;
        amdgpuBusId = "PCI:105:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  services = {
    system76-scheduler.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    asusd = {
      enable = true;
      enableUserService = true;
    };
    supergfxd.enable = true;
    xserver = {
      videoDrivers = ["nvidia"];
    };
    pipewire = {
      extraConfig.pipewire = {
        "10-clock-rate" = {
          "context.properties" = {
            "default.clock.min-quantum" = 512;
          };
        };
      };
    };
  };

  programs = {
    kdeconnect.enable = true;
    htop.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      protontricks.enable = true;
    };
  };

  environment = {
    sessionVariables = rec {
      STEAM_FORCE_DESKTOPUI_SCALING = "2.00";
    };
    systemPackages = with pkgs; [
      maliit-keyboard
      supergfxctl-plasmoid
      ryzenadj
    ]
      ++commonPackages
      ++utilityPackages;
  };

  ## Startup script template
  # systemd = {
  #   services = {
  #     startup = {
  #       script = ''
  #
  #       '';
  #       wantedBy = [ "multi-user.target" ];
  #     };
  #   };
  # };

  powerManagement = {
    cpuFreqGovernor = "schedutil";
    # cpufreq = {
    #   min = 400000;
    #   max = 4000000;
    # };
  };

  system.stateVersion = "24.05";
}
