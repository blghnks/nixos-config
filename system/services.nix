{ pkgs, ... }:

{
  services = {
    fstrim.enable = true;
    fwupd.enable = true;
    printing.enable = true;
    system76-scheduler.enable = true;

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
          ${pkgs.coreutils}/bin/echo 84 | ${pkgs.coreutils}/bin/tee /sys/class/power_supply/BAT0/charge_control_end_threshold
          '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };
}
