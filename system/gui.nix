{ pkgs, ... }:

{
  services = {
    xserver.enable = true;
    displayManager = {
      ly.enable = true;
    };
    desktopManager = {
      plasma6.enable = true;
      cosmic = {
        enable = true;
      };
    };
  };
  programs = {
    niri.enable = true;
  };
  environment = {
    pathsToLink = [ "/share/zsh" ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      HSA_OVERRIDE_GFX_VERSION = "10.3.0";
    };

    cosmic.excludePackages = [ pkgs.networkmanagerapplet ];

    plasma6.excludePackages = with pkgs.kdePackages; [
      khelpcenter
      plasma-browser-integration
      elisa
    ];
  };
  xdg = {
    portal = {
      extraPortals = [ 
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
}
