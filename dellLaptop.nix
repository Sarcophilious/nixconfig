{ config, lib, pkgs, ... }:
let
  sources = import ./npins
in {
  import = [
    ./dellLaptop.nix
    (sources.nixos-hardware + "/dell/latitude/7390")
  ];
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.hardware.bolt.enable = true;


  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];
  systemd.services.dlm.wantedBy = [ "multi-user.target" ];
  environment.systemPackages = with pkgs; [
    displaylink
  ];
}
