# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "qwerty"; # Define your hostname.

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 27014 ];
  };

  services.openvpn.servers = {
    serverVPN = { 
      config = '' config /home/hasan/openvpn/serverVPN/client.conf '';
    };
  };
}
