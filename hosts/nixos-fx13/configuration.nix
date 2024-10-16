{ config, pkgs, inputs, ... }:

let
  common-pkgs = import ../../common-packages.nix { inherit pkgs inputs; };
  utility-pkgs = import ../../utility-packages.nix { inherit pkgs inputs; };
  # hyprland-pkgs = import ../../hyprland-packages.nix { inherit pkgs inputs; };
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
    "amdgpu.abmlevel=0"
    "amd_pstate=passive"
    "amdgpu.dcdebugmask=0x10"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelPatches = [
      { name = "mt7922-bt";
        patch = ../../patches/mt7922-bluetooth-patch; }
    ];
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
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
    #system76-scheduler.enable = true;
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
      ++common-pkgs
      ++utility-pkgs;
  };

  ## Startup script template
  systemd = {
    services = {
      startup = {
        script = ''
          "${pkgs.ryzenadj}/bin/ryzenadj" --apu-skin-temp=34 --dgpu-skin-temp=34 --tctl-temp=82
        '';
        wantedBy = ["multi-user.target"];
      };
    };
  };

  powerManagement = {
    cpuFreqGovernor = "schedutil";
    cpufreq = {
    #   min = 400000;
      max = 4600000;
    };
  };

  system.stateVersion = "24.05";
}
