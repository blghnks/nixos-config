{ lib, pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      # home-manager
    ];
    username = "tux";
    homeDirectory = "/home/tux";
    stateVersion = "25.05";
  };
  programs = {
    home-manager.enable = true;
  };
}
