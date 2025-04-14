{ lib, pkgs, ...}:
{
  home = {
    packages = with pkgs; [
      # home-manager
    ];
    username = "tux";
    homeDirectory = "/home/tux";
    stateVersion = "24.11";
  };
  programs = {
    home-manager.enable = true;
  };
}
