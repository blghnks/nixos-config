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
    # enableAllFirmware = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
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
    # hypridle.enable = true;
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
    # iio-hyprland.enable = true;
    # hyprlock.enable = true;
    # hyprland = {
    #   enable =true;
    #   xwayland.enable = true;
    # };
    direnv.enable = true;
    partition-manager.enable = true;
  };

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [pkgs.xdg-desktop-portal-gtk];
  # };

  environment = {
    sessionVariables = rec {
      NIXOS_OZONE_WL = "1";
    };
  };
}
