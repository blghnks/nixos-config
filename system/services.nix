{ pkgs, ... }:

{
  services = {
    mysql = {
      enable = true;
      package = pkgs.mysql84;
    };
#     scx = {
#       enable = true;
#       scheduler = "scx_lavd";
#     };
    switcherooControl.enable =true;
#     asusd.enable = true;
    supergfxd.enable = true;
    system76-scheduler.enable = true;
    fstrim.enable = true;
    fwupd.enable = true;
    printing.enable = true;
  };

  zramSwap = {
    enable = true;
  };

  systemd = {
    services = {
      startup = {
        script = ''
          ${pkgs.coreutils}/bin/echo "84" > /sys/class/power_supply/BAT0/charge_control_end_threshold
        '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
      byedpi = {
        script = ''
          ${pkgs.byedpi}/bin/ciadpi -r 1+s
        '';
      };
    };
  };
}
