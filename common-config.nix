{ config, pkgs, inputs, ... }:

{
  networking = {
    networkmanager.enable = true;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  hardware = {
    enableAllFirmware = true;
    bluetooth = {
      enable = true;
    };
    pulseaudio.enable = false;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  security.rtkit.enable = true;

  time.timeZone = "Europe/Istanbul";

  i18n = {
    defaultLocale = "tr_TR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "tr_TR.UTF-8";
      LC_IDENTIFICATION = "tr_TR.UTF-8";
      LC_MEASUREMENT = "tr_TR.UTF-8";
      LC_MONETARY = "tr_TR.UTF-8";
      LC_NAME = "tr_TR.UTF-8";
      LC_NUMERIC = "tr_TR.UTF-8";
      LC_PAPER = "tr_TR.UTF-8";
      LC_TELEPHONE = "tr_TR.UTF-8";
      LC_TIME = "tr_TR.UTF-8";
    };
  };

  zramSwap = {
    enable = true;
  };

  services = {
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
      # cosmic-greeter.enable = true;
    };
    desktopManager = {
      plasma6.enable = true;
      # cosmic.enable = true;
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      # wireplumber.enable = true;
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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  programs = {
    direnv.enable = true;
    partition-manager.enable = true;
  };

  environment = {
    sessionVariables = rec {
      NIXOS_OZONE_WL = "1";
    };
  };
}
