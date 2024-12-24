{lib, inputs, ...}:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  services = {
    cloudflare-warp.enable = true;
    tailscale.enable = true;
  };

  systemd = {
    user = {
      services = {
        warp-taskbar = {
          wantedBy = lib.mkForce [];
        };
      };
    };
  };
}
