{ lib, ...}:

{
  networking = {
    hostName = "nixos";

    networkmanager.enable = true;

    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
    };
  };

  services = {
    resolved.enable = true;
    cloudflare-warp = {
      enable = true;
      openFirewall = true;
    };

    tailscale.enable = true;
  };

  systemd = {
    user = {
      services = {
        warp-taskbar = {
          enable = lib.mkForce false;
        };
      };
    };
  };
}
