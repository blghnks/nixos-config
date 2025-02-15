{ lib, pkgs, inputs, ... }:

{
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    printing.enable = true;

    asusd = {
      enable = true;
      enableUserService = true;
    };

    xserver = {
      enable = true;
    };
  };

  zramSwap = {
    enable = true;
  };

  systemd = {
    services = {
      startup = {
        script = ''
          ${pkgs.ryzenadj}/bin/ryzenadj --set-coall=0xFFFF0
          ${pkgs.coreutils}/bin/echo 80 | ${pkgs.coreutils}/bin/tee /sys/class/power_supply/BAT0/charge_control_end_threshold
        '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };
}
