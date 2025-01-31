{lib, pkgs, inputs, ...}:
{
  users.users.tux = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "tux";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };

  system.stateVersion = "24.11";
}
