{
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
      "10-clock-rate" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [44100 48000 96000 192000];
          "default.clock.min-quantum" = 1024;
          "default.clock.max-quantum" = 4096;
          "default.clock.quantum" = 1536;
          "default.clock.quantum-limit" = 8192;
          "default.clock.quantum-floor" = 1024;
        };
      };
    };
    wireplumber = {
      enable = true;
    };
  };
}
