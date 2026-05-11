{ pkgs, ... }:

{
  services = {
    scx = {
      enable = true;
      scheduler = "scx_lavd";
      extraArgs = [
        "--per-cpu-dsq"
        "--autopower"
      ];
    };
#     system76-scheduler.enable = true;
    switcherooControl.enable =true;
    asusd.enable = true;
    supergfxd.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    printing.enable = true;
  };

  zramSwap = {
    enable = true;
  };

  systemd = {
    services = {
      "polkit-agent-helper@" = {
        overrideStrategy = "asDropin";
        serviceConfig = {
          ReadOnlyPaths = "/usr/lib/security";
          ProtectHome = "no";
          PrivateDevices = "no";
          DeviceAllow = "char-video4linux rw";
        };
      };
      startup = {
        script = ''
          ${pkgs.coreutils}/bin/echo "84" > /sys/class/power_supply/BAT0/charge_control_end_threshold
        '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };
}
