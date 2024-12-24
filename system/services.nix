{lib, pkgs, inputs, ...}:
{
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    xserver = {
      enable = true;
    };
    system76-scheduler = {
      enable = true;
      useStockConfig =true;
    };
    printing.enable = true;
  };

  zramSwap = {
    enable = true;
  };

  systemd = {
    services = {
      startup = {
        script = ''
          ${pkgs.ryzenadj}/bin/ryzenadj --set-coall=0xFFFE2
          cd ${pkgs.coreutils}/bin
          cp /sys/class/power_supply/BAT0/charge_control_end_threshold /tmp
          echo 80 > /tmp/charge_control_end_threshold
          cp /tmp/charge_control_end_threshold /sys/class/power_supply/BAT0/charge_control_end_threshold
          rm /tmp/charge_control_end_threshold
        '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };
}
