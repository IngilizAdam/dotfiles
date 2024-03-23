# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "the-swan"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    tlp
  ];

  # Prevent sleeping when laptop lid closed
  services.logind.lidSwitch = "ignore";

  # Turn off p-p-d and use tlp instead
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC  = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGU_PERF_POLICY_ON_AC  = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MIN_PERF_ON_AC  = 50;
      CPU_MAX_PERF_ON_AC  = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 30;
    };
  };

  services.xserver.libinput = {
    enable = true;
    touchpad = {
      additionalOptions = ''
        libinput "Scrolling Pixel Distance" 10
      '';
    };
  };
 
  services.openvpn.servers = {
    serverVPN = {
      config = '' config /home/hasan/openvpn/serverVPN/client.conf '';
    };
  };

}
