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
      # gpuOverclock = {
      #   enable = true;
      #   ppfeaturemask = "0xffffffff";
      # };
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      kdePackages.krdp
      ardour
      audacity
      bottles
      brave
      carla
      git
      glxinfo
      pkgs-stable.jamesdsp
      jdk17
      jdk8
      kdePackages.kdenlive
      kdePackages.plasma-thunderbolt
      krita
      librewolf
      lshw
      nil
      nvtopPackages.full
      neovim
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
      vesktop
      vlc
      vulkan-tools
      wget
      zapzap
      vscodium-fhs
    ];
  };
}
