{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-configuration.nix

    ../../system

    inputs.disko.nixosModules.default

    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd
  ];

  networking = {
    hostName = "lithium";
    hostId = "3d0eee50";
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.different = import ../../home/different/hosts/lithium;
  };

  # https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
