{ pkgs, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
in {
  programs = {
    direnv.enable = true;
    gamemode.enable = true;
    java.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    zsh.enable = true;

    corectrl = {
      enable = true;
      gpuOverclock = {
        enable = true;
        ppfeaturemask = "0xffffffff";
      };
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      ardour
      audacity
      beets
      bottles
      brave
      carla
      git
      glxinfo
      jamesdsp
      jdk17
      jdk8
      kdePackages.kdenlive
      krita
      librewolf
      lshw
      nvtopPackages.full
      obs-studio
      okteta
      onlyoffice-desktopeditors
      pciutils
      picard
      prismlauncher
      protonup
      protonup-qt
      protonvpn-gui
      qbittorrent
      reaper
      rnote
      ryzenadj
      steamtinkerlaunch
      tauon
      thunderbird
      unrar
      pkgs-stable.vesktop
      vlc
      vscodium-fhs
      vulkan-tools
      wget
      yabridge
      yabridgectl
    ];
  };
}
