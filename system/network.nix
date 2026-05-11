{ lib, pkgs-stable, ... }:
{
  networking = {
    hostName = "nixos-zephyrus";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
    };
  };

  services = {
    cloudflare-warp = {
      enable = true;
    };
    tailscale.enable = true;
  };

  systemd = {
    services = {
      cloudflare-warp.serviceConfig.LogLevelMax = "notice";
    };
    user = {
      services = {
        warp-taskbar = {
          enable = lib.mkForce false;
        };
      };
    };
  };
}
