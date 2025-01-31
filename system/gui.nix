{lib, pkgs, inputs, ...}:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager = {
      plasma6.enable = true;
    };
  };
  environment = {
    pathsToLink = [ "/share/zsh" ];
    plasma6.excludePackages = with
      pkgs.kdePackages; [
        khelpcenter
        plasma-browser-integration
        elisa
      ];
    sessionVariables = rec {
      NIXOS_OZONE_WL = "1";
    };
  };
}
