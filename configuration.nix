{ config, pkgs, inputs, ... }:

let
  common-pkgs = import ./common-packages.nix { inherit pkgs inputs; };
  btusb-mt7922-fix = pkgs.callPackage ./patches/btusb-mt7922-fix.nix {
    kernel = config.boot.kernelPackages.kernel;
  };
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelParams = ["amdgpu.abmlevel=0" "amdgpu.dcdebugmask=0x10"];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [
      (btusb-mt7922-fix.overrideAttrs (_: {
        patches = [./patches/mt7922-bluetooth-patch];
      }))
    ];
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    pulseaudio.enable = false;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      # dynamicBoost.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
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

  security.rtkit.enable = true;

  time.timeZone = "Europe/Istanbul";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LANGUAGE = "en_GB.UTF-8";
        LC_ALL = "en_GB.UTF-8";
        LC_ADDRESS = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LANG = "en_GB.UTF-8";
    };
  };

  zramSwap = {
    enable = true;
  };

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
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
    xserver = {
      enable = true;
      xkb = {
        layout = "tr";
        variant = "";
      };
    };
    tailscale.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager = {
      plasma6.enable = true;
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  console.keyMap = "trq";

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  users.users.tux = {
    isNormalUser = true;
    description = "tux";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
    ];
  };

  programs = {
    direnv.enable = true;
    partition-manager.enable = true;
    kdeconnect.enable = true;
    htop.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  environment = {
    systemPackages = with pkgs; []
      ++common-pkgs;
    sessionVariables = rec {
      NIXOS_OZONE_WL = "1";
      STEAM_FORCE_DESKTOPUI_SCALING = "1.80";
    };
  };

  systemd = {
    services = {
      startup-tux = {
        script = ''
          "${pkgs.ryzenadj}/bin/ryzenadj" -a 18000 -b 21000 -c 16000 -f 76
          cd ${pkgs.coreutils}/bin
          cp /sys/class/power_supply/BAT0/charge_control_end_threshold /tmp
          echo 80 > /tmp/charge_control_end_threshold
          cp /tmp/charge_control_end_threshold /sys/class/power_supply/BAT0/charge_control_end_threshold
          rm /tmp/charge_control_end_threshold
        '';
        wantedBy = ["multi-user.target"];
      };
    };
  };

  system.stateVersion = "24.05";
}
