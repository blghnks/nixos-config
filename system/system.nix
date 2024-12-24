{lib, pkgs, inputs, ...}:
{
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
    packages = with pkgs; [];
  };

  system.stateVersion = "24.11";
}
