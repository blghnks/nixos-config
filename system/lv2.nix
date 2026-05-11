{ inputs, lib, config, pkgs, ...}:

let
  plugin_packages = with inputs.nixpkgs-stable.legacyPackages.x86_64-linux; [
    mda_lv2
    aether-lv2
    gxplugins-lv2
    rkrlv2
    distrho-ports
    plujain-ramp
    mod-distortion
    x42-plugins
    mooSpace
    kapitonov-plugins-pack
    molot-lite
    zam-plugins
    calf
    guitarix
    neural-amp-modeler-lv2
    surge-XT
    airwindows-lv2
  ];
  plugin_packages_lv2_dirs =
    lib.concatStrings (lib.intersperse ":" (lib.forEach plugin_packages (x: "${x}/lib/lv2")));
  plugin_packages_lv2_dirs_service =
    lib.concatStrings (lib.intersperse "/* " (lib.forEach plugin_packages (x: "${x}/lib/lv2")));
in
{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = plugin_packages;

  environment.variables = {
    LV2_PATH = plugin_packages_lv2_dirs;
  };

  systemd = {
    services = {
      lv2-linker = {
        script = ''
          for plugin in /home/blghn/.lv2/*; do
            if [ -L "$plugin" ]; then
              ${pkgs.coreutils}/bin/rm "$plugin"
            fi
          done
          for lv2Plugin in "${plugin_packages_lv2_dirs_service}"; do
            ${pkgs.coreutils}/bin/ln -s $lv2Plugin /home/blghn/.lv2
          done
        '';
        wantedBy = ["multi-user.target"];
        serviceConfig = {
          Type = "oneshot";
        };
      };
    };
  };
}
