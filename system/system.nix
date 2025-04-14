{ pkgs, ... }:

{
  users.users.tux = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "tux";
    extraGroups = ["networkmanager" "wheel"];
    packages = [];
  };

  system.stateVersion = "24.11";
}
