{ pkgs, ... }:

{
  users.users.tux = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "tux";
    extraGroups = ["networkmanager" "wheel"];
    packages = [];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="plugdev"
  '';

  system.stateVersion = "24.11";
}
